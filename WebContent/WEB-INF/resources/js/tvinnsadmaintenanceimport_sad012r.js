  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";
  
  function setBlockUI(element){
	  jq.blockUI({ message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT});
  }
  //-----------------------
  //GET specific db-record
  //-----------------------
  /*
  function getRecord(record){
	var id = record.id;
  	var applicationUserParam = jq('#applicationUser').val();
  	id = id.replace("recordUpdate_", "");
	  	
	jq.ajax({
  	  type: 'GET',
  	  url: 'getSpecificRecord_sad012r.do',
  	  data: { applicationUser : jq('#applicationUser').val(), 
  		  	  id : id },
  	  dataType: 'json',
  	  cache: false,
  	  contentType: 'application/json',
  	  success: function(data) {
	  	var len = data.length;
  		for ( var i = 0; i < len; i++) {
  			jq('#klbkod').val("");jq('#klbkod').val(data[i].klbkod);
  			jq("#klbkod").prop("readonly", true);
  			jq("#klbkod").removeClass("inputTextMediumBlueUPPERCASEMandatoryField");
  			jq("#klbkod").addClass("inputTextReadOnly");
  			
  			//rest of the gang
  			jq('#klbnav').val("");jq('#klbnav').val(data[i].klbnav);
  			//jq('#ksovl').val("");jq('#ksovl').val(data[i].ksovl);
  			//jq('#ksuser').val("");jq('#ksuser').val(data[i].ksuser);
  			//jq('#ksixxx').val("");jq('#ksixxx').val(data[i].ksixxx);
  			
  			//for a future update
  			jq('#updateId').val("");jq('#updateId').val(data[i].ksisig);
  			
  		}
  	  }, 
  	  error: function() {
  		  alert('Error loading ...');
  	  }
	});
		
  }
  */
			
  //-------------------
  //Datatables jquery
  //-------------------
  //private function
  function filterGlobal () {
    jq('#mainList').dataTable().search(
    	jq('#mainList_filter').val()
    ).draw();
  }
  
  jq(document).ready(function() {
      //init table (no ajax, no columns since the payload is already there by means of HTML produced on the back-end)
      jq('#mainList').dataTable( {
    	  "dom": '<"top">t<"bottom"flip><"clear">',
    	  "scrollY": "180px",
    	  "scrollCollapse":  false,
    	  "columnDefs": [{ "type": "num", "targets": 0 }],
    	  "lengthMenu": [ 75, 100]
  	  });
      
      //event on input field for search
      jq('input.mainList_filter').on( 'keyup click', function () {
      		filterGlobal();
      });
  	
  });
  