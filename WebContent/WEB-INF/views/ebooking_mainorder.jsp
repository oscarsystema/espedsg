<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>
<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerEbooking.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/ebookingglobal_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	<SCRIPT type="text/javascript" src="resources/js/ebooking_mainorder.js?ver=${user.versionEspedsg}"></SCRIPT>
	<%-- for dialog popup --%>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<style type = "text/css">
	.ui-dialog{font-size:10pt;}
	.ui-datepicker { font-size:9pt;}
	</style>
	

<form action="ebooking_mainorder.do"  name="ebookingOrderForm" id="ebookingOrderForm" method="post">
<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
	<tr>
	<td>
	<%-- tab container component --%>
	<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
		<tr height="2"><td></td></tr>
		<tr height="25"> 
			<td width="20%" valign="bottom" class="tabDisabled" align="center" nowrap>
				<a class="text14" href="ebooking_mainorderlist.do?action=doFind" > 	
					<img style="vertical-align:middle;" src="resources/images/bulletGreen.png" width="6px" height="6px" border="0" alt="open orders">
					<font class="tabDisabledLink">&nbsp;<spring:message code="systema.ebooking.orderlist.tab"/></font>
				</a>
				
			</td>
			<c:choose>
				<c:when test="${empty model.record.hereff && empty model.record.heunik}">
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="20%" valign="bottom" class="tab" align="center" nowrap>
						<img style="vertical-align:middle;" src="resources/images/add.png" width="12px" height="12px" border="0" alt="create new">
						<font class="tabLink"><spring:message code="systema.ebooking.createnew.order.tab"/></font>
					</td>
				</c:when>
				<c:otherwise>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="20%" valign="bottom" class="tab" align="center" nowrap>
						<img style="vertical-align:middle;" src="resources/images/update.gif" width="12px" height="12px" border="0" alt="update order">
						<font class="tabLink"><spring:message code="systema.ebooking.order.tab"/></font><font class="text12">&nbsp;${model.record.hereff}</font>
					</td>
				</c:otherwise>
			</c:choose>
			<td width="60%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
		</tr>
	</table>
	</td>
	</tr>
	
	<%-- --------------------------- --%>
	<%-- Validation errors FRONT END --%>
	<%-- --------------------------- --%>
	<spring:hasBindErrors name="record"> <%-- name must equal the command object name in the Controller --%>
	<tr height="5"><td></td></tr>
	<tr>
		<td>
           	<table class="tabThinBorderWhiteWithSideBorders" width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
           	<tr>
			<td valign="bottom" class="textError">					
	            <ul>
	            <c:forEach var="error" items="${errors.allErrors}">
	                <li >
	                	<spring:message code="${error.code}" text="${error.defaultMessage}"/>
	                </li>
	            </c:forEach>
	            </ul>
			</td>
			</tr>
			</table>
		</td>
	</tr>
	</spring:hasBindErrors>	
	
	<%-- -------------------------- --%>
	<%-- Validation errors BACK END --%>
	<%-- -------------------------- --%>
	<c:if test="${not empty model.containerValidationBackend && not empty model.containerValidationBackend.errMsgListFromValidationBackend}">
		<tr>
		<td>
           	<table class="tabThinBorderWhiteWithSideBorders" width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
           	<tr>
			<td valign="bottom" class="textError">					
	            <ul>
	            <c:forEach var="errMsg" items="${model.containerValidationBackend.errMsgListFromValidationBackend}">
	                <li >${errMsg}</li>
	            </c:forEach>
	            </ul>
			</td>
			</tr>
			</table>
		</td>
		</tr>		
	</c:if>
	<%-- -------------------------- --%>
	<%-- Validation errors on model --%>
	<%-- -------------------------- --%>
	<c:if test="${not empty model.errorMessage}">
		<tr>
		<td>
           	<table class="tabThinBorderWhiteWithSideBorders" width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
           	<tr>
			<td valign="bottom" class="textError">					
	            <ul>
	            	<li >${model.errorMessage}</li>
	            </ul>
			</td>
			</tr>
			</table>
		</td>
		</tr>		
	</c:if>
	

		<tr>
		<td>
			<%-- this table wrapper is necessary to apply the css class with the thin border --%>
			<input type="hidden" name="parentTrip" id="parentTrip" value="${model.parentTrip}">
			<table style="width:100%" id="wrapperTable" class="tabThinBorderWhite" cellspacing="0">
			<tr height="10"><td>&nbsp;</td></tr> 
			<%-- FORM HEADER --%>
	 		<tr>
            		<td>
	        			<table style="width:99%;" align="left" class="formFrameHeader" border="0" cellspacing="0" cellpadding="0">
				 		<tr height="15">
				 			<td class="text12White">
								&nbsp;<spring:message code="systema.ebooking.orders.form.update.label.header.edit"/>	
								&nbsp;&nbsp;<b>${model.record.heunik} / ${model.record.hereff}</b>
								&nbsp;&nbsp;<img style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="edit">
			 				</td>
		 				</tr>
	 				</table>
            		</td>
            </tr>
            <%-- FORM DETAIL --%>
            <tr ondrop="drop(event)" ondragover="allowDrop(event)" >
            		<td>
            		<input type="hidden" name="applicationUser" id="applicationUser" value='${user.user}'>
					<input type="hidden" name="heunik" id="heunik" value='${model.record.heunik}'>
					<input type="hidden" name="heur" id="heur" value='${model.record.heur}'>
					<input type="hidden" name="action" id="action" value='doUpdate'>
					<input type="hidden" name="selectedType" id="selectedType" value='${model.selectedType}'>

					<input type="hidden" name="messageNoteConsigneeOriginal" id="messageNoteConsigneeOriginal" value='${model.record.messageNoteConsignee}'>
					<input type="hidden" name="messageNoteCarrierOriginal" id="messageNoteCarrierOriginal" value='${model.record.messageNoteCarrier}'>
					<input type="hidden" name="messageNoteInternalOriginal" id="messageNoteInternalOriginal" value='${model.record.messageNoteInternal}'>
					<input type="hidden" id="messageNoteDate" name="messageNoteDate" value="${model.record.messageNoteDate}">
					<table style="width:99%;" align="left" class="formFrame" border="0" cellspacing="0" cellpadding="0">
				 		<tr height="10"><td ></td></tr>
				 		<tr>
							<td colspan="2">
							<table border="0">
							 	<tr>
							 		
						 		 	<td class="text11">&nbsp;&nbsp;<font class="text16RedBold" >*</font><span title="hereff"><spring:message code="systema.ebooking.orders.form.update.label.orderref"/>&nbsp;</span></td>
				 					<td class="text11">
					 					<input required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" type="text" class="inputTextMediumBlueMandatoryField" name="hereff" id="hereff" size="10" maxlength="10" value="${model.record.hereff}">
					 				</td>
					 				<td align="left" class="text11" >
					 					&nbsp;&nbsp;<span title="heavd">Avd</span>
					 				</td>
					 				<td class="text11">
					 					<input readonly type="text" class="inputTextReadOnly" name="heavd" id="heavd" size="8" maxlength="8" value="${model.record.heavd}">
					 				</td>
					 			</tr>
					 			<tr>
							 		
						 		 	<td class="text11" >&nbsp;&nbsp;
							 			<span title="todo"><spring:message code="systema.ebooking.orders.form.update.label.annenref"/>&nbsp;</span>
				 					</td>
				 					<td class="text11">
					 					<input type="text" class="inputTextMediumBlue11" name="todo" id="todo" size="10" maxlength="10" value="${XXmodel.record.trknfa}">
					 				</td>
					 				<td align="right" class="text11" colspan="4">
					 					&nbsp;&nbsp;<span title="todo"><spring:message code="systema.ebooking.orders.form.update.label.avvikande.adr"/></span>
					 					<input type="checkbox" id="todo" name="todo" value="J" <c:if test="${XXmodel.record.hepk1 == 'J'}"> checked </c:if>>
					 				</td>
				 				</tr>
							</table>
							</td>
						</tr>
						
						<tr height="5"><td ></td></tr>
						<tr height="3"><td colspan="2" style="border-bottom:1px solid;border-color:#DDDDDD;" class="text"></td></tr>
						<tr height="5"><td ></td></tr>
						<tr>
							<td class="text14Bold">&nbsp;<font class="text16RedBold" >*</font>
								<spring:message code="systema.ebooking.orders.form.update.label.shipper"/></td>
							<td class="text14Bold">&nbsp;<font class="text16RedBold" >*</font>
								<spring:message code="systema.ebooking.orders.form.update.label.consignee"/>
							</td>
						</tr>
						<tr height="5"><td ></td></tr>
						
						<tr>
							<td >
							<table class="tableBorderWithRoundCornersLightGray">
								<tr>
									<td class="text12Bold"><spring:message code="systema.ebooking.orders.form.update.label.shippingDates"/></td>
									<td class="text11">&nbsp;<font class="text12RedBold" >*</font><span title="wsetdd/wsetdk"><spring:message code="systema.ebooking.orders.form.update.label.shippingDates.etd"/></span></td>
									<td class="text11">
										<input type="text" class="inputTextMediumBlue11MandatoryField" name="wsetdd" id="wsetdd" size="9" maxlength="8" value="${model.record.wsetdd}">
									</td>
									<td class="text11"><input type="text" class="inputTextMediumBlue11MandatoryField" name="wsetdk" id="wsetdk" size="4" maxlength="4" value="${model.record.wsetdk}"></td>
									
						
								</tr>
							</table>
							</td>
							<td >
							<table class="tableBorderWithRoundCornersLightGray">
								<tr>
									<td class="text12Bold"><spring:message code="systema.ebooking.orders.form.update.label.arrivalDates"/></td>
									<td class="text11">&nbsp;<font class="text12RedBold" >*</font><span title="wsetad/wsetak"><spring:message code="systema.ebooking.orders.form.update.label.arrivalDates.eta"/></span></td>
									<td class="text11">
										<input type="text" class="inputTextMediumBlue11MandatoryField" name="wsetad" id="wsetad" size="9" maxlength="8" value="${model.record.wsetad}">
									</td>
									<td class="text11"><input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue11MandatoryField" name="wsetak" id="wsetak" size="4" maxlength="4" value="${model.record.wsetak}"></td>
									
								</tr>
							</table>
							</td>		
						</tr>
						<tr height="5"><td ></td></tr>
						
						
						<tr>
				 			<td valign="top" >
				 			 <table style="width:99%" class="tableBorderWithRoundCornersGray" cellspacing="1" cellpadding="0">
						 		<tr height="10"><td ></td></tr>
						 		<tr>
					 				<td class="text11">
					 					&nbsp;<span title="hekns"><spring:message code="systema.ebooking.orders.form.update.label.shipper.id"/>&nbsp;</span>
					 					<a href="javascript:void(0);" onClick="window.open('ebooking_childwindow_customer.do?action=doInit&ctype=s','customerWin','top=300px,left=50px,height=800px,width=900px,scrollbars=no,status=no,location=no')">
	 										<img id="imgShipperSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" height="13px" width="13px" border="0" alt="search">
	 									</a>
					 				</td>
					 				<td class="text11">
					 					&nbsp;<span title="whenas"><spring:message code="systema.ebooking.orders.form.update.label.shipper.seller"/>&nbsp;</span>
					 				</td>
					 			</tr>
					 			<tr>	
				 					<td class="text11" ><input type="text" class="inputTextMediumBlueUPPERCASE" name="hekns" id="hekns" size="10" maxlength="8" value="${model.record.hekns}"></td>
								 	<td class="text11" ><input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="whenas" id="whenas" size="35" value="${model.record.whenas}"></td>
				 				</tr>
								<tr height="5"><td ></td></tr>
						 		<tr>
					 				<td class="text11">&nbsp;<font class="text16RedBold" >*</font><span title="henas"><spring:message code="systema.ebooking.orders.form.update.label.shipper.name"/></span></td>
					 				<td class="text11">&nbsp;<font class="text16RedBold" >*</font><span title="heads1"><spring:message code="systema.ebooking.orders.form.update.label.shipper.adr1"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASEMandatoryField" name="henas" id="henas" size="25" maxlength="30" value="${model.record.henas}"></td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASEMandatoryField" name="heads1" id="heads1" size="25" maxlength="30" value="${model.record.heads1}"></td>
				 				</tr>
					 			<tr>	
					 				<td class="text11">&nbsp;<span title="heads2"><spring:message code="systema.ebooking.orders.form.update.label.shipper.adr2"/></span></td>
					 				<td class="text11">&nbsp;<span title="heads3"><spring:message code="systema.ebooking.orders.form.update.label.shipper.adr3"/></span></td>
					 			</tr>
								<tr>	
				 					<td class="text11" >
				 					<input type="text" class="inputTextMediumBlueUPPERCASE" name="heads2" id="heads2" size="25" maxlength="30" value="${model.record.heads2}">
				 					</td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="heads3" id="heads3" size="25" maxlength="30" value="${model.record.heads3}"></td>
				 				</tr>
				 				
				 				<tr height="15"><td ></td></tr>	
				 				<tr>	
				 					<td class="text11">
										<img onMouseOver="showPop('herfa_info');" onMouseOut="hidePop('herfa_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
					 					<span title="herfa"><spring:message code="systema.ebooking.orders.form.update.label.avsRef"/></span>						 				
										<div class="text11" style="position: relative;" align="left">
										<span style="position:absolute; left:0px; top:0px; width:250px" id="herfa_info" class="popupWithInputText"  >
											<font class="text11">
							           			<b>Søk Avs.</b>
							           			<div>
							           			<p>Avsenders søkereferanse Fritt felt for utfylling. <br>
							           				Begrep for senere søk/gjenfinning.</p>
							           			</div>
						           			</font>
										</span>
										</div>
									</td>
				 					<td class="text11">
				 						<span title="hesdla">
				 							<img style="vertical-align:middle;" src="resources/images/loading.png" width="15px" height="15px" border="0" alt="load/unload">
				 							<spring:message code="systema.ebooking.orders.form.update.label.load"/>
				 							<a href="javascript:void(0);" onClick="window.open('ebooking_childwindow_loadunloadplaces.do?action=doInit&&caller=hesdla','postalcodeWin','top=300px,left=50px,height=600px,width=800px,scrollbars=no,status=no,location=no')">						 				
						 						<img id="imgToSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" height="13px" width="13px" border="0" alt="search">
						 					</a>
				 						</span>
				 					</td>
				 				</tr>
				 				<tr>	
				 					<td class="text11" >
				 						<input type="text" class="inputTextMediumBlueUPPERCASEMandatoryField" name="herfa" id="herfa" size="20" maxlength="35" value="${model.record.herfa}">
								 	</td>
				 					<td class="text11" >
						 				<input type="text" class="inputTextMediumBlue11" name="hesdla" id="hesdla" size="21" maxlength="20" value="${model.record.hesdla}">
										
						 			</td>
				 				</tr>
				 				<tr height="5"><td ></td></tr>
								<tr>
					 				<td class="text11">&nbsp;<span title="wsscont"><spring:message code="systema.ebooking.orders.form.update.label.shipper.contactName"/></span></td>
					 				<td class="text11">&nbsp;<span title="wsstlf"><spring:message code="systema.ebooking.orders.form.update.label.shipper.telephone"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="wsscont" id="wsscont" size="25" maxlength="30" value="${model.record.wsscont}"></td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="wsstlf" id="wsstlf" size="25" maxlength="30" value="${model.record.wsstlf}"></td>
				 				</tr>
					 			<tr>	
					 				<td class="text11" colspan="2">&nbsp;<span title="wssmail"><spring:message code="systema.ebooking.orders.form.update.label.shipper.email"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11" colspan="2"><input type="text" class="inputTextMediumBlue" name="wssmail" id="wssmail" size="50" maxlength="70" value="${model.record.wssmail}"></td>
				 				</tr>
				 				
				 				<tr height="8"><td ></td></tr>													 				
								<tr>
				 					<td class="text12Bold">&nbsp;
				 						<img style="vertical-align: bottom;" width="24px" height="24px" src="resources/images/invoice.png" border="0" alt="invoice">
				 						<spring:message code="systema.ebooking.orders.form.update.label.shipper.invoicee"/>
			 						</td>
								</tr>
				 				<tr>
				 					<td colspan="2">
				 					<table class="tableBorderWithRoundCornersLightGray">
					 					<tr>
							 				<td class="text11">
							 					&nbsp;<span title="heknsf"><spring:message code="systema.ebooking.orders.form.update.label.shipper.invoicee.id"/>&nbsp;</span>
							 				</td>
							 				<td class="text11">
							 					&nbsp;<span title="henasf"><spring:message code="systema.ebooking.orders.form.update.label.shipper.invoicee.name"/>&nbsp;</span>
							 				</td>
							 				<td class="text11">
							 					<img onMouseOver="showPop('shipperCurr_info');" onMouseOut="hidePop('shipperCurr_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
								 				<span title="hevals"><spring:message code="systema.ebooking.orders.form.update.label.shipper.invoicee.currencyCode"/>&nbsp;</span>
								 				<div class="text11" style="position: relative;" align="left">
													<span style="position:absolute; left:0px; top:0px; width:250px" id="shipperCurr_info" class="popupWithInputText"  >
														<font class="text11">
									           			<b>Valuta</b>
									           			<div>
									           			<p>Valuta for fakturautstedelse - hentes fra kunderegister, kan overstyres. 
									           				Ved ulik NOK går fremmedvaluta inn i reskontro.
									           			</p>
									           			</div>
								           			</font>
												</span>
												</div>
							 				</td>
							 				
						 				</tr>
						 				<tr>	
						 					<td class="text11" ><input type="text" class="inputTextMediumBlueUPPERCASE" name="heknsf" id="heknsf" size="10" maxlength="8" value="${model.record.heknsf}"></td>
										 	<td class="text11" ><input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="henasf" id="henasf" size="31" maxlength="30"value="${model.record.henasf}"></td>
						 					<td class="text11" >
						 						<select name="hevals" id="hevals">
							 						<option value="">-valuta-</option>
								 				  	<c:forEach var="currency" items="${Xmodel.currencyCodeList}" >
								 				  		<option value="${currency}"<c:if test="${Xmodel.record.hevals == currency || (empty Xmodel.record.hevals && currency=='NOK')}"> selected </c:if> >${currency}</option>
													</c:forEach>  
												</select>
						 					</td>
						 					
					 					</tr>
									</table>
									</td>				 				
					 			</tr>
					 			 	
				 				<tr height="10"><td ></td></tr>
							 </table>
						 	</td>
						 	<td valign="top" >
				 			 <table style="width:99%" class="tableBorderWithRoundCornersGray" cellspacing="1" cellpadding="0">
					 			<tr height="10"><td ></td></tr>
						 		<tr>
					 				<td class="text11">
					 					&nbsp;<span title="heknk"><spring:message code="systema.ebooking.orders.form.update.label.consignee.id"/>&nbsp;</span>
					 					<a href="javascript:void(0);" onClick="window.open('ebooking_childwindow_customer.do?action=doInit&ctype=c','customerWin','top=300px,left=50px,height=800px,width=900px,scrollbars=no,status=no,location=no')">
	 										<img id="imgConsigneeSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" height="13px" width="13px" border="0" alt="search">
	 									</a>	
					 				</td>
					 				<td class="text11">
					 					&nbsp;<span title="whenak"><spring:message code="systema.ebooking.orders.form.update.label.consignee.buyer"/>&nbsp;</span>
					 				</td>	
					 			</tr>
					 			<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="heknk" id="heknk" size="10" maxlength="8" value="${model.record.heknk}"></td>
				 					<td class="text11" ><input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="whenak" id="whenak" size="35" value="${model.record.whenak}"></td>
				 				</tr>
				 				<tr height="5"><td ></td></tr>
						 		<tr>
					 				<td class="text11">&nbsp;<font class="text16RedBold" >*</font><span title="henak"><spring:message code="systema.ebooking.orders.form.update.label.consignee.name"/></span></td>
					 				<td class="text11">&nbsp;<font class="text16RedBold" >*</font><span title="headk1"><spring:message code="systema.ebooking.orders.form.update.label.consignee.adr1"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASEMandatoryField" name="henak" id="henak" size="25" maxlength="30" value="${model.record.henak}"></td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASEMandatoryField" name="headk1" id="headk1" size="25" maxlength="30" value="${model.record.headk1}"></td>
				 				</tr>
					 			<tr>	
					 				<td class="text11">&nbsp;<span title="headk2"><spring:message code="systema.ebooking.orders.form.update.label.consignee.adr2"/></span></td>
					 				<td class="text11">&nbsp;<span title="headk3"><spring:message code="systema.ebooking.orders.form.update.label.consignee.adr3"/></span></td>
					 			</tr>
								<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="headk2" id="headk2" size="25" maxlength="30" value="${model.record.headk2}"></td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="headk3" id="headk3" size="25" maxlength="30" value="${model.record.headk3}"></td>
				 				</tr>
				 				
				 				
				 				
				 				
				 				
				 				
				 				
				 				<tr height="15"><td ></td></tr>
				 				<tr>	
				 					<td class="text11"><img onMouseOver="showPop('herfk_info');" onMouseOut="hidePop('herfk_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
					 					&nbsp;&nbsp;<span title="herfk"><spring:message code="systema.ebooking.orders.form.update.label.consignee.ref"/></span>
						 				<div class="text11" style="position: relative;" align="left">
										<span style="position:absolute; left:0px; top:0px; width:250px" id="herfk_info" class="popupWithInputText"  >
											<font class="text11">
							           			<b>Søk Mott.</b>
							           			<div>
							           			<p>Mottakers søkereferanse Fritt felt for utfylling. Begrep for senere søk/gjenfinning.</p>
							           			</div>
						           			</font>
										</span>
										</div>
				 					</td>
				 					<td class="text11">
				 						<img style="vertical-align:middle;" src="resources/images/loading.png" width="15px" height="15px" border="0" alt="load/unload">
				 						<span title="hesdl"><spring:message code="systema.ebooking.orders.form.update.label.unload"/></span>
				 						<a href="javascript:void(0);" onClick="window.open('ebooking_childwindow_loadunloadplaces.do?action=doInit&caller=hesdl','postalcodeWin','top=300px,left=50px,height=600px,width=800px,scrollbars=no,status=no,location=no')">						 				
						 					<img id="imgToSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" height="13px" width="13px" border="0" alt="search">
						 				</a>
				 					</td>
				 				</tr>
				 				<tr>	
				 					<td class="text11" >
				 						<input type="text" class="inputTextMediumBlueUPPERCASE" name="herfk" id="herfk" size="20" maxlength="35" value="${model.record.herfk}">
				 					</td>
				 					<td class="text11" >
						 				<input type="text" class="inputTextMediumBlue11" name="hesdl" id="hesdl" size="21" maxlength="20" value="${model.record.hesdl}">
										
						 			</td>
				 				</tr>
				 				<tr height="5"><td ></td></tr>
				 				<tr>
					 				<td class="text11">&nbsp;<span title="wskcont"><spring:message code="systema.ebooking.orders.form.update.label.consignee.contactName"/></span></td>
					 				<td class="text11">&nbsp;<span title="wsktlf"><spring:message code="systema.ebooking.orders.form.update.label.consignee.telephone"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="wskcont" id="wskcont" size="25" maxlength="30" value="${model.record.wskcont}"></td>
				 					<td class="text11"><input type="text" class="inputTextMediumBlueUPPERCASE" name="wsktlf" id="wsktlf" size="25" maxlength="30" value="${model.record.wsktlf}"></td>
				 				</tr>
					 			<tr>	
					 				<td class="text11" colspan="2">&nbsp;<span title="wskmail"><spring:message code="systema.ebooking.orders.form.update.label.consignee.email"/></span></td>
					 			</tr>
					 			<tr>	
				 					<td class="text11" colspan="2"><input type="text" class="inputTextMediumBlue" name="wskmail" id="wskmail" size="50" maxlength="70" value="${model.record.wskmail}"></td>
				 				</tr>
				 				
				 				<tr height="8"><td ></td></tr>
								<tr>
				 					<td class="text12Bold">&nbsp;
				 						<img style="vertical-align: bottom;" width="24px" height="24px" src="resources/images/invoice.png" border="0" alt="invoice">
				 						<spring:message code="systema.ebooking.orders.form.update.label.consignee.invoicee"/>
				 					</td>
								</tr>
				 																	 				
				 				<tr>
				 					<td colspan="2">
				 					<table class="tableBorderWithRoundCornersLightGray">
					 					<tr>
							 				<td class="text11">
							 					&nbsp;<span title="heknkf"><spring:message code="systema.ebooking.orders.form.update.label.consignee.invoicee.id"/>&nbsp;</span>
							 				</td>
							 				<td class="text11">
							 					&nbsp;<span title="henakf"><spring:message code="systema.ebooking.orders.form.update.label.consignee.invoicee.name"/>&nbsp;</span>
							 				</td>
							 				
						 				</tr>
						 				<tr>	
						 					<td class="text11" ><input type="text" class="inputTextMediumBlueUPPERCASE" name="heknkf" id="heknkf" size="10" maxlength="8" value="${model.record.heknkf}"></td>
										 	<td class="text11" ><input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="henakf" id="henakf" size="31" maxlength="30"value="${model.record.henakf}"></td>
						 					
					 					</tr>
									</table>
									</td>				 				
					 			</tr>
					 											 
				 				<tr height="10"><td ></td></tr>
			 				</table>
						 	</td>
					 	</tr>
					 	<tr height="10"><td ></td></tr>
					 </table>
				</td>
			</tr>
			<tr>
            		<td>
	        			<table style="width:99%;" align="left" class="tableBorderWithRoundCornersGray" cellspacing="0" cellpadding="0">
				 		<tr height="5"><td colspan="2" ></td></tr>
				 		<tr>
							<td valign="top" style="width:50%;border-right:1px solid;border-color:#FFFFFF;""  >
								<table>
						 		<tr height="2"><td ></td></tr>
							 	<tr>	
						 			<td class="text11">
						 				<img onMouseOver="showPop('helka_info');" onMouseOut="hidePop('helka_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
						 				<font class="text12RedBold" >*</font><span title="helka/hesdf"><spring:message code="systema.ebooking.orders.form.update.label.from"/>&nbsp;</span>
						 				<div class="text11" style="position: relative;" align="left">
											<span style="position:absolute;top:0px; width:250px" id="helka_info" class="popupWithInputText"  >
												<font class="text11">
							           			<b>Fra sted</b>
							           			<div>
							           			<p>Landkode + postnr / kode for "kundefraktens" frasted. Ved IKKE postnr.basert er det kun ett kodefelt (5 langt)
												</p>
							           			</div>
						           			</font>
										</span>
										</div>
				 					</td>
					 				<td class="text11">
					 					<select required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" class="inputTextMediumBlue11MandatoryField" name="helka" id="helka">
					 						<option value="">-landkode-</option>
						 				  	<c:forEach var="country" items="${model.countryCodeList}" >
						 				  		<option value="${country.zkod}"<c:if test="${model.record.helka == country.zkod}"> selected </c:if> >${country.zkod}</option>
											</c:forEach>  
										</select>
										
					 				</td>
						 			<td class="text11" nowrap>
						 				<input required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" type="text" class="inputTextMediumBlue11MandatoryField" name="hesdf" id="hesdf" size="6" maxlength="5" value="${model.record.hesdf}">
						 				<a tabindex=0 id="hesdfIdLink">
	 										<img id="imgFromSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" width="13px" height="13px" border="0" alt="search">
	 									</a>
					 				</td>
					 				<td class="text11" colspan="2">
						 				<input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="OWNwppns1" id="OWNwppns1" size="20" maxlength="14" value="${Xmodel.record.wppns1}">
					 				</td>
					 				<td class="text11">&nbsp;&nbsp;</td>
					 			</tr>
					 			<tr>	
						 			<td class="text11">
						 				
						 				<img onMouseOver="showPop('hetri_info');" onMouseOut="hidePop('hetri_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
						 				<font class="text12RedBold" >*</font><span title="hetri/hesdt"><spring:message code="systema.ebooking.orders.form.update.label.to"/></span>
						 				<div class="text11" style="position: relative;" align="left">
											<span style="position:absolute;top:0px; width:250px" id="hetri_info" class="popupWithInputText"  >
												<font class="text11">
							           			<b>Til sted</b>
							           			<div>
							           			<p>Landkode + postnr / kode for "kundefraktens" tilsted. Ved IKKE postnr.basert er det kun ett kodefelt (5 langt).
												</p>
							           			</div>
						           			</font>
										</span>
										</div>
					 				</td>
					 				<td class="text11">
					 					<select required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" class="inputTextMediumBlue11MandatoryField" name="hetri" id="hetri">
					 						<option value="">-landkode-</option>
						 				  	<c:forEach var="country" items="${model.countryCodeList}" >
						 				  		<option value="${country.zkod}"<c:if test="${model.record.hetri == country.zkod}"> selected </c:if> >${country.zkod}</option>
											</c:forEach>  
										</select>
										
					 				</td>
						 			<td class="text11" nowrap>
						 				<input type="text" required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" class="inputTextMediumBlue11MandatoryField" name="hesdt" id="hesdt" size="6" maxlength="5" value="${model.record.hesdt}">
						 				<a tabindex=0 id="hesdtIdLink" >
	 										<img id="imgToSearch" align="bottom" style="cursor:pointer;" src="resources/images/find.png" width="13px" height="13px" border="0" alt="search">
	 									</a>
					 				</td>
									<td class="text11" colspan="2">
						 				<input readonly tabindex=-1 type="text" class="inputTextReadOnly" name="OWNwppns2" id="OWNwppns2" size="20" maxlength="14" value="${Xmodel.record.wppns2}">
					 				</td>
					 				<td class="text11">&nbsp;&nbsp;</td>
					 			</tr>					 			
							 	</table>
							</td>
							<td align="left">
							<table >
								<tr>
									<td colspan="4">
									<table>
						 			<tr>		
										<td nowrap class="text11">&nbsp;&nbsp;<span title="hent"><spring:message code="systema.ebooking.orders.form.update.label.kolli"/></span></td>
							 			<td class="text11"><input type="text" class="inputTextMediumBlue11" size="10" maxlength="10" name="hent" id="hent" value="${model.record.hent}"></td>
							 			<td nowrap class="text11">&nbsp;<span title="hevkt"><spring:message code="systema.ebooking.orders.form.update.label.vekt"/></span></td>
							 			<td class="text11"><input type="text" class="inputTextMediumBlue11" size="10" maxlength="10" name="hevkt" id="hevkt" value="${model.record.hevkt}"></td>
							 			<td nowrap class="text11">&nbsp;<span title="hem3"><spring:message code="systema.ebooking.orders.form.update.label.m3"/></span></td>
							 			<td class="text11"><input type="text" class="inputTextMediumBlue11" size="10" maxlength="10" name="hem3" id="hem3" value="${model.record.hem3}"></td>
							 			<td nowrap class="text11">&nbsp;<span title="helm"><spring:message code="systema.ebooking.orders.form.update.label.lm"/></span></td>
							 			<td class="text11"><input type="text" class="inputTextMediumBlue11" size="10" maxlength="10" name="helm" id="helm" value="${model.record.helm}"></td>
							 		</tr>
							 		</table>
							 		</td>
							 	</tr>
							 	<tr height="3"><td ></td></tr> 		
						 		<tr>	
						 			<td class="text11" >&nbsp;
										<img onMouseOver="showPop('godsnr_info');" onMouseOut="hidePop('godsnr_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
						 				<span title="hevs1/hevs2"><spring:message code="systema.ebooking.orders.form.update.label.godsbesk"/></span>
						 				<div class="text11" style="position: relative;" align="left">
											<span style="position:absolute;top:2px; width:250px" id="godsnr_info" class="popupWithInputText"  >
												<font class="text11">
							           			<b>Godsbeskr</b>
							           			<div>
							           			<p>todo</p>
							           			</div>
						           			</font>
										</span>
										</div>
									</td>
						 			<td class="text11" ><input type="text" class="inputTextMediumBlue11UPPERCASE" size="30" maxlength="15" name="hevs1" id="hevs1" value="${model.record.hevs1}"></td>									
									<td class="text11"><input type="text" class="inputTextMediumBlue11UPPERCASE" size="30" maxlength="15" name="hevs2" id="hevs2" value="${model.record.hevs2}"></td>									
									
								</tr>
								<tr>	
						 			<td class="text11" >&nbsp;
										<img onMouseOver="showPop('merking_info');" onMouseOut="hidePop('merking_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
						 				<span title="hegm1/hegm2"><spring:message code="systema.ebooking.orders.form.update.label.merking"/></span>
						 				<div class="text11" style="position: relative;" align="left">
											<span style="position:absolute; left:0px; top:0px; width:350px" id="merking_info" class="popupWithInputText"  >
												<font class="text11">
							           			<b>Merking</b>
							           			<div>
							           			<p>todo</p>
							           			</div>
						           			</font>
										</span>
										</div>
									</td>
						 			<td class="text11"><input type="text" class="inputTextMediumBlue11UPPERCASE" size="30" maxlength="15" name="hegm1" id="hegm1" value="${model.record.hegm1}"></td>									
									<td class="text11"><input type="text" class="inputTextMediumBlue11UPPERCASE" size="30" maxlength="15" name="hegm2" id="hegm2" value="${model.record.hegm2}"></td>									
									
								</tr>
								
							</table>
							</td>
						</tr>
						
						
						
						<tr height="8"><td colspan="2" ></td></tr>
						<tr height="1"><td colspan="2" style="border-bottom:1px solid;border-color:#FFFFFF;" class="text"></td></tr>
						<tr height="8"><td colspan="2" ></td></tr>
						<tr>
							<td colspan="4">
							<table>	
								<tr>
									<td>
									<table>
						 			<tr>		
										<td class="text11">&nbsp;
											<span title="todo"><spring:message code="systema.ebooking.orders.form.update.label.oppdragstype"/></span>
							 			</td>
							 			<td class="text11">
							 				<select name="todo" id="todo">
							 					<option value='todo' <c:if test="${fraktbrevRecord.ffenh == 'KG' || fraktbrevRecord.ffenh == 'kg'}"> selected </c:if> >INNLANDSOPPDRAG</option>
											</select>
							 			</td>
										<td width="30px">&nbsp;</td>
										<td class="text11">&nbsp;
											<span title="todo"><spring:message code="systema.ebooking.orders.form.update.label.incoterms"/></span>
							 			</td>
							 			<td class="text11">
							 				<select name="todo" id="todo">
							 					<option value='todo' <c:if test="${fraktbrevRecord.ffenh == 'KG' || fraktbrevRecord.ffenh == 'kg'}"> selected </c:if> >SENDER BETALER</option>
											</select>
							 			</td>
										<td width="30px">&nbsp;</td>
										<td class="text11">&nbsp;
											<span title="todo"><spring:message code="systema.ebooking.orders.form.update.label.productcode"/></span>
							 			</td>
							 			<td class="text11">
							 				<select name="todo" id="todo">
							 					<option value='todo' <c:if test="${fraktbrevRecord.ffenh == 'KG' || fraktbrevRecord.ffenh == 'kg'}"> selected </c:if> >Normalfrakt</option>
											</select>
							 			</td>
						 			</tr>
						 			</table>
						 			</td>
						 		</tr>
					 		</table>
					 		</td>
				 		</tr>
						
						
						
						<tr height="5"><td ></td></tr>	
	 				</table>
            		</td>
            </tr>
            <tr height="2"><td></td></tr>
            
            <%--
            <tr>
            		<td>
	        			<table style="width:99%;" align="left" class="tableBorderWithRoundCornersGray" border="0" cellspacing="0" cellpadding="0">
				 		<tr height="6"><td></td></tr>
				 		<%-- UPDATE LINEs SECTION --%>
				 		<tr>
							<td colspan="2" valign="top" style="width:100%;" >
								<table border="0" style="table-layout: fixed; width:1460px;" cellpadding="0" cellspacing="2" >
						 		<tr class="tableHeaderField10" >
							 		<td width="2%" align="left" valign="bottom" class="tableHeaderFieldFirst11"><span title="fvlinr">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.linenr"/></span></td>
							 		<td align="left" valign="bottom" class="tableHeaderField11"><span title="fmmrk1/hegm1(Tot)">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.marks"/></span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvant/hent(Tot)">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.ebooking.orders.form.detail.update.label.antal"/>&nbsp;</span></td>
						 			<td width="7%" align="left" valign="bottom" class="tableHeaderField11"><span title="fvpakn">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.forpak"/></span></td>
						 			<td width="7%" align="left" valign="bottom" class="tableHeaderField11"><span title="fvvt/hevs1(Tot)">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.ebooking.orders.form.detail.update.label.goodsDesc"/></span></td>
						 			<td width="7%" align="right" valign="bottom" class="tableHeaderField11"><span title="fvvkt/hevkt(Tot)">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.ebooking.orders.form.detail.update.label.weight"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlen">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.length"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvbrd">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.width"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvhoy">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.height"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvvol/hem3(Tot)">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.m3"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlm/helm(Tot)">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.lm.fa"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlm2/helmla(Tot)">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.lm.la"/>&nbsp;</span></td>
						 			<td width="6%" align="left" valign="bottom" class="tableHeaderField11"><span title="ffunnr">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.unNr"/>&nbsp;</span></td>
						 			<td width="4%" align="right" valign="bottom" class="tableHeaderField11"><span title="ffembg">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.emg"/>&nbsp;</span></td>
						 			<td width="4%" align="right" valign="bottom" class="tableHeaderField11"><span title="ffindx">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.emg.index"/>&nbsp;</span></td>
						 			
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffantk">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.ant2"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffante">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.mengd"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffenh">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.unit"/>&nbsp;</span></td>
						 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffpoen/hepoen(Tot)">&nbsp;<spring:message code="systema.ebooking.orders.form.detail.update.label.adr"/>&nbsp;</span></td>
						 			<td align="left" valign="bottom" class="tableHeaderField11"><span title=""><spring:message code="systema.ebooking.orders.form.detail.update.label.remove"/></span></td>										 			
						 		</tr>
						 		</table>
						 		<div class="ownScrollableSubWindow" style="width:1460px; height:10em;" > 
						 		<table border="0" style="table-layout: fixed; width:1460px" cellpadding="0" cellspacing="2">
						 		<c:forEach items="${model.record.fraktbrevList}" var="fraktbrevRecord" varStatus="counter">
						 			<c:if test="${not empty fraktbrevRecord.fvlinr}">
						 				<c:set var="upperCurrentItemlineNr" scope="request" value="${fraktbrevRecord.fvlinr}"/>
						 				<c:set var="totalNumberOfLines" scope="request" value="${counter.count}"/>
						 					
						 			</c:if>
						 			<%-- lineNr will always be sent(to the controller) in case this is a new line (when fvlinr=null) --%>
						 			<input type="hidden" name="lineNr_${counter.count}" id="lineNr_${counter.count}" value="${counter.count}" >   
							 		<input type="hidden" name="fvlinr_${counter.count}" id="fvlinr_${counter.count}" value="${fraktbrevRecord.fvlinr}" >
							 		   
							 		<tr class="tableRow" >
							 			<td width="2%" align="center" class="tableCellFirst" nowrap>${counter.count}</td>
					               		<td align="left" class="tableCell" nowrap>
						 					<input type="text" class="inputTextMediumBlue10" name="fmmrk1_${counter.count}" id="fmmrk1_${counter.count}" size="10" maxlength="35" value="${fraktbrevRecord.fmmrk1}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onBlur="sumAntal(this);" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10MandatoryField clazzAntMathAware" style="text-align:right;" name="fvant_${counter.count}" id="fvant_${counter.count}" size="7" maxlength="7" value="${fraktbrevRecord.fvant}">
						 				</td>
						 				<td width="6%" align="left" class="tableCell" nowrap>
							 				<input type="text" onBlur="searchPackingCodesOnBlur(this);" class="inputTextMediumBlue10" name="fvpakn_${counter.count}" id="fvpakn_${counter.count}" size="8" maxlength="7" value="${fraktbrevRecord.fvpakn}">
							 				<a tabindex=0 id="fvpaknIdLink_${counter.count}" onClick="searchPackingCodes(this);">
	 											<img id="imgFvpaknSearch" align="bottom" style="cursor:pointer;" src="resources/images/find2.png" height="10px" width="10px" border="0" alt="search">
	 										</a>
						 				</td>
						 				<td width="7%" align="left" class="tableCell" nowrap>
							 				<input onBlur="sumVareslag(this);" type="text" class="inputTextMediumBlue10MandatoryField clazzVareslagAware" name="fvvt_${counter.count}" id="fvvt_${counter.count}" size="10" maxlength="35" value="${fraktbrevRecord.fvvt}">
						 				</td>
						 				<td width="7%" align="right" class="tableCell" nowrap>
							 				<input onBlur="sumWeight(this);" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10MandatoryField clazzWeightMathAware " style="text-align:right;" name="fvvkt_${counter.count}" id="fvvkt_${counter.count}" size="5" maxlength="9" value="${fraktbrevRecord.fvvkt}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvlen_${counter.count}" id="fvlen_${counter.count}" size="4" maxlength="4" value="${fraktbrevRecord.fvlen}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvbrd_${counter.count}" id="fvbrd_${counter.count}" size="4" maxlength="4" value="${fraktbrevRecord.fvbrd}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onBlur="calculateVolume(fvvol_${counter.count});validateItemLine(${counter.count});" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvhoy_${counter.count}" id="fvhoy_${counter.count}" size="4" maxlength="4" value="${fraktbrevRecord.fvhoy}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onBlur="sumVolume(this);" onFocus="calculateVolume(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10 clazzVolMathAware" style="text-align:right;" name="fvvol_${counter.count}" id="fvvol_${counter.count}" size="6" maxlength="8" value="${fraktbrevRecord.fvvol}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onBlur="sumLm();validateItemLineExtensionLmLma(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10 clazzLmMathAware" style="text-align:right;" name="fvlm_${counter.count}" id="fvlm_${counter.count}" size="4" maxlength="5" value="${fraktbrevRecord.fvlm}">
						 				</td>
						 				<td align="right" class="tableCell" nowrap>
							 				<input onBlur="sumLmla();validateItemLineExtensionLmLma(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10 clazzLmlaMathAware" style="text-align:right;" name="fvlm2_${counter.count}" id="fvlm2_${counter.count}" size="4" maxlength="5" value="${fraktbrevRecord.fvlm2}">
						 				</td>
						 				<td width="5%" align="left" class="tableCellDangerousGoods" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnr(${counter.count});"  onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffunnr_${counter.count}" id="ffunnr_${counter.count}" size="4" maxlength="4" value="${fraktbrevRecord.ffunnr}">
							 				<a tabindex=0 id="ffunnrIdLink_${counter.count}" onClick="searchDangerousGoods(this);">
	 											<img id="imgUnnrSearch" align="bottom" style="cursor:pointer;" src="resources/images/find2.png" height="10px" width="10px" border="0" alt="search">
	 										</a>
						 				</td>
						 				<td width="4%" align="right" class="tableCellDangerousGoods" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnr(${counter.count});"  type="text" class="inputTextMediumBlue10" style="text-align:center;" name="ffembg_${counter.count}" id="ffembg_${counter.count}" size="3" maxlength="3" value="${fraktbrevRecord.ffembg}">
							 				
						 				</td>
						 				<td width="4%" align="right" class="tableCellDangerousGoods" nowrap>
						 					<input onBlur="validateDangerousGoodsUnnr(${counter.count});"  type="text" class="inputTextMediumBlue10" style="text-align:center;" name="ffindx_${counter.count}" id="ffindx_${counter.count}" size="2" maxlength="2" value="${fraktbrevRecord.ffindx}">
						 				</td>
						 				
						 				<td align="right" class="tableCellDangerousGoods" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnr(${counter.count});"  onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffantk_${counter.count}" id="ffantk_${counter.count}" size="5" maxlength="5" value="${fraktbrevRecord.ffantk}">
						 				</td>
						 				<td align="right" class="tableCellDangerousGoods" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnr(${counter.count});" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffante_${counter.count}" id="ffante_${counter.count}" size="6" maxlength="7" value="${fraktbrevRecord.ffante}">
						 				</td>
						 				<td align="right" class="tableCellDangerousGoods">
							 				<select onChange="validateDangerousGoodsUnnr(${counter.count});" name="ffenh_${counter.count}" id="ffenh_${counter.count}">
							 					<option value=''>?</option> 
					 							<option value='KG' <c:if test="${fraktbrevRecord.ffenh == 'KG' || fraktbrevRecord.ffenh == 'kg'}"> selected </c:if> >KG</option>
					 							<option value='LTR' <c:if test="${fraktbrevRecord.ffenh == 'LTR' || fraktbrevRecord.ffenh == 'ltr'}"> selected </c:if> >LTR</option>
					 							<option value='GR' <c:if test="${fraktbrevRecord.ffenh == 'GR' || fraktbrevRecord.ffenh == 'gr'}"> selected </c:if> >GR</option>
											</select>
						 				</td>
						 				<td align="right" class="tableCellDangerousGoods" nowrap>
							 				<input readonly tabindex=-1 type="text" class="inputText11ReadOnly clazzAdrMathAware" style="text-align:right;" name="ffpoen_${counter.count}" id="ffpoen_${counter.count}" size="5" maxlength="5" value="${fraktbrevRecord.ffpoen}">
						 				</td>
					 					<td width="2%" align="left" class="tableCell" >
						               		<c:if test="${not empty fraktbrevRecord.fvlinr}">
						               			<c:if test="${ model.record.singleLine == 'N' }">
							               			<a id="deleteLine_${counter.count}" onClick="deleteOrderLine(this);">
							               				<img valign="bottom" src="resources/images/delete.gif" border="0" alt="remove">
								               		</a>
							               		</c:if>
						               		</c:if> 	
							 			</td>
						 			</tr>
						 			
						 			
					 			</c:forEach>
					 			</table>
						 		</div>
							</td>
						</tr>
						<tr height="1"><td ></td></tr>
						<tr>
							<td colspan="2" valign="top" style="width:100%;" >
								<table border="0" style="table-layout: fixed; width:1460px;" cellpadding="0" cellspacing="2" >
					 			<input type="hidden" name="totalNumberOfLines" id="totalNumberOfLines" value="${totalNumberOfLines}" >
					 			<%-- TOTALS --%>
								<tr class="tableRow">	
									<td width="2%" align="left" class="tableHeaderFieldFirst11">
										<%--this hidden field is crucial for ADD NEW line functionality. We will send the new line = upperCurrentItemlineNr + 1 --%>
										<input type="hidden" id="upperCurrentItemlineNr" name="upperCurrentItemlineNr" value="${upperCurrentItemlineNr}">
										<b>TOT</b>
									</td>
									<td align="left" class="tableHeaderField11">
										<input type="text" class="inputTextMediumBlue10" name="hegm1" id="hegm1" size="6" maxlength="35" value="${Xmodel.record.hegm1}">
									</td>
						 			<td align="right" class="tableHeaderField11">
						 				<input onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10MandatoryField" style="text-align:right;" name="hent" id="hent" size="8" maxlength="7" value="${Xmodel.record.hent}">
						 			</td>
						 			<td width="7%" align="left" class="tableHeaderField11">&nbsp;</td>
						 			<td width="7%" align="left" class="tableHeaderField11">
						 				<input type="text" class="inputTextMediumBlue10MandatoryFieldUPPERCASE" style="text-align:left;" name="hevs1" id="hevs1" size="10" maxlength="25" value="${Xmodel.record.hevs1}">
						 			</td>
						 			<td width="7%" align="right" class="tableHeaderField11">
						 				<input onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10MandatoryField" style="text-align:right;" name="hevkt" id="hevkt" size="8" maxlength="9" value="${Xmodel.record.hevkt}">
						 			</td>
						 			<td align="left" class="tableHeaderField11">&nbsp;</td>
						 			<td align="left" class="tableHeaderField11">&nbsp;</td>
						 			<td align="left" class="tableHeaderField11">&nbsp;</td>
						 			<td align="right" class="tableHeaderField11"><span title="hem3">&nbsp;</span>
						 				<input onBlur="checkHem3(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10Bold" style="text-align:right;" name="hem3" id="hem3" size="5" maxlength="8" value="${Xmodel.record.hem3}">
					 				</td>
						 			<td align="right" class="tableHeaderField11"><span title="helm">&nbsp;</span>
						 				<input onBlur="checkHelm(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10Bold" style="text-align:right;" name="helm" id="helm" size="5" maxlength="5" value="${Xmodel.record.helm}">
					 				</td>
						 			<td align="right" class="tableHeaderField11"><span title="helmla">&nbsp;</span>
						 				<input onBlur="checkHelmla(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10Bold" style="text-align:right;" name="helmla" id="helmla" size="5" maxlength="5" value="${Xmodel.record.helmla}">
						 			</td>
						 			<td width="6%" align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td width="4%" align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td width="4%" align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td align="right" class="tableHeaderField11">&nbsp;</td>
						 			<td align="right" class="tableHeaderField11"><span title="hepoen">&nbsp;</span>
						 				<input readonly tabindex=-1 onKeyPress="return amountKey(event)" type="text" class="inputText10BlueBoldReadOnly" style="text-align:right;" name="hepoen" id="hepoen" size="5" maxlength="5" value="${Xmodel.record.hepoen}">
						 			</td>
						 			<td width="2%" align="left" class="tableHeaderField11">
						 				<img onMouseOver="showPop('psum_info');" onMouseOut="hidePop('psum_info');" style="vertical-align:middle;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
						 				<span title="hestl4">P</span>
						 				<input type="checkbox" id="hestl4" name="hestl4" value="P" <c:if test="${Xmodel.record.hestl4 == 'P'}"> checked </c:if>>
						 				<div class="text11" style="position: relative;" align="left">
											<span style="position:absolute; left:-50px; top:10px; width:200" id="psum_info" class="popupWithInputText"  >
												<font class="text11">
							           			<b>P (Protect)</b>
							           			<div>
							           			<p> Protect sumlinje<br/> 
												</p>
							           			</div>
						           			</font>
											</span>
										</div>
						 			</td>
						 		</tr>
						 		</table>
						 	</td>		
						</tr>
						
						  
						<c:if test="${not empty model.record.hereff && totalNumberOfLines >= 4}">
				 			<tr height="10"><td ></td></tr>
					 		<%-- CREATE NEW LINE SECTION
					 		<tr>
								<td colspan="2" style="padding: 3px;">
									<table align="left" border="0" style="width:99%;background-color:#778899">
									<tr class="tableHeaderField10" >	
							 			<td align="center" valign="bottom" class="tableHeaderFieldFirst11"><span title="fmmrk1">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.marks"/></span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvant/hent(Tot)">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.transportdisp.orders.form.detail.update.label.antal"/>&nbsp;</span></td>
							 			<td align="center" valign="bottom" class="tableHeaderField11"><span title="fvpakn">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.forpak"/></span></td>
							 			<td align="center" valign="bottom" class="tableHeaderField11"><span title="fvvt">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.transportdisp.orders.form.detail.update.label.goodsDesc"/></span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvvkt/hevkt(Tot)">&nbsp;<font class="text12RedBold" >*</font><spring:message code="systema.transportdisp.orders.form.detail.update.label.weight"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlen">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.length"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvbrd">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.width"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvhoy">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.height"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvvol/hem3(Tot)">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.m3"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlm/helm(Tot)">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.lm.fa"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="fvlm2/helmla(Tot)">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.lm.la"/>&nbsp;</span></td>
							 			<td align="center" valign="bottom" class="tableHeaderField11"><span title="ffunnr">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.unNr"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffembg">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.emg"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffindx">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.emg.index"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffantk">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.ant2"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffante">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.mengd"/>&nbsp;</span></td>
							 			<td align="right" valign="bottom" class="tableHeaderField11"><span title="ffenh">&nbsp;<spring:message code="systema.transportdisp.orders.form.detail.update.label.unit"/>&nbsp;</span></td>
							 			
							 		</tr>
							 		<tr >	
							 			<td align="center" class="text11" nowrap>
						 					<input type="text" class="inputTextMediumBlue10" name="fmmrk1" id="fmmrk1" size="10" maxlength="35" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10MandatoryField" style="text-align:right;" name="fvant" id="fvant" size="7" maxlength="7" value="">
						 				</td>
						 				<td align="center" class="text11" nowrap>
							 				<input type="text" onBlur="searchPackingCodesNewLineOnBlur(this);" class="inputTextMediumBlue10" name="fvpakn" id="fvpakn" size="8" maxlength="7" value="">
							 				<a tabindex=0 id="fvpaknIdLinkNewLine" onClick="searchPackingCodesNewLine(this);">
	 											<img id="imgfvpaknSearch" align="bottom" style="cursor:pointer;" src="resources/images/find2.png" height="11px" width="11px" border="0" alt="search">
	 										</a>
						 				</td>
						 				<td align="center" class="text11" nowrap>
							 				<input type="text" class="inputTextMediumBlue10MandatoryField" name="fvvt" id="fvvt" size="10" maxlength="35" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10MandatoryField" style="text-align:right;" name="fvvkt" id="fvvkt" size="5" maxlength="9" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvlen" id="fvlen" size="4" maxlength="4" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvbrd" id="fvbrd" size="4" maxlength="4" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="calculateVolume(fvvol);validateNewItemLine();" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvhoy" id="fvhoy" size="4" maxlength="4" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onFocus="calculateVolume(this);" onBlur="checkVolumeNewLine(this);" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvvol" id="fvvol" size="6" maxlength="8" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="checkLmNewLine(this);validateNewItemLine();" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvlm" id="fvlm" size="4" maxlength="5" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="checkLm2NewLine(this);validateNewItemLine();" onKeyPress="return amountKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="fvlm2" id="fvlm2" size="4" maxlength="5" value="">
						 				</td>
						 				<td align="center" class="text11" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnrNewLine();"  type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffunnr" id="ffunnr" size="5" maxlength="4" value="">
							 				<a tabindex=0 id="ffunnrIdLinkNewLine" onClick="searchDangerousGoodsNewLine(this);">
	 											<img id="imgUnnrSearch" align="bottom" style="cursor:pointer;" src="resources/images/find2.png" height="11px" width="11px" border="0" alt="search">
	 										</a>
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnrNewLine();" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffembg" id="ffembg" size="5" maxlength="3" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnrNewLine();" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffindx" id="ffindx" size="2" maxlength="2" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnrNewLine();" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffantk" id="ffantk" size="5" maxlength="5" value="">
						 				</td>
						 				<td align="right" class="text11" nowrap>
							 				<input onBlur="validateDangerousGoodsUnnrNewLine();" onKeyPress="return numberKey(event)" type="text" class="inputTextMediumBlue10" style="text-align:right;" name="ffante" id="ffante" size="7" maxlength="7" value="">
						 				</td>
						 				<input type="hidden" id="ownAdrFaktNewLine" name="ownAdrFaktNewLine" value="">
						 				<td align="right" class="text11" nowrap>
							 				<select onChange="validateDangerousGoodsUnnrNewLine();" name="ffenh" id="ffenh">
					 							<option value="">?</option>
					 							<option value="KG">KG</option>
					 							<option value="LTR">LTR</option>
					 							<option value="GR">GR</option>
					 							
											</select>
						 				</td>
						 				<td align="center"><input onClick="addItemLine();" class="inputFormSubmit11Slim" type="button" value='<spring:message code="systema.transportdisp.orders.form.detail.update.createNewLine"/>'></td>
						 			</tr>
						 			<tr></tr>
						 			</table>
					 			</td>
				 			</tr>
				 			--%>	
						</c:if>
						
						
						<tr height="5"><td ></td></tr>
						<%--
						<tr>
							<td colspan="2" valign="top" style="width:100%;">
								<table border="0">
							 		<tr height="2"><td ></td></tr>
							 		<tr>
							 			<td class="text12" nowrap>&nbsp;&nbsp;<span title="hegm2"><spring:message code="systema.transportdisp.orders.form.update.label.marks2"/></span></td>
							 			<td class="text12" width="100px">&nbsp;</td>
							 			<td class="text12" nowrap>&nbsp;&nbsp;&nbsp;<span title="hevs2"><spring:message code="systema.transportdisp.orders.form.update.label.goodsDesc2"/></span></td>
							 			<td class="text12" width="70px">&nbsp;</td>
							 			<td class="text12" nowrap>&nbsp;&nbsp;<span title="hefbv"><spring:message code="systema.transportdisp.orders.form.update.label.fraktberakningsVekt"/></span></td>
							 		</tr>
							 		<tr>
							 			<td class="text11" >&nbsp;	
							 				<input type="text" class="inputTextMediumBlueUPPERCASE" name="hegm2" id="hegm2" size="12" maxlength="10" value="${Xmodel.record.hegm2}">					 				
						 				</td>
						 				<td class="text12" width="100px">&nbsp;</td>
						 				<td class="text11">
							 				<input type="text" class="inputTextMediumBlueUPPERCASE" name="hevs2" id="hevs2" size="12" maxlength="10" value="${Xmodel.record.hevs2}">
						 				</td>
						 				<td class="text12" width="70px">&nbsp;</td>
						 				<td class="text12">
						 					<input readonly type="text" class="inputTextReadOnly tableCell" size="10" value="${Xmodel.record.hefbv}">
						 				</td>
						 			</tr>
						 		</table>
					 		</td>
						</tr>
						 --%>
						<tr height="5"><td ></td></tr>
							
	 				</table>
           		</td>
            </tr>
            <tr height="2"><td></td></tr>
             
            <tr>
				<td colspan="2">
					<table style="width:99%;">
					<tr>
						<td align="right">
		 				    <label class="text11Red" id="orderLineErrMsgPlaceHolder"></label>
	 				    </td>
						<td align="right">
		 				    <c:choose>
			 				    <c:when test="${ not empty model.record.heunik && not empty model.record.hereff }">
			 				    		<input tabindex=-1 class="inputFormSubmit submitSaveClazz" type="submit" name="submit" id="submit" value='<spring:message code="systema.ebooking.submit.save"/>'/>
			 				    </c:when>
			 				    <c:otherwise>
			 				    		<input tabindex=-1 class="inputFormSubmit submitSaveClazz" type="submit" name="submitnew" id="submitnew" value='<spring:message code="systema.ebooking.submit.createnew.order"/>'/>
			 				    </c:otherwise>	
		 				    </c:choose>
	 				    </td>
				    </tr>
				    </table>
			    </td>
			</tr> 	
            <%-- HEADER --%>
	 		<tr>
            		<td>
	        			<table style="width:99%;" class="formFrameHeader" border="0" cellspacing="0" cellpadding="0">
				 		<tr height="15">
				 			<td class="text12White" colspan="5">
							<img onMouseOver="showPop('messageNote_info');" onMouseOut="hidePop('messageNote_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
			 				<span title="messageNoteConsignee/Carrier/Internal"><spring:message code="systema.ebooking.orders.form.update.label.messageNotes"/></span>
			 				<div class="text11" style="position: relative;" align="left">
								<span style="position:absolute; left:0px; top:0px;" id="messageNote_info" class="popupWithInputText"  >
									<font class="text11">
				           			<b>Message/Notes</b>
				           			<div>
				           			<p>The message will be printed as shown in screen.</p>
				           			<ul>
				           				<li>Max.character per line: 70-characters</li>
				           			    <li>Max.number of lines per message area: 2</li>
				           			</ul>	
				           			</div>
			           			</font>
							</span>
							</div>	
			 				</td>
		 				</tr>
	 				</table>
            		</td>
            </tr>
            <tr>
				<td valign="top" colspan="10">
					<table style="width:99%" class="formFrame" > 		
			 		<tr>
			 			<td valign="top" align="left" style="width:70%" >
				 			<table>
				 				
								<tr>
						 			<td class="text12"><spring:message code="systema.ebooking.orders.form.update.label.messageNotes.receiver"/></td>
						 			<td class="text11">
						 				<textarea class="text11UPPERCASE" id="messageNoteConsignee" name="messageNoteConsignee" limit='70,2' cols="75" rows="2">${model.record.messageNoteConsignee}</textarea>
					 				</td>
				 				</tr>
								<tr>
						 			<td class="text12"><spring:message code="systema.ebooking.orders.form.update.label.messageNotes.carrier"/></td>
						 			<td class="text11">
						 				<textarea class="text11UPPERCASE" id="messageNoteCarrier" name="messageNoteCarrier" limit='70,2' cols="75" rows="2">${model.record.messageNoteCarrier}</textarea>
					 				</td>
				 				</tr>
				 				<tr>
						 			<td class="text12"><spring:message code="systema.ebooking.orders.form.update.label.messageNotes.sender"/></td>
						 			<td class="text11">
						 				<textarea class="text11UPPERCASE" id="messageNoteInternal" name="messageNoteConsignor	" limit='70,2' cols="75" rows="2">${model.record.messageNoteInternal}</textarea>
					 				</td>
				 				</tr>
				 				<tr height="5"><td></td></tr>
				 				<tr>
						 			<td class="text12"><spring:message code="systema.ebooking.orders.form.update.label.email"/></td>
						 			<td class="text11">
						 				<input type="text" class="inputTextMediumBlue11" size="40" maxlength="100" name="emailTodo" id="emailTodo" value="${XXmodel.record.hegn}">
						 				&nbsp;(ekstra booking bekreftelse)
					 				</td>									
				 				</tr>
			 				</table>
		 				</td>
		 				<td valign="top" align="left" style="width:30%" >
							<table> 		
					 		<tr>
					 			<td align="left">
					 			<table class="tableBorderWithRoundCorners" width="480px">
									<tr>
							 			<td valign="top" class="text12">Arkiv docs. &nbsp;
						 					<ul>
						 					<c:forEach items="${Xmodel.record.archivedDocsRecord}" var="record" varStatus="counter">
						 						<li>
						 						<a target="_blank" href="transportdisp_workflow_renderArchivedDocs.do?doclnk=${record.doclnk}">
		    		    							<img title="Archive" style="vertical-align:middle;" src="resources/images/pdf.png" width="14" height="14" border="0" alt="PDF arch.">
		    		    							${record.doctxt}
				   								</a>&nbsp;&nbsp;&nbsp;
				   								</li>
						 					</c:forEach>
						 					</ul>
						 				</td>
									</tr>
								</table>
								</td>
							</tr>	
							</table>
						</td>
			 		</tr>
					</table>
				</td>
			</tr>
			<tr height="10"><td ></td></tr>
	</table>
</form>
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->
