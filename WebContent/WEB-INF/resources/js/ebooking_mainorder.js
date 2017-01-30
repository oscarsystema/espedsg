  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";

  
  function setBlockUI(element){
	  jq.blockUI({ message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT});
  }
  
  jq(function() {
	  jq("#dateTODO").datepicker({ 
		  dateFormat: 'yymmdd'
		  //,defaultDate: "-1m"	  
	  });
	  
	  
  });
  
//==============================================================================
  //START - Postal codes On-Blur (required to be an exact number and nothing else)
  //==============================================================================
  jq(function() {
	  	/*
	  	jq('#hesdf').focus(function() {
	  	  if(jq('#hesdf').val()=='' && jq('#heads3').val()!=''){
	  		  var sellersPostalCodeRaw = jq('#heads3').val();
	  		  var postalCode = sellersPostalCodeRaw.substr(0,sellersPostalCodeRaw.indexOf(' '));
	  		  jq('#hesdf').val(postalCode);
	  	  }
	  	});
	    jq('#hesdf').blur(function() {
	    	var id = jq('#hesdf').val();
	    	if(id!=null && id!=""){
	    		var countryCode = jq('#helka').val();
	    		getCity(CITY_OWNwppns1,id,countryCode);
	    	}else{
	    		jq('#OWNwppns1').val("");
	    	}
		});
		*/
	    jq('#hesdfIdLink').click(function() {
	    	jq('#hesdfIdLink').attr('target','_blank');
	    	window.open('ebooking_childwindow_postalcodes.do?action=doInit&direction=fra&st2lk=' + jq('#helka').val() + '&st2kod=' + jq('#hesdf').val() + '&caller=hesdf', "postalcodeWin", "top=300px,left=450px,height=600px,width=800px,scrollbars=no,status=no,location=no");
	    });
	    jq('#hesdfIdLink').keypress(function(e){ //extra feature for the end user
			if(e.which == 13) {
				jq('#hesdfIdLink').click();
			}
	    });
	    //hesdt
	    jq('#hesdtIdLink').click(function() {
	    	jq('#hesdtIdLink').attr('target','_blank');
	    	window.open('ebooking_childwindow_postalcodes.do?action=doInit&direction=til&st2lk=' + jq('#hetri').val() + '&st2kod=' + jq('#hesdt').val() + '&caller=hesdt', "postalcodeWin", "top=300px,left=450px,height=600px,width=800px,scrollbars=no,status=no,location=no");
	    });
	    jq('#hesdtIdLink').keypress(function(e){ //extra feature for the end user
			if(e.which == 13) {
				jq('#hesdtIdLink').click();
			}
	    });
	    
  });
  
  
  
//-----------------------
  //INIT CUSTOMER Object
  //-----------------------
  var map = {};
  //init the customer object in javascript (will be put into a map)
  var customer = new Object();
  //fields
  customer.kundnr = "";customer.knavn = "";customer.adr1 = "";
  customer.adr2 = "";customer.adr3 = ""; customer.land = ""; customer.auxnavn=""; customer.auxtlf=""; customer.auxmail="";
  //--------------------------------------------------------------------------------------
  //Extra behavior for Customer number ( without using (choose from list) extra roundtrip)
  //--------------------------------------------------------------------------------------
  jq(function() {  
	  	//SHIPPER/CONSIGNOR
	    jq('#hekns').blur(function() {
	    	getConsignor();	
		});
	    function getConsignor(){
	    	var hekns = jq('#hekns').val();
    		if(hekns!=null && hekns!=""){
	    		jq.getJSON('searchCustomer_Ebooking.do', {
				applicationUser : jq('#applicationUser').val(),
				customerName : "",
				customerNumber : jq('#hekns').val(),
				ajax : 'true'
	    		}, function(data) {
					//alert("Hello");
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						customer = new Object();
						customer.kundnr = data[i].kundnr;
						customer.knavn = data[i].navn;
						customer.auxnavn = data[i].auxnavn;
						customer.adr1 = data[i].adr1;
						customer.adr2 = data[i].adr2;
						customer.adr3 = data[i].adresse;
						customer.land = data[i].land;
						customer.auxtlf = data[i].auxtlf;
						customer.auxmail = data[i].auxmail;
						map[customer.kundnr] = customer;
					}
					if(len > 0){
						//always show seller
						var seller = customer.knavn;
						jq('#whenas').val(seller);
		    			//now check ids (name and address in order to overdrive (when applicable)
						var name = jq('#henas').val().trim();
		    			//var address = jq('#heads1').val().trim();
		    			//only if name is empty
		    			if(name==''){
							jq('#hekns').val(customer.kundnr);
							jq('#whenas').val(seller);
							if(customer.auxnavn!=''){
								jq('#henas').val(customer.auxnavn);
							}else{
								//fallback 
								jq('#henas').val(jq('#whenas').val());
							}
							jq('#heads1').val(customer.adr1);
							jq('#heads2').val(customer.adr2);
							jq('#heads3').val(customer.adr3 + " " +  customer.land);
							jq('#wsscont').val("");
							jq('#wsstlf').val(customer.auxtlf);
							jq('#wssmail').val(customer.auxmail);
							//Form field on "Fra"
							jq('#helka').val(customer.land);
		    			}	
					}else{
						//init fields
						jq('#hekns').val("");
						jq('#whenas').val("");
						jq('#henas').val("");
						jq('#heads1').val("");
						jq('#heads2').val("");
						jq('#heads3').val("");
					}
	    		});
    		}
	    }
	    
	    
	    //CONSIGNEE
	    jq('#heknk').blur(function() {
	    	getConsignee();
		});
	    function getConsignee(){
	    	var heknk = jq('#heknk').val();
    		if(heknk!=null && heknk!=""){
				jq.getJSON('searchCustomer_Ebooking.do', {
				applicationUser : jq('#applicationUser').val(),
				customerName : "",
				customerNumber : jq('#heknk').val(),
				ajax : 'true'
				}, function(data) {
					//alert("Hello");
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						customer = new Object();
						customer.kundnr = data[i].kundnr;
						customer.knavn = data[i].navn;
						customer.adr1 = data[i].adr1;
						customer.adr2 = data[i].adr2;
						customer.adr3 = data[i].adresse;
						customer.land = data[i].land;
						customer.auxnavn = data[i].auxnavn;
						customer.auxtlf = data[i].auxtlf;
						customer.auxmail = data[i].auxmail;
						map[customer.kundnr] = customer;
					}
					if(len > 0){
						var buyer = customer.knavn;
						jq('#whenak').val(buyer);
						
						var name = jq('#henak').val().trim();
	    				//var address = jq('#headk1').val().trim();
	    				//only if name is empty
	    				if(name==''){
							jq('#heknk').val(customer.kundnr);
							jq('#whenak').val(buyer);
							if(customer.auxnavn!=''){
								jq('#henak').val(customer.auxnavn);
							}else{
								//fallback
								jq('#henak').val(jq('#whenak').val());
							}
							jq('#headk1').val(customer.adr1);
							jq('#headk2').val(customer.adr2);
							jq('#headk3').val(customer.adr3 + " " + customer.land);
							jq('#wskcont').val("");
							jq('#wsktlf').val(customer.auxtlf);
							jq('#wskmail').val(customer.auxmail);
							//Form field on "Til"
							jq('#hetri').val(customer.land);
	    				}
					}else{
						//init fields
						jq('#heknk').val("");
						jq('#whenak').val("");
						jq('#henak').val("");
						jq('#headk1').val("");
						jq('#headk2').val("");
						jq('#headk3').val("");
					}
				});
    		}
	    }
	    //---------------------------------------------
	    //OPPDGIV - PRINCIPAL - Get cascade other id's
	    //---------------------------------------------
	    /*
	    jq('#trknfa').blur(function() {
    		getPrincipalName();
	    });
	    //Invoice parties
	    function setInvoiceParties() {
	    	var SELLER = "S"; var BUYER = "K";
			var id = jq('#trknfa').val();
			if(id!=null && id!=""){
				if(SELLER==jq('#trkdak').val()){
					//(A) Seller Invoice party
					//if(jq('#heknsf').val()==''){
						jq('#heknsf').val(jq('#varFakknr').val());
	    				jq('#heknkf').val("");
	    				jq('#henakf').val("");
	    				getInvoicePartySeller();
					//}
					//(B) Sender-Consignor
					if(jq('#hekns').val()==''){
	    				jq('#hekns').val(id);
	    				jq('#hekns').blur(); //trigger the Consignor event
					}
				}else if(BUYER==jq('#trkdak').val()){
					//(A) Buyer Invoice party
					//if(jq('#heknkf').val()==''){
	    				jq('#heknkf').val(jq('#varFakknr').val());
	    				jq('#heknsf').val("");
	    				jq('#henasf').val("");
	    				getInvoicePartyBuyer();
					//}
					//(B) Receiver-Consignee
					if(jq('#heknk').val()==''){
	    				jq('#heknk').val(id);
	    				jq('#heknk').blur(); //trigger the Consignee event
					}
				}
			}
	    	
	    };
	    //OPPDGIV. code
	    jq(function() { 
		    jq('#trkdak').change(function() {
		    	setInvoiceParties();
		    	jq('#trknfa').focus();
		    	if(jq('#trkdak').val()=='S'){
		    		//if(jq('#hefr').val() == ''){
		    			jq('#hefr').val('S');
		    		//}
		    	} else if(jq('#trkdak').val()=='K'){
		    		//if(jq('#hefr').val() == ''){
		    			jq('#hefr').val('M');
		    		//}
		    	}
		    });
	    });
	    //Fakturapart Seller
	    jq('#heknsf').blur(function() {
	    	getInvoicePartySeller();
		});
	    //Fakturapart Buyer
	    jq('#heknkf').blur(function() {
	    	getInvoicePartyBuyer();
	    });
	    //-------------------
	    //getPrincipalName()
	    //-------------------
	    function getPrincipalName() {
	    	var id = jq('#trknfa').val();
    		if(id!=null && id!=""){
    			jq.getJSON('searchCustomer_TransportDisp.do', {
				applicationUser : jq('#applicationUser').val(),
				customerName : "",
				customerNumber : id,
				ajax : 'true'
	    		}, function(data) {
	    			//alert("Hello");
	    			jq('#henaa').val("");
	    			var len = data.length;
	    			for ( var i = 0; i < len; i++) {
	    				jq('#henaa').val(data[i].navn);
	    				jq('#varFakknr').val(data[i].fakknr);
	    				//----------------------------------------------------------------------------------------------
	    				//INVOICE Parties fragment
	    				//HAS TO BE HERE. 
	    				//Can not move this fragment outside this ajax call. Otherwise there will not be a sync call...
	    				//-----------------------------------------------------------------------------------------------
	    				setInvoiceParties();
	    			}
				});
    		}
	    }
	    //--------------------------
	    //getInvoicePartySeller()
	    //--------------------------
	    function getInvoicePartySeller() {
	    	var id = jq('#heknsf').val();
    		if(id!=null && id!=""){
	    		jq.getJSON('searchCustomer_TransportDisp.do', {
				applicationUser : jq('#applicationUser').val(),
				customerName : "",
				customerNumber : id,
				ajax : 'true'
	    		}, function(data) {
	    			jq('#henasf').val("");
	    			var len = data.length;
	    			for ( var i = 0; i < len; i++) {
	    				if(data[i].aktkod != 'I'){
	    					jq('#henasf').val(data[i].navn);
	    					//jq('#heknsf').addClass( "inputTextMediumBlueUPPERCASE" );
	    					jq('#heknsf').removeClass ("isa_warning");
	    					jq('#henasf').removeClass ("isa_warning");
	    				}else{
	    					jq('#heknsf').addClass( "isa_warning" );
	    					jq('#henasf').addClass( "isa_warning" );
	    					//jq('#heknsf').removeClass ("inputTextMediumBlueUPPERCASE");
	    					jq('#henasf').val("adr.kunde?" + data[i].navn);
	    				}
	    			}
	    		});
    		}else{
    			jq('#henasf').val("");
    		}
	    }
	    //--------------------------
	    //getInvoicePartyBuyer()
	    //--------------------------
	    function getInvoicePartyBuyer() {
    		var id = jq('#heknkf').val();
    		if(id!=null && id!=""){
	    		jq.getJSON('searchCustomer_TransportDisp.do', {
				applicationUser : jq('#applicationUser').val(),
				customerName : "",
				customerNumber : id,
				ajax : 'true'
	    		}, function(data) {
	    			jq('#henakf').val("");
	    			var len = data.length;
	    			for ( var i = 0; i < len; i++) {
	    				jq('#henakf').val(data[i].navn);
	    				
	    				if(data[i].aktkod != 'I'){
	    					jq('#henakf').val(data[i].navn);
	    					jq('#heknkf').removeClass ("isa_warning");
	    					jq('#henakf').removeClass ("isa_warning");
	    				}else{
	    					jq('#heknkf').addClass( "isa_warning" );
	    					jq('#henakf').addClass( "isa_warning" );
	    					jq('#henakf').val("adr.kunde?" + data[i].navn);
	    				}
	    				
	    			}
	    		});
    		}else{
    			jq('#henakf').val("");
    		}
		}
	    */
	});
  

  
  
  
  

  
  