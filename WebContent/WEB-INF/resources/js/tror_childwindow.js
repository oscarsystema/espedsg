	//============================================================
	//General functions for EBOOKING Child Search windows
	//============================================================
	//this variable is a global jQuery var instead of using "$" all the time. Very handy
  	var jq = jQuery.noConflict();
  	var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";
  	
  	function setBlockUI(element){
  	  jq.blockUI({ message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT});
    }
  	
  	jq(function() {
  		//Triggers on drag-and-drop to upload
		jq('#file').change(function(){
			jq('#uploadFileForm').submit();
			
		});
  	});
  	
  	//Vedlikehold adresser
  	jq(function() {
  		/*
	  	jq('#deliveryAdrMaintButton').click(function() {
	  		window.open('ebooking_childwindow_customer_addresses_vedlikehold.do?action=doInit', "deliveryAdrMaintWin", "top=300px,left=300px,height=400px,width=400px,scrollbars=yes,status=no,location=no");
	    });
	  	
	    jq('#deliveryAdrMaintButton').keypress(function(e){ //extra feature for the end user
			if(e.which == 13) {
				jq('#deliveryAdrMaintButton').click();
			}
	    });
	    */
	    
  	});
  	
  //Customer
	jq(function() {
		jq('#customerList').on('click', 'td', function(){
		  var id = this.id;
		  var record = id.split('@');
		  var kundNr = record[0].replace("kundnr_", "");
		  var navn = record[1].replace("navn_", "");
		  var adr1 = record[2].replace("adr1_", "");
		  var adr2 = record[3].replace("adr2_", "");
		  var postnrsted = record[4].replace("postnrsted_", "");
		  var kundName = record[5].replace("kundname_", "");
		  var kundAddress = record[6].replace("kundaddress_", "");
		  
		  
		  //alert(kundNr + " type:" + jq('#ctype').val() + "-->customerName:" + customerName);
		  //addressing a parent field from this child window
		  if(jq('#ctype').val()=='s'){
			  //shipper/consignor 	
			  opener.jq('#hekns').val(kundNr);
			  
			  if(opener.jq('#xfakBet').val() != 'M'){
				  opener.jq('#heknsf').val(kundNr);
		  	  }
			  opener.jq('#whenas').val(kundName + " - " + kundAddress);
			  
			  opener.jq('#henas').val(navn);
			  opener.jq('#henas').removeClass( "isa_error" );
			  
			  opener.jq('#heads1').val(adr1);
			  opener.jq('#heads2').val(adr2);
			  opener.jq('#heads3').val(postnrsted);
			  opener.jq('#hekns').focus();
			  
		  }else if(jq('#ctype').val()=='a'){
			  //agent  
			  opener.jq('#trknfa').val(kundNr);
			  opener.jq('#trknfa').focus();
		  
		  }else if(jq('#ctype').val()=='c'){
			  //consignee
			  opener.jq('#heknk').val(kundNr);
			  if(opener.jq('#xfakBet').val() == 'M'){
				  opener.jq('#heknkf').val(kundNr);
		  	  }
			  opener.jq('#whenak').val(kundName + " - " + kundAddress);
			  
			  opener.jq('#henak').val(navn);
			  opener.jq('#henak').removeClass( "isa_error" );
			  
			  opener.jq('#headk1').val(adr1);
			  opener.jq('#headk2').val(adr2);
			  opener.jq('#headk3').val(postnrsted);
			  opener.jq('#heknk').focus();
			  
		  }else if(jq('#ctype').val()=='il'){
			  opener.jq('#fakunr').val(kundNr);
			  
		  }else if(jq('#ctype').val()=='sf'){
			  //selgers fakturapart  
			  opener.jq('#heknsf').val(kundNr);
			  opener.jq('#whenasf').val(kundName + " - " + kundAddress);
			  opener.jq('#heknsf').focus();
			  
		  }else if(jq('#ctype').val()=='kf'){
			  //kjøpers fakturapart 
			  opener.jq('#heknkf').val(kundNr);
			  opener.jq('#whenakf').val(kundName + " - " + kundAddress);
			  opener.jq('#heknkf').focus();
		  
		  }
		  
		  //close child window
		  window.close();
	  });
	});
	
	jq(function() {
		jq('#customerAddressesList').on('click', 'td', function(){
		  var id = this.id;
		  var record = id.split('@');
		  var kundNr = record[0].replace("vadrnr_", "");
		  var navn = record[1].replace("navn_", "");
		  var adr1 = record[2].replace("adr1_", "");
		  var adr2 = record[3].replace("adr2_", "");
		  var postnrsted = record[4].replace("postnrsted_", "");
		  
		  //alert(kundNr + " type:" + jq('#ctype').val() + "-->customerName:" + customerName);
		  //addressing a parent field from this child window
		  if(jq('#ctype').val()=='s'){
			  //shipper/consignor 	
			  //opener.jq('#hekns').val(kundNr); //this should not override the customer number
			  opener.jq('#henas').val(navn);
			  opener.jq('#heads1').val(adr1);
			  opener.jq('#heads2').val(adr2);
			  opener.jq('#heads3').val(postnrsted);
			  opener.jq('#henas').focus();
			  
		  }else if(jq('#ctype').val()=='c'){
			  //consignee
			  //opener.jq('#heknk').val(kundNr); //this should not override the customer number
			  opener.jq('#henak').val(navn);
			  opener.jq('#headk1').val(adr1);
			  opener.jq('#headk2').val(adr2);
			  opener.jq('#headk3').val(postnrsted);
			  opener.jq('#henak').focus();
		  
		  }else if(jq('#ctype').val()=='tror_byadr'){
			  //consignee
			  //opener.jq('#heknk').val(kundNr); //this should not override the customer number
			  opener.jq('#henak').val(navn);
			  opener.jq('#headk1').val(adr1);
			  opener.jq('#headk2').val(adr2);
			  opener.jq('#headk3').val(postnrsted);
			  opener.jq('#henak').focus();
		  
		  }
		  
		  //close child window
		  window.close();
	  });
	});
	
	//Customer
	jq(function() {
		jq('#carrierList').on('click', 'td', function(){
		  var id = this.id;
		  
		  var record = id.split('@');
		  var kundNr = record[0].replace("kundnr_", "");
		  var navn = record[1].replace("navn_", "");
		  var adr1 = record[2].replace("adr1_", "");
		  var adr2 = record[3].replace("adr2_", "");
		  var postnrsted = record[4].replace("postnrsted_", "");
		  var kundName = record[5].replace("kundname_", "");
		  var kundAddress = record[6].replace("kundaddress_", "");
		  
		  
		  //alert(kundNr + " type:" + jq('#ctype').val() + "-->customerName:" + customerName);
		  //addressing a parent field from this child window
		  /*if(jq('#ctype').val()=='s'){
			  //shipper/consignor 	
			  opener.jq('#hekns').val(kundNr);
			  
			  if(opener.jq('#xfakBet').val() != 'M'){
				  opener.jq('#heknsf').val(kundNr);
		  	  }
			  opener.jq('#whenas').val(kundName + " - " + kundAddress);
			  
			  opener.jq('#henas').val(navn);
			  opener.jq('#henas').removeClass( "isa_error" );
			  
			  opener.jq('#heads1').val(adr1);
			  opener.jq('#heads2').val(adr2);
			  opener.jq('#heads3').val(postnrsted);
			  opener.jq('#hekns').focus();
			  
		  }else if(jq('#ctype').val()=='a'){
			  //agent  
			  opener.jq('#trknfa').val(kundNr);
			  opener.jq('#trknfa').focus();
		  
		  }else if(jq('#ctype').val()=='c'){
			  //consignee
			  opener.jq('#heknk').val(kundNr);
			  if(opener.jq('#xfakBet').val() == 'M'){
				  opener.jq('#heknkf').val(kundNr);
		  	  }
			  opener.jq('#whenak').val(kundName + " - " + kundAddress);
			  
			  opener.jq('#henak').val(navn);
			  opener.jq('#henak').removeClass( "isa_error" );
			  
			  opener.jq('#headk1').val(adr1);
			  opener.jq('#headk2').val(adr2);
			  opener.jq('#headk3').val(postnrsted);
			  opener.jq('#heknk').focus();
			  
		  }else if(jq('#ctype').val()=='il'){
			  opener.jq('#fakunr').val(kundNr);
			  
		  }else if(jq('#ctype').val()=='sf'){
			  //selgers fakturapart  
			  opener.jq('#heknsf').val(kundNr);
			  opener.jq('#whenasf').val(kundName + " - " + kundAddress);
			  opener.jq('#heknsf').focus();
			  
		  }else if(jq('#ctype').val()=='kf'){
			  //kjøpers fakturapart 
			  opener.jq('#heknkf').val(kundNr);
			  opener.jq('#whenakf').val(kundName + " - " + kundAddress);
			  opener.jq('#heknkf').focus();
		  
		  }
		  */
		  //close child window
		  window.close();
	  });
	});
	
  	
	//Select Postal Code From
	/*
	jq(function() {
		jq('#postNrFromList').on('click', 'td', function(){
			var id = this.id;
			  var record = id.split('@');
			  var postalCode = record[0].replace("postalcode_","");
			  var countryCode = record[1].replace("country_","");
			  var city = record[2].replace("city_","");
			  var caller="init";
			  if(record.length>3){
				 caller = record[3].replace("caller_","");
			  }
			  
			  //addressing a parent field from this child window
			  if(opener.jq('#hesdf').length && caller=='hesdf'){ //only way to check if field exists. (Order)
				  opener.jq('#helka').val(countryCode);
				  opener.jq('#hesdf').val(postalCode);
				  opener.jq('#hesdf').removeClass("text11RedBold");
				  opener.jq('#OWNwppns1').val(city);
			  }else if(opener.jq('#hesdt').length && caller=='hesdt'){ //since there are several postnr callers in the same JSP
				  opener.jq('#hetri').val(countryCode);
				  opener.jq('#hesdt').val(postalCode);
				  opener.jq('#hesdt').removeClass("text11RedBold");
				  opener.jq('#OWNwppns2').val(city);
			  }
			  
			  //close child window
			  window.close();
	  });
	});
	
	//Select Postal Code To
	jq(function() {
		jq('#postNrToList').on('click', 'td', function(){
			var id = this.id;
			  var record = id.split('@');
			  var postalCode = record[0].replace("postalcode_","");
			  var countryCode = record[1].replace("country_","");
			  var city = record[2].replace("city_","");
			  var caller="init";
			  if(record.length>3){
				 caller = record[3].replace("caller_","");
			  }
			  //addressing a parent field from this child window
			  if(opener.jq('#tustet').length){ //only way to check if field exists. (Trip)
				  opener.jq('#tusont').val(countryCode);
				  opener.jq('#tustet').val(postalCode);
				  opener.jq('#tusdt').val(city);
			  }
			  if(opener.jq('#hesdt').length && caller=='hesdt'){ //only way to check if field exists.(Order)
				  opener.jq('#hetri').val(countryCode);
				  opener.jq('#hesdt').val(postalCode);
				  opener.jq('#hesdt').removeClass("text11RedBold");
				  opener.jq('#OWNwppns2').val(city);
			  }else if(opener.jq('#hesdvt').length && caller=='hesdvt'){ //only way to check if field exists.(Order)
				  opener.jq('#helkk').val(countryCode);
				  opener.jq('#hesdvt').val(postalCode);
				  opener.jq('#hesdvt').removeClass("text11RedBold");
				  opener.jq('#OWNwppns4').val(city);
			  }
			  //close child window
			  window.close();
	  });
	});
	*/
	//Select Load/Unload place
	jq(function() {
		jq('#loadUnloadPlacesList').on('click', 'td', function(){
		  var id = this.id;
		  var record = id.split('@');
		  var loadPlaceCode = record[0].replace("code_", "");
		  var loadPlaceName = record[1].replace("loadplacename_", "");
		  var caller = record[2].replace("caller_", "");
		  if(opener.jq('#hesdl').length && caller=='hesdl'){ //only way to check if field exists.(Order)
			  opener.jq('#hesdl').val(loadPlaceName);
		  }else if(opener.jq('#hesdla').length && caller=='hesdla'){ //only way to check if field exists.(Order)
			  opener.jq('#hesdla').val(loadPlaceName);
		  }
		  //close child window
		  window.close();
	  });
	});
	
	//Select packing codes
	/*
	jq(function() {
		jq('#packingCodesList').on('click', 'td', function(){
		  var id = this.id;
		  var record = id.split('@');
		  if(jq('#callerLineCounter').val()!=''){
			  var fvpakn = record[0].replace("kode_", "");
			  var text = record[1].replace("text_", "");
			  var fvlen = record[2].replace("len_", "");
			  var fvbrd = record[3].replace("brd_", "");
			  var fvhoy = record[4].replace("hoy_", "");
			  var fvlm = record[5].replace("lm_", "");
			  var fvlm2 = record[6].replace("lm2_", "");
			  
			  var callerLineCounterStr = jq('#callerLineCounter').val();
			  var callerLineCounter = 0;
			  if(callerLineCounterStr!=""){ callerLineCounter = parseInt(callerLineCounterStr);}
			  //alert(callerLineCounter);
			  //addressing a parent field from this child window
			  opener.jq('#fvpakn_' + callerLineCounter).val(fvpakn);
			  if(opener.jq('#fvvt_' + callerLineCounter).val()==''){ opener.jq('#fvvt_' + callerLineCounter).val(text); }
			  if(opener.jq('#fvlen_' + callerLineCounter).val()==''){ opener.jq('#fvlen_' + callerLineCounter).val(fvlen); }
			  if(opener.jq('#fvbrd_' + callerLineCounter).val()==''){ opener.jq('#fvbrd_' + callerLineCounter).val(fvbrd); }
			  if(opener.jq('#fvhoy_' + callerLineCounter).val()==''){ opener.jq('#fvhoy_' + callerLineCounter).val(fvhoy); }
			  if(opener.jq('#fvlm_' + callerLineCounter).val()==''){ opener.jq('#fvlm_' + callerLineCounter).val(fvlm); }
			  if(opener.jq('#fvlm2_' + callerLineCounter).val()==''){ opener.jq('#fvlm2_' + callerLineCounter).val(fvlm2); }
			  //cosmetics
			  //opener.jq('#ffunnr_' + callerLineCounter).removeClass("isa_warning");opener.jq('#ffembg_' + callerLineCounter).removeClass("isa_warning");
			  //opener.jq('#ffindx_' + callerLineCounter).removeClass("isa_warning");
			  //opener.jq('#ffunnr_' + callerLineCounter).removeClass("isa_error");opener.jq('#ffembg_' + callerLineCounter).removeClass("isa_error");
			  //opener.jq('#ffindx_' + callerLineCounter).removeClass("isa_error");
		  }else{
			  var fvpakn = record[0].replace("kode", "");
			  var text = record[1].replace("text", "");
			  var fvlen = record[2].replace("len", "");
			  var fvbrd = record[3].replace("brd", "");
			  var fvhoy = record[4].replace("hoy", "");
			  var fvlm = record[5].replace("lm", "");
			  var fvlm2 = record[6].replace("lm2", "");
			  //addressing a parent field from this child window
			  opener.jq('#fvpakn').val(fvpakn);
			  if(opener.jq('#fvvt').val()==''){ opener.jq('#fvvt').val(text); }
			  if(opener.jq('#fvlen').val()==''){ opener.jq('#fvlen').val(fvlen); }
			  if(opener.jq('#fvbrd').val()==''){ opener.jq('#fvbrd').val(fvbrd); }
			  if(opener.jq('#fvhoy').val()==''){ opener.jq('#fvhoy').val(fvhoy); }
			  if(opener.jq('#fvlm').val()==''){ opener.jq('#fvlm').val(fvlm); }
			  if(opener.jq('#fvlm2').val()==''){ opener.jq('#fvlm2').val(fvlm2); }
			  //cosmetics
			  //opener.jq('#ffunnr' + callerLineCounter).removeClass("isa_warning");opener.jq('#ffembg' + callerLineCounter).removeClass("isa_warning");
			  //opener.jq('#ffindx' + callerLineCounter).removeClass("isa_warning");
			  //opener.jq('#ffunnr' + callerLineCounter).removeClass("isa_error");opener.jq('#ffembg' + callerLineCounter).removeClass("isa_error");
			  //opener.jq('#ffindx' + callerLineCounter).removeClass("isa_error");
		  }
		  //close child window
		  window.close();
		  
	  });
	});
	*/
	
	//======================
    //Datatables jquery 
    //======================
    //private function [Filters]
    /*
    function filterPostNrFrom () {
        jq('#postNrFromList').DataTable().search(
    		jq('#postNrFromList_filter').val()
        ).draw();
    }
    function filterPostNrTo () {
        jq('#postNrToList').DataTable().search(
    		jq('#postNrToList_filter').val()
        ).draw();
    }
    */
    function filterCustomerList (){
        jq('#customerList').DataTable().search(
    		jq('#customerList_filter').val()
        ).draw();
    }
    
    function filterCustomerAddressesList (){
        jq('#customerAddressesList').DataTable().search(
    		jq('#customerAddressesList_filter').val()
        ).draw();
    }
    function filterCarrierList (){
        jq('#carrierList').DataTable().search(
    		jq('#carrierList_filter').val()
        ).draw();
    }
    function filterLoadUnloadPlacesList (){
        jq('#loadUnloadPlacesList').DataTable().search(
    		jq('#loadUnloadPlacesList_filter').val()
        ).draw();
    }
    /*
    function filterPackingCodesList (){
        jq('#packingCodesList').DataTable().search(
    		jq('#packingCodesList_filter').val()
        ).draw();
    }
    function filterDangerousGoodsList (){
        jq('#dangerousGoodsList').DataTable().search(
    		jq('#dangerousGoodsList_filter').val()
        ).draw();
    }
    */
    //Init datatables
    jq(document).ready(function() {
      var lang = jq('#language').val(); 	
      //--------------------------
      //table [PostNr From]
	  //--------------------------
	  jq('#postNrFromList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.postNrFromList_filter').on( 'keyup click', function () {
		  filterPostNrFrom();
	  });
	  
	  //-----------------------
	  //tables [PostNr To]
	  //-----------------------
	  jq('#postNrToList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.postNrToList_filter').on( 'keyup click', function () {
		  filterPostNrFrom();
	  });
	  
	  //-----------------------
	  //tables [Customer No.]
	  //-----------------------
	  jq('#customerList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.customerList_filter').on( 'keyup click', function () {
		  filterCustomerList();
	  });
	  //related table Customer Addresses
	  jq('#customerAddressesList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.customerAddressesList_filter').on( 'keyup click', function () {
		  filterCustomerAddressesList();
	  });

	  //-----------------------
	  //tables [Carrier No.]
	  //-----------------------
	  jq('#carrierList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.carrierList_filter').on( 'keyup click', function () {
		  filterCarrierList();
	  });
	  
	  //------------------------------
	  //tables [Load/Unload places]
	  //----------------------------
	  jq('#loadUnloadPlacesList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.loadUnloadPlacesList_filter').on( 'keyup click', function () {
		  filterLoadUnloadPlacesList();
	  });
	  
	  //------------------------------
	  //tables [packing codes]
	  //----------------------------
	  jq('#packingCodesList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.packingCodesList_filter').on( 'keyup click', function () {
		  filterPackingCodesList();
	  });
	  
	//------------------------------
	  //tables [dangerous goods]
	  //----------------------------
	  jq('#dangerousGoodsList').dataTable( {
		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
		  "lengthMenu": [ 50, 75, 100 ],
		  "language": { "url": getLanguage(lang) }
	  });
	  //event on input field for search
	  jq('input.dangerousGoodsList_filter').on( 'keyup click', function () {
		  filterDangerousGoodsList();
	  });
      
    });
  	