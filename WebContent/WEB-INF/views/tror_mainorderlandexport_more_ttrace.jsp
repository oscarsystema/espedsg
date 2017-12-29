<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>
<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerTror.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/trorglobal_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	<SCRIPT type="text/javascript" src="resources/js/tror_mainorderlandexport_more_ttrace.js?ver=${user.versionEspedsg}"></SCRIPT>
	<SCRIPT type="text/javascript" src="resources/js/trorFkeys_landimport.js?ver=${user.versionEspedsg}"></SCRIPT>
	
	<%-- for dialog popup --%>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<style type = "text/css">
	.ui-dialog{font-size:10pt;}
	.ui-datepicker { font-size:9pt;}
	</style>
	


<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
	<tr>
	<td>
	<%-- tab container component --%>
	<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
		<tr height="2"><td></td></tr>
		<tr height="25"> 
			<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
				<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlist.do?action=doFind" > 	
					<img style="vertical-align:middle;" src="resources/images/bulletGreen.png" width="6px" height="6px" border="0" alt="open orders">
					<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.orderlist.tab"/></font>&nbsp;<font class="text10Orange">F2</font>
				</a>
			</td>
			<c:choose>
				<c:when test="${empty recordOrderTrorLandExport.heopd}">
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tab" align="center" nowrap>
						<img style="vertical-align:middle;" src="resources/images/lorry_blue.png" width="18px" height="18px" border="0" alt="create new">
						<font class="tabLink"><spring:message code="systema.tror.createnew.order.tab"/></font>
					</td>
				</c:when>
				<c:otherwise>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandexport.do?action=doFetch&heavd=${recordOrderTrorLandExport.heavd}&heopd=${recordOrderTrorLandExport.heopd}" > 	
							<img style="vertical-align:middle;" src="resources/images/lorry_blue.png" width="18px" height="18px" border="0" alt="update">
							<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.tab"/>&nbsp;${recordOrderTrorLandExport.heavd}/${recordOrderTrorLandExport.heopd}</font>&nbsp;<font class="text10Orange">F4</font>
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandexport_invoice.do?action=doFetch&heavd=${recordOrderTrorLandExport.heavd}&heopd=${recordOrderTrorLandExport.heopd}" > 	
							<img style="vertical-align: bottom" src="resources/images/invoice.png" width="16" hight="16" border="0" alt="show invoice">
							<font class="tabDisabledLink"><spring:message code="systema.tror.order.faktura.tab"/></font><font class="text12">&nbsp;</font>&nbsp;<font class="text10Orange">F10</font>
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="editNotisblock.do?action=doFetch&subsys=tror_le&avd=${recordOrderTrorLandExport.heavd}&opd=${recordOrderTrorLandExport.heopd}&sign=${recordOrderTrorLandExport.hesg}" > 	
							<img style="vertical-align: bottom" src="resources/images/veiledning.png" width="16" hight="16" border="0" alt="show messages">
							<font class="tabDisabledLink"><spring:message code="systema.tror.order.notisblock.tab"/></font><font class="text12">&nbsp;</font>&nbsp;<font class="text10Orange">F9</font>
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandexport_logging.do?avd=${recordOrderTrorLandExport.heavd}&sign=${recordOrderTrorLandExport.hesg}&opd=${recordOrderTrorLandExport.heopd}">
							<img style="vertical-align: bottom" src="resources/images/log-icon.png" width="16" hight="16" border="0" alt="show log">
							<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.logging.tab"/></font>&nbsp;<font class="text10Orange">F7</font>
						</a>
					</td>
					
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandexport_archive.do?avd=${recordOrderTrorLandExport.heavd}&sign=${recordOrderTrorLandExport.hesg}&opd=${recordOrderTrorLandExport.heopd}">
							<img style="vertical-align: bottom" src="resources/images/archive.png" width="16" hight="16" border="0" alt="show archive">
							<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.archive.tab"/></font>&nbsp;<font class="text10Orange">F8</font>
						</a>
					</td>
					<c:if test="${recordOrderTrorLandExport.hepk1 == 'J' || recordOrderTrorLandExport.hepk1 == 'P'}">
						<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
						<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
							<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandexport_freightbill_edit.do?dfavd=${recordOrderTrorLandExport.heavd}&sign=${recordOrderTrorLandExport.hesg}&dfopd=${recordOrderTrorLandExport.heopd}">
								<img style="vertical-align: bottom" src="resources/images/fraktbrev.png" width="16" hight="16" border="0" alt="show freight doc">
								<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.fraktbrev.tab"/></font>&nbsp;<font class="text10Orange">F3</font>
							</a>
						</td>
					</c:if>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tab" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="TODOtror_mainorderlandexport_more.do?avd=${recordOrderTrorLandExport.heavd}&sign=${recordOrderTrorLandExport.hesg}&opd=${recordOrderTrorLandExport.heopd}">
							<img style="vertical-align: bottom" src="resources/images/sort_down.png" width="10" hight="10" border="0" alt="show more">
							<font class="tabLink">&nbsp;<spring:message code="systema.tror.order.more.tab"/></font>
						</a>
					</td>
					
				</c:otherwise>
			</c:choose>
			<td width="80%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
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
			<table style="width:100%" id="wrapperTable" class="tabThinBorderWhite" cellspacing="0" border="0" cellpadding="0">
				<%--for F-Keys shortcuts. Used only in trorFkeys_...js --%>
				<input type="hidden" name="fkeysavd" id="fkeysavd" value='${recordOrderTrorLandExport.heavd}'>
				<input type="hidden" name="fkeysopd" id="fkeysopd" value='${recordOrderTrorLandExport.heopd}'>
				<input type="hidden" name="fkyessign" id="fkyessign" value='${recordOrderTrorLandExport.hesg}'>
			
			<tr height="20"><td>&nbsp;</td></tr>
	 	    
			<tr> <!-- Second tab row... -->
 	   	 		<td align="center" width="99%">
 					<table class="formFrameHeaderTransparent" width="99%" cellspacing="0" border="0" cellpadding="0">
						<tr height="20"> 
								<td width="15%" valign="bottom" class="tabDisabledSub" align="center" nowrap>
									<a id="alinkMainMaintKontaktGate" href="tror_mainorderlandexport_more.do">
										<font class="tabDisabledLinkMinor">&nbsp;<spring:message code="systema.tror.order.more.tab.fellesprint.subtab"/></font>&nbsp;						
									</a>
								</td>
								<td width="12%" valign="bottom" class="tabSub" align="center" nowrap>
									<font class="tabLinkMinor">&nbsp;<spring:message code="systema.tror.order.more.tab.tracktrace.subtab"/></font>&nbsp;						
								</td>
								<td width="12%" valign="bottom" class="tabDisabledSub" align="center" nowrap>
									<font class="tabDisabledLinkMinor">&nbsp;...</font>&nbsp;
									<%--
									<a id="alinkMainMaintFritextGate" href="TODOmainmaintenancecundf_fritekst_edit.do">
										<font class="tabDisabledLinkMinor">&nbsp;...</font>&nbsp;						
									</a>
									 --%>
								</td>
								
							 	<td width="70%" class="tabFantomSpace" align="center" nowrap></td>
						</tr>
					</table>
				</td>
 	   	 	</tr> <!-- End second tab row -->
 	   	 	
 	   	 	<tr>
				<td align="center" width="99%">
					<table class="tabThinBorderWhite" width="99%" cellspacing="0" border="0">
 	   	 				<tr height="30px"><td ></td></tr>
 	   	 				
						<tr>
						<td width="40%" >	
							<%--
							<table align="left" class="formFrameHeader" border="0" cellspacing="0" cellpadding="0">
						 		<tr height="15">
						 			<td colspan="10" class="text12White" align="left" >
						 				<b>&nbsp;&nbsp;Tidsloggning avgang/ankomst på oppdrag</b>
					 				</td>
				 				</tr>
			 				</table>
			 				 --%>
							<table width="50%" align="left" border="0" cellspacing="0" cellpadding="0">
						 		<tr height="5"><td class="text" align="left"></td></tr>
						 		<tr height="15">
						 			<td>
								 		<table class="formFrameHeader" width="100%" border="0" cellspacing="0" cellpadding="0">
								 		<tr>
								 			<td class="text12White" align="left" >
								 				<b>&nbsp;&nbsp;Tidsloggning avgang/ankomst på oppdrag</b>
							 				</td>
						 				</tr>
						 				</table>
					 				</td>
				 				</tr>
				 				<tr height="1px"><td ></td></tr>
						 		<tr>
							 		<td>
								 		<table class="formFrame" width="100%" border="0" cellspacing="0" cellpadding="0">
								 		<tr>
									 		<td>
									 		<table width="90%" >
									 			<tr height="2px"><td class="text" align="left"></td></tr>
										 		<tr>
										 			
										 			<td class="text12" align="left" title="todo"><b>&nbsp;<spring:message code="systema.tror.more.ttrace.label.avgang"/></b></td>
										 			<td class="text12" align="left" title="todo">&nbsp;<spring:message code="systema.tror.more.ttrace.label.etd"/></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoEtd" id="todoEtd" size="10" maxlength="8" value=''></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoEtdTid" id="todoEtdTid" size="5" maxlength="4" value=''></td>
										 			<td class="text12" align="left" title="todo">&nbsp;<spring:message code="systema.tror.more.ttrace.label.atd"/></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoAtd" id="todoAtd" size="10" maxlength="8" value=''></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoAtdTid" id="todoAtaTid" size="5" maxlength="4" value=''></td>
										 			
										        </tr>
										        <tr>
										        	<td class="text12" align="left" title="todo"><b>&nbsp;<spring:message code="systema.tror.more.ttrace.label.ankomst"/></b></td>
										 			<td class="text12" align="left" title="todo">&nbsp;<spring:message code="systema.tror.more.ttrace.label.eta"/></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoEta" id="todoEta" size="10" maxlength="8" value=''></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoEtaTid" id="todoEtaTid" size="5" maxlength="4" value=''></td>
										 			<td class="text12" align="left" title="todo">&nbsp;<spring:message code="systema.tror.more.ttrace.label.ata"/></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoAta" id="todoAta" size="10" maxlength="8" value=''></td>
										 			<td class="text12" align="left"><input type="text" class="inputTextMediumBlue"  name="todoAtaTid" id="todoAtaTid" size="5" maxlength="4" value=''></td>
										 			
										        </tr>
										        <tr height="2px"><td class="text" align="left"></td></tr>
									        </table>
									        </td>
								        </tr>
								        </table>
								        
							        </td>
						        </tr>
						        <tr height="10px"><td class="text" align="left"></td></tr>
		        	        </table>
						</td>
						</tr>	
						<tr height="10px"><td class="text" align="left"></td></tr>
					</table>
				</td>
			</tr>											
 	   	 	<tr height="3"><td></td></tr>
 			</table>
		</td>
	</tr>
	
	<tr height="10"><td ></td></tr>
			
	</table>
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->
