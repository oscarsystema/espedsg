  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";
  
  function setBlockUI(element){
	  jq.blockUI({ message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT});
  }

  //-------------------
  //Datatables jquery
  //-------------------
  jq(document).ready(function() {
    //init table (no ajax, no columns since the payload is already there by means of HTML produced on the back-end)
  	  jq('#invalideKunderList').dataTable( {
  		  "dom": '<"top"fli>rt<"bottom"p><"clear">',
  		  "lengthMenu": [ 25, 50, 75, 100, 500, 1000 ]
  	  } );
    
  } );
  
  