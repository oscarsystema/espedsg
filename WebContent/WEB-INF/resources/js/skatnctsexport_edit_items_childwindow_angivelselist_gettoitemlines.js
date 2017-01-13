	//this variable is a global jQuery var instead of using "$" all the time. Very handy
  	var jq = jQuery.noConflict();
  	
  	//--------
  	//Koder
  	//--------
	jq(function() {
		jq("#datum").datepicker({ 
			  dateFormat: 'yymmdd' 
			  //defaultDate: "-6m"	  
		});
		
		//put values from childwindow into opener fields
		/*
		jq('#angivelseList').on('click', 'td', function(){
			  var id = this.id;
			  var record = id.split('@');
			  var avd = record[0].replace("avd", "");
			  var opd = record[1].replace("opd", "");
			  var xref = record[2].replace("xref", "");
			  var refnr = record[3].replace("refnr", "");
			  var mrn = record[4].replace("mrn", "");
			  var faktValuta = record[5].replace("valuta", "");
			  var faktBelopp = record[6].replace("blp", "");
			  
			  //alert(vkod + " " + text);
			  opener.jq('#tvavd2').val(avd);
			  opener.jq('#tvtdn2').val(opd);
			  opener.jq('#xref').val(xref);
			  opener.jq('#dkxv_221').val(faktValuta);
			  opener.jq('#dkxv_222').val(faktBelopp);
			  
			  if(opener.jq('#tvdref').val()==''){
				  if(mrn!=''){
					  opener.jq('#tvdref').val(mrn);
				  }else{	  
					  opener.jq('#tvdref').val(refnr);
				  }
			  }
			  opener.jq('#tvtdn2').focus();
			  //close child window
			  window.close();
	    });
	    */
	});
	
	
	
	jq(function() {
		jq('#buttonCloseOk').click(function(){
			//jq.blockUI({ message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT });
			jq( ".clazzEksportAware" ).each(function( i ) {
				  var id = this.id;
				  var record = id.split('_');
				  var syav = record[0].replace("syav", "");
				  var syop = record[1].replace("syop", "");
				  var counter = i + 1;
				  var requestParams = "&avd=" + jq('#avdNcts').val() + "&opd=" + jq('#opdNcts').val() + "&dkeh_syav=" + syav +  "&dkeh_syop=" + syop ;
				  //alert(requestParams);
				  
				  if(jq('#syav' + syav + '_' + 'syop' + syop ).prop('checked')){
					  //alert( i + "XX" + jq('#syav' + syav + '_' + 'syop' + syop ).val());
					  jq.ajax({
				  	  	  type: 'GET',
				  	  	  url: 'importSkatExportAsSkatNctsExportItemLine_SkatNctsExport.do',
				  	  	  data: { applicationUser : jq('#applicationUser').val(),
						  			requestParams : requestParams },
				  	  	  dataType: 'json',
				  	  	  cache: false,
				  	  	  async: false,
				  	  	  contentType: 'application/json',
				  	  	  success: function(data) {
				  	  		var len = data.length;
				  	  		for ( var i = 0; i < len; i++) {
				  	  			//Update has been done successfully
				  	  		}
				  	  	  },
					  	  error: function() {
				  	  	    //alert('Error loading ...');
				  	  	  }
				  	  });
			  	  }
			
			});
			//we must reload the parent window since the use case updates the invoice list (if the end-user has selected some invoices to import)
			//window.opener.location.reload();
			window.close();
			
		});
		//abort
		jq('#cancel').click(function(){
			window.close();
		});
	
	});
	
	
	
	//======================
    //Datatables jquery 
    //======================
    //private function [Filters]
    function filterGeneralCode () {
    		jq('#angivelseList').DataTable().search(
      		jq('#angivelseList_filter').val()
    		).draw();
    } 
	//Init datatables
    jq(document).ready(function() {
  	  //-----------------------
      //table [General Code List]
  	  //-----------------------
    	  jq('#angivelseList').dataTable( {
    		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
    		  "lengthMenu": [ 75, 100, 200, 500]
    	  });
      //event on input field for search
      jq('input.angivelseList_filter').on( 'keyup click', function () {
      		filterGeneralCode();
      });
      
    });   
  	
  	
	