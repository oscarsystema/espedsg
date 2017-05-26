<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerMainMaintenance.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<script type="text/javascript" src="resources/js/mainmaintenancecundf_vareexp_se_edit.js?ver=${user.versionEspedsg}"></script>	
	
	<style type = "text/css">
	.ui-datepicker { font-size:9pt;}
	</style>



<table id="parentTab" width="100%" class="text11" cellspacing="0" border="0" cellpadding="0">
	<tr height="15"><td>&nbsp;</td></tr>
	<tr>
		<td>
			<%-- tab container component --%>
			<table id="tabContainer"  width="100%" class="text11" cellspacing="0" border="0" cellpadding="0">
				<tr height="2"><td></td></tr>
				<tr height="25"> 
					<td width="15%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a id="alinkMainMaintGate" tabindex=-1 style="display:block;" href="mainmaintenancegate.do">
						<font class="tabDisabledLink">&nbsp;
							<spring:message code="systema.main.maintenance.label"/>
						</font>
						<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="general list">
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="15%" valign="bottom" class="tabDisabled" align="center">
						<a id="alinkMainCundfGate" tabindex=-1 style="display:block;" href="mainmaintenancecundf_vkund.do">
						<font class="tabDisabledLink">&nbsp;
							<spring:message code="systema.main.maintenance.customerreg"/>
						</font>&nbsp;
						<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="avd. general list">
						</a>
					</td>
					<c:choose>
						
						<c:when test="${not empty kundeSessionParams.kundnr}">
							<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
							<td width="15%" valign="bottom" class="tab" align="center">
								<font class="tabLink">&nbsp;
									<spring:message code="systema.main.maintenance.customer"/>
								</font>&nbsp;
								<font class="text11MediumBlue">[${tab_knavn_display}]</font>
							</td>
							<td width="55%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
						</c:when>
						<c:otherwise>
							<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
							<td width="15%" valign="bottom" class="tab" align="center">
								<font class="tabLink">&nbsp;
									<spring:message code="systema.main.maintenance.customer.new"/>
								</font>&nbsp;						
								<img style="vertical-align: middle;"  src="resources/images/add.png" width="12" height="12" border="0" alt="new">
							</td>
							<td width="55%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<%-- space separator --%>
	 		<table id="tabRows" width="100%" class="tabThinBorderWhite" border="0" cellspacing="0" cellpadding="0">
	 	    <tr height="20"><td>&nbsp;</td></tr>
			
<!-- 	 	    
	 	    <tr>
	 	   		<td width="25%">&nbsp;</td> 
	 	   		<td>
					<table id="firstTabRow" class="formFrameHeaderTransparent" width="1000" cellspacing="0" border="0" cellpadding="0">
						<tr height="20"> 
							<td width="20">&nbsp;</td>
							<td width="80" valign="bottom" class="tabDisabled" align="center" title="Sköna  personer...">
								<a id="alinkMainMaintMavgGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Miljöavgift</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabled" align="center" title="xXx...">
								<a id="alinkMainMaintMavgGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fane xxx</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabled" align="center">
								<a id="alinkMainMaintxxxGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fane xyz</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabled" align="center">
								<a id="alinkMainMaintxxxGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fane xyz</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabled" align="center">
								<a id="alinkMainMaintxxGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fane xyz</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabledTrailingAbove" align="center">
								<a id="alinkMainMaintxxxGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fane xyz</font>&nbsp;						
								</a>
							</td>

						   <td width="500"></td>
						</tr>
					</table>
				</td>
 	   	 	</tr>
 	
  -->   	 	
 	   	 	<tr> 
 	   	 		<td>&nbsp;</td>
 	   	 	    <td>
 					<table id= "secondTabRow" class="formFrameHeaderTransparent" style="width:1000px" cellspacing="0" border="0" cellpadding="0">
						<tr height="20"> 
							<td width="110" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintKontaktGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_kunde_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer"/>
									</font>
								</a>
							</td>
							<td width="110" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintKontaktGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_kontaktpersoner_list.do">
									<font class="tabDisabledLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.contacts"/>
									</font>&nbsp;						
								</a>
							</td>
							
							<td width="110" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintFritextGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_fritekst_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.text"/>
									</font>&nbsp;						
								</a>
							</td>
							<td width="110" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_params_list.do">
									<font class="tabDisabledLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.params"/>
									</font>&nbsp;						
								</a>
							</td>							
							<td width="110" valign="bottom" class="tabSub" align="center" nowrap>
									<font class="tabLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.vareregister"/>
									</font>&nbsp;						
							</td>
							
<!--  

							<td width="110" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintMavgGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.envfee"/>
									</font>&nbsp;						
								</a>
							</td>							
-->							
<!-- 
							<td width="50" class="tabDisabledTrailingEnd"></td>
 -->
						 	<td width="540" class="tabFantomSpace" align="center" nowrap></td>
						</tr>
					</table>
				</td>
 	   	 	</tr> <!-- End second tab row  -->  

	   	 	<tr> 
 	   	 		<td>&nbsp;</td>
 	   	 	    <td>
 					<table id= "thirdTabRow" class=formFrameHeaderTransparentThirdTabRow style="width:1000px" cellspacing="0" border="0" cellpadding="0">
 					   <tr height="20"><td>&nbsp;</td>
 					   </tr>
					   <tr height="20"> 
							<c:if test="${kundeSessionParams.exportNo == true}">
								<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
									<a id="alinkMainMaintVareExpNoGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareexp_no.do">
											<font class="tabDisabledLinkMinor">&nbsp;
												  <spring:message code="systema.main.maintenance.customer.vareregister.exp.no"/>
											</font>&nbsp;						
									</a>
								</td>
							</c:if>
							<c:if test="${kundeSessionParams.importNo == true}">
								<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
									<a id="alinkMainMaintVareImpNoGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_no.do">
											<font class="tabDisabledLinkMinor">&nbsp;
												  <spring:message code="systema.main.maintenance.customer.vareregister.imp.no"/>
											</font>&nbsp;						
									</a>
								</td>
							</c:if>
							<c:if test="${kundeSessionParams.exportDk == true}">
								<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<!-- 	<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareexp_dk_edit.do">  -->
										<font class="tabDisabledLinkMinor">&nbsp;
											 <spring:message code="systema.main.maintenance.customer.vareregister.exp.dk"/>
										</font>&nbsp;						
								<!--  	</a> -->
								</td>							
							</c:if>
							<c:if test="${kundeSessionParams.importDk == true}">
								<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<!--  	<a id="alinkMainMaintFritextGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_dk_edit.do"> -->
										<font class="tabDisabledLinkMinor">&nbsp;
											 <spring:message code="systema.main.maintenance.customer.vareregister.imp.dk"/>
										</font>&nbsp;						
								<!--  	</a> -->
								</td>
							</c:if>
							<td width="100" valign="bottom" class="tabSub" align="center" nowrap>
									<font class="tabLinkMinor">&nbsp;
										 <spring:message code="systema.main.maintenance.customer.vareregister.exp.se"/>
									</font>&nbsp;						
							</td>		
							<c:if test="${kundeSessionParams.importSe == true}">
								<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<!-- 	<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_se_edit.do">  -->
										<font class="tabDisabledLinkMinor">&nbsp;
											 <spring:message code="systema.main.maintenance.customer.vareregister.imp.se"/>
										</font>&nbsp;						
								<!--  	</a> -->
								</td>
							</c:if>
							
						 	<td width="${kundeSessionParams.fantomSpaceWidth}" class="tabFantomSpace" align="center" nowrap></td>

						</tr>
					</table>
				</td>
 	   	 	</tr> <!-- End third tab row -->

 	   	 	<tr height="30">
 	   	 		<td>&nbsp;</td>
 	   	 		<td width="100%">
 	   	 		 <table id="mainArea" class="tabThinBorderWhite" width="100%" cellspacing="0" border="0" align="left">
 	   	 		 	<tr id="list">
 	   	 		 		<td>&nbsp;
							<table id="mainList" class="display compact cell-border" >
							<thead>
							<tr>
								<th align="center" width="2%" class="tableHeaderField" >&nbsp;<spring:message code="systema.edit"/>&nbsp;</th>
								<th class="tableHeaderField" title="svew_knso">&nbsp;Sökbegrepp&nbsp;</th>
			                    <th class="tableHeaderField" title="svew_vasl">&nbsp;Varubeskrivning&nbsp;</th>
								<th class="tableHeaderField" title="svew_vano">&nbsp;Varupost nr.&nbsp;</th>
								<th class="tableHeaderField" title="svew_vata">&nbsp;Varukod Taric nr&nbsp;</th>
								<th class="tableHeaderField" title="svew_ulkd">&nbsp;Land&nbsp;</th>
								<th class="tableHeaderField" title="svew_brut">&nbsp;Bruttovikt&nbsp;</th>
								<th class="tableHeaderField" title="svew_neto">&nbsp;Nettovikt&nbsp;</th>
								<th class="tableHeaderField" title="svew_eup1">&nbsp;Förfarande 37:1&nbsp;</th>
								<th class="tableHeaderField" title="svew_eup2">&nbsp;Förfarande 37:2&nbsp;</th>
			                    <th align="center" class="tableHeaderField"><spring:message code="systema.delete"/></th>
			                </tr>  
				             </thead> 
				             <tbody >  
					            <c:forEach var="record" items="${model.list}" varStatus="counter">   
					               <tr class="tableRow" height="20" >
						               <td id="recordUpdate_${record.svew_knnr}_${record.svew_knso}" onClick="getRecord(this);" align="center" width="2%" class="tableCellFirst" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
				               				<img src="resources/images/update.gif" border="0" alt="edit">
						               </td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 1px;border-color:#FAEBD7;"><font class="text12">&nbsp;${record.svew_knso}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_vasl}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_vano}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_vata}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_ulkd}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_brut}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_neto}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_eup1}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.svew_eup2}&nbsp;</font></td>
						               
						               <td align="center" width="2%" class="tableCell" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
				               				<a onclick="javascript:return confirm('<spring:message code="systema.delete.confirm"/>')" tabindex=-1 href="mainmaintenancecundf_vareexp_se_edit.do?action=doDelete&svew_knnr=${record.svew_knnr}&svew_knso=${record.svew_knso}">
							               		<img valign="bottom" src="resources/images/delete.gif" border="0" width="15px" height="15px" alt="remove">
							               	</a>
						               </td>
					               </tr> 
					            </c:forEach>
					          </tbody>
				            </table>
 	   	 		 		</td>
 	   	 		 	</tr>

					<tr height="25">
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

 	   	 		 	<tr id="details">
 	   	 		 		<td>
							<form action="mainmaintenancecundf_vareexp_se_edit.do" name="formRecord" id="formRecord" method="POST" >
								<input type="hidden" name="applicationUser" id="applicationUser" value="${user.user}">
								<input type="hidden" name="updateId" id="updateId" value="${model.updateId}"> 
								<input type="hidden" name="action" id=action value="doUpdate">
								<table id="paramsDetails" width="100%" cellspacing="0" border="0" align="left">
									<spring:hasBindErrors name="record"> 
										<tr>
											<td>
												<table align="left" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td>
															<ul class="isa_error text12">
																<c:forEach var="error" items="${errors.allErrors}">
																	<li><spring:message code="${error.code}"
																			text="${error.defaultMessage}" />&nbsp;&nbsp;</li>
																</c:forEach>
															</ul>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</spring:hasBindErrors>
									<c:if test="${not empty model.errorMessage}">
									<tr>
										<td >
								           	<table align="left" border="0" cellspacing="0" cellpadding="0">
										 		<tr>
										 			<td >
										 				<ul class="isa_error text12" >
								                                  <li>${model.errorMessage}</li>                                    
								                              </ul>
										 			</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:if>
								
									<tr>
										<td>
											<button name="newRecordButton" id="newRecordButton" class="inputFormSubmitStd" type="button">
												<spring:message code="systema.new"/>
											</button>&nbsp;&nbsp;
									</tr>
									<tr height="2">
										<td>&nbsp;</td>
									</tr>
									<tr> <!-- Artikelinfo -->
										<td colspan="2">
		
									<div id="accordion">
		
											<table class="formFrameHeaderPeachWithBorder" width="97%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">&nbsp;
														Artikelinfo
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="50%" valign="top">
														<table border="0">
															<tr>
																<td class="text12" title="svew_knso">&nbsp;<font class="text14RedBold" >*</font>Sökbegrepp:</td>
																<td class="text12">
																	<input type="text"  required oninvalid="this.setCustomValidity('Obligatoriskt')" onchange="setCustomValidity('')" class="inputTextMediumBlueMandatoryField" name="svew_knso" id="svew_knso" size="35" maxlength="35" value='${model.record.svew_knnr}'>
																	&nbsp;Varukod Taric nr:
																	<input type="text" class="inputTextMediumBlue" name="svew_vata" id="svew_vata" size="10" maxlength="8" value='${model.record.svew_vata}'>
																</td>
																<td class="text12" title="svew_lagi">&nbsp;Id:</td>
																<td>
																	<input type="text" class="inputTextMediumBlue" name="svew_lagi" id="svew_lagi" size="15" maxlength="14" value='${model.record.svew_lagi}'>
																</td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_vasl">&nbsp;Beskrivning:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vasl" id="svew_vasl" size="70" maxlength="70" value='${model.record.svew_vasl}'></td>
																<td class="text12" title="svew_ulkd">&nbsp;Land:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_ulkd" id="svew_ulkd" size="2" maxlength="2" value='${model.record.svew_ulkd}'>
																</td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_vasl2">&nbsp;Beskrivning:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vasl" id="svew_vasl" size="70" maxlength="70" value='${model.record.svew_vasl2}'></td>
																<td class="text12" title="svew_vati">&nbsp;Varukod (33:3):</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vati" id="svew_vati" size="5" maxlength="4" value='${model.record.svew_vati}'>
																</td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_vasl3">&nbsp;Beskrivning:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vasl3" id="svew_vasl3" size="70" maxlength="70" value='${model.record.svew_vasl3}'></td>
																<td class="text12" title="svew_vat4">&nbsp;Varukod (33:4):</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vat4" id="svew_vat4" size="5" maxlength="4" value='${model.record.svew_vat4}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_vasl4">&nbsp;Beskrivning:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vasl4" id="svew_vasl4" size="70" maxlength="70" value='${model.record.svew_vasl4}'></td>
																<td class="text12" title="svew_vat5">&nbsp;Varukod (33:5):</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vat5" id="svew_vat5" size="5" maxlength="4" value='${model.record.svew_vat5}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_vasl5">&nbsp;Beskrivning:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_vasl5" id="svew_vasl5" size="70" maxlength="70" value='${model.record.svew_vasl5}'></td>
																<td class="text12" title="svew_vano">&nbsp;Varupost nr:</td>
																<td>
																	<input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue" name="svew_vano" id="svew_vano" size="5" maxlength="5" value='${model.record.svew_vano}'>
																</td>
															</tr>
															<tr>
																<td class="text12" title="svew_komr">&nbsp;Komm. ref.nr:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_komr" id="svew_komr" size="70" maxlength="70" value='${model.record.svew_komr}'></td>
																<td class="text12" title="svew_fnkd">&nbsp;FN-kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_fnkd" id="svew_fnkd" size="5" maxlength="4" value='${model.record.svew_knso}'></td>
															</tr>

														</table>
													</td>
													
													<td width="50%" valign="top">
														<table border="0">
															<tr>
																<td class="text12" title="svew_brut">Bruttovikt:</td>
																<td><input type="text" onKeyPress="return amountKey(event)" class="inputTextMediumBlue" name="svew_brut" id="svew_brut" size="15" maxlength="18" value='${model.record.svew_knso}'></td>
																<td class="text12" title="svew_eup1">Förf.(37:1):</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_eup1" id="svew_eup1" size="5" maxlength="4" value='${model.record.svew_eup1}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_neto">Nettovikt:</td>
																<td><input type="text" onKeyPress="return amountKey(event)" class="inputTextMediumBlue" name="svew_neto" id="svew_neto" size="15" maxlength="18" value='${model.record.svew_neto}'></td>
																<td class="text12" title="svew_eup2">Förf.(37:2):</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_eup2" id="svew_eup2" size="5" maxlength="4" value='${model.record.svew_eup2}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_betk">Betalkod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_betk" id="svew_betk" size="2" maxlength="1" value='${model.record.svew_betk}'></td>
																<td class="text12" title="svew_ankv">Kvantitet:</td>
																<td><input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue" name="svew_ankv" id="svew_ankv" size="10" maxlength="10" value='${model.record.svew_ankv}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_kono">Kont. nr.:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_kono" id="svew_kono" size="5" maxlength="3" value='${model.record.svew_kono}'></td>
																<td class="text12" title="svew_stva">Stat. värde:</td>
																<td><input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue" name="svew_stva" id="svew_stva" size="12" maxlength="11" value='${model.record.svew_stva}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_atin">Indikator:</td>
																<td><input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue" name="svew_atin" id="svew_atin" size="5" maxlength="3" value='${model.record.svew_atin}'></td>
																<td class="text12" title="svew_stva2">Tullvärde:</td>
																<td><input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue" name="svew_stva2" id="svew_stva2" size="12" maxlength="11" value='${model.record.svew_stva2}'></td>
															</tr>

															<tr>
																<td class="text12" title="svew_call">Call me:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_call" id="svew_call" size="3" maxlength="2" value='${model.record.svew_call}'></td>
																<td class="text12" title="svew_fabl">Belopp, fakt.:</td>
																<td><input type="text" onKeyPress="return amountKey(event)" class="inputTextMediumBlue" name="svew_fabl" id="svew_fabl" size="12" maxlength="14" value='${model.record.svew_fabl}'></td>
															</tr>

															<tr>
																<td class="text12" title="svew_lagt">Lager id:</td>
																<td><input type="text"  class="inputTextMediumBlue" name="svew_lagt" id="svew_lagt" size="2" maxlength="1" value='${model.record.svew_lagt}'></td>
																<td class="text12" title="svew_lagl">Landkod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_lagl" id="svew_lagl" size="3" maxlength="2" value='${model.record.svew_lagl}'></td>
															</tr>

														</table>
													</td>
												</tr>
											</table>
			
		 					</div>  
			
										</td>
									</tr>  <!-- End Artikelinfo -->


									<tr> <!-- Bilagda handlingar -->
	
	
	
										<td colspan="2">


		  						<div id="accordion2"> 



											<table class="formFrameHeaderPeachWithBorder" width="97%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">&nbsp;
														Bilagda handlingar
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="50%" valign="top">
														<table border="0">
															<tr>
																<td class="text12" title="svew_bit1">1. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit1" id="svew_bit1" size="5" maxlength="4" value='${model.record.svew_bit1}'></td>
																<td class="text12" title="svew_bii1">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii1" id="svew_bii1" size="35" maxlength="35" value='${model.record.svew_bii1}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_bit2">2. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit2" id="svew_bit2" size="5" maxlength="4" value='${model.record.svew_bit2}'></td>
																<td class="text12" title="svew_bii2">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii1" id="svew_bii2" size="35" maxlength="35" value='${model.record.svew_bii2}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_bit3">3. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit3" id="svew_bit3" size="5" maxlength="4" value='${model.record.svew_bit3}'></td>
																<td class="text12" title="svew_bii3">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii3" id="svew_bii3" size="35" maxlength="35" value='${model.record.svew_bii3}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_bit4">4. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit4" id="svew_bit4" size="5" maxlength="4" value='${model.record.svew_bit4}'></td>
																<td class="text12" title="svew_bii4">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii4" id="svew_bii4" size="35" maxlength="35" value='${model.record.svew_bii4}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_bit5">5. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit5" id="svew_bit5" size="5" maxlength="4" value='${model.record.svew_bit5}'></td>
																<td class="text12" title="svew_bii5">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii5" id="svew_bii5" size="35" maxlength="35" value='${model.record.svew_bii5}'></td>
															</tr>

														</table>
													</td>
													
													<td width="50%" valign="top">
														<table border="0">
															<tr>
																<td class="text12" title="svew_bit6">6. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit6" id="svew_bit6" size="5" maxlength="4" value='${model.record.svew_bit6}'></td>
																<td class="text12" title="svew_bii6">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii6" id="svew_bii6" size="35" maxlength="35" value='${model.record.svew_bii6}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_bii7">7. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii7" id="svew_bii7" size="5" maxlength="4" value='${model.record.svew_bii7}'></td>
																<td class="text12" title="svew_bii7">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii7" id="svew_bii7" size="35" maxlength="35" value='${model.record.svew_bii7}'></td>
															</tr>
															<tr>
																<td class="text12" title="svew_bit8">8. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit8" id="svew_bit8" size="5" maxlength="4" value='${model.record.svew_bit8}'></td>
																<td class="text12" title="svew_bii8">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii8" id="svew_bii8" size="35" maxlength="35" value='${model.record.svew_bii8}'></td>
															</tr>
															
															<tr>
																<td class="text12" title="svew_bit9">9. Kod:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bit9" id="svew_bit9" size="5" maxlength="4" value='${model.record.svew_bit9}'></td>
																<td class="text12" title="svew_bii9">&nbsp;Identitet:</td>
																<td><input type="text" class="inputTextMediumBlue" name="svew_bii9" id="svew_bii9" size="35" maxlength="35" value='${model.record.svew_bii9}'></td>
															</tr>

														</table>
													</td>
												</tr>
											</table>
	
							</div>
		
	
										</td>
										
										
										
										
									</tr>  <!-- End Bilagda handlingar -->

									<tr> <!-- Särskilda uppl. o Särskilda uppl. -->
										<td width="50%" valign="top">
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
														&nbsp;
														Särskilda upplysningar
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr>
													<td class="text12" title="svew_suko">1. Kod:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_suko" id="svew_suko" size="7" maxlength="5" value='${model.record.svew_suko}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutx">1. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutx" id="svew_sutx" size="70" maxlength="70" value='${model.record.svew_sutx}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutx2">2. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutx2" id="svew_sutx2" size="70" maxlength="70" value='${model.record.svew_sutx2}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutx3">3. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutx3" id="svew_sutx3" size="70" maxlength="70" value='${model.record.svew_sutx3}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutx4">4. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutx4" id="svew_sutx4" size="70" maxlength="70" value='${model.record.svew_sutx4}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutx5">5. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutx5" id="svew_sutx5" size="70" maxlength="70" value='${model.record.svew_sutx5}'></td>
												</tr>
												<tr>
													<td colspan="4" class="text12" height="187">&nbsp;</td>
												</tr>
											</table>
										</td>
										
										<td width="50%" valign="top">
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
														&nbsp;
														Särskilda upplysningar
													</td>
												</tr>
											</table>			
									
											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12" title="svew_suk6">2. Kod:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_suk6" id="svew_suk6" size="7" maxlength="5" value='${model.record.svew_suk6}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sut6">1. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sut6" id="svew_sut6" size="70" maxlength="70" value='${model.record.svew_sut6}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sut7">2. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sut7" id="svew_sut7" size="70" maxlength="70" value='${model.record.svew_sut7}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sut8">3. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sut8" id="svew_sut8" size="70" maxlength="70" value='${model.record.svew_sut8}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sut9">4. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sut9" id="svew_sut9" size="70" maxlength="70" value='${model.record.svew_sut9}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_suta">5. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_suta" id="svew_suta" size="70" maxlength="70" value='${model.record.svew_suta}'></td>
												</tr>
												<tr>
													<td colspan="4" class="text12" height="25">&nbsp;</td>
												</tr>
												<tr>
													<td class="text12" title="svew_sukb">3. Kod:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sukb" id="svew_sukb" size="7" maxlength="5" value='${model.record.svew_sukb}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutb">1. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutb" id="svew_sutb" size="70" maxlength="70" value='${model.record.svew_sutb}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutc">2. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutc" id="svew_sutc" size="70" maxlength="70" value='${model.record.svew_sutc}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutd">3. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutd" id="svew_sutd" size="70" maxlength="70" value='${model.record.svew_sutd}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sute">4. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sute" id="svew_sute" size="70" maxlength="70" value='${model.record.svew_sute}'></td>
												</tr>
												<tr>
													<td class="text12" title="svew_sutf">5. Text:</td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_sutf" id="svew_sutf" size="70" maxlength="70" value='${model.record.svew_sutf}'></td>
												</tr>
											</table>
										</td>
									</tr>  <!-- End Särskilda uppl. / Särskilda uppl. -->
		
									<tr> <!-- Tidigare handlingar -->
										<td width="50%" valign="top">
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
														&nbsp;
														Tidigare handlingar
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr>
													<td class="text12" title="svew_tik1..9">&nbsp;&nbsp;&nbsp;Kategori:</td>
													<td class="text12" title="svew_tit1..9">Type:</td>
													<td class="text12" title="svew_tix1..9">Identitet:</td>
												</tr>
												<tr>
													<td class="text12">1.<input type="text" class="inputTextMediumBlue" name="svew_tik1" id="svew_tik1" size="1" maxlength="1" value='${model.record.svew_tik1}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit1" id="svew_tit1" size="3" maxlength="3" value='${model.record.svew_tit1}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix1" id="svew_tix1" size="35" maxlength="35" value='${model.record.svew_tix1}'></td>
												</tr>
												<tr>
													<td class="text12">2.<input type="text" class="inputTextMediumBlue" name="svew_tik2" id="svew_tik2" size="1" maxlength="1" value='${model.record.svew_tik2}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit2" id="svew_tit2" size="3" maxlength="3" value='${model.record.svew_tit2}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix2" id="svew_tix2" size="35" maxlength="35" value='${model.record.svew_tix2}'></td>
												</tr>
												<tr>
													<td class="text12">3.<input type="text" class="inputTextMediumBlue" name="svew_tik3" id="svew_tik3" size="1" maxlength="1" value='${model.record.svew_tik3}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit3" id="svew_tit3" size="3"  maxlength="3" value='${model.record.svew_tit3}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix3" id="svew_tix3" size="35" maxlength="35" value='${model.record.svew_tix3}'></td>
												</tr>
												<tr>
													<td class="text12">4.<input type="text" class="inputTextMediumBlue" name="svew_tik4" id="svew_tik4" size="1" maxlength="1" value='${model.record.svew_tik4}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit4" id="svew_tit4" size="3" maxlength="3" value='${model.record.svew_tit4}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix4" id="svew_tix4" size="35" maxlength="35" value='${model.record.svew_tix4}'></td>
												</tr>
												<tr>
													<td class="text12">5.<input type="text" class="inputTextMediumBlue" name="svew_tik5" id="svew_tik5" size="1" maxlength="1" value='${model.record.svew_tik5}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit5" id="svew_tit5" size="3" maxlength="3" value='${model.record.svew_tit5}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix5" id="svew_tix5" size="35" maxlength="35" value='${model.record.svew_tix5}'></td>
												</tr>
											</table>
										</td>
										
										<td width="50%" valign="top">
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
														&nbsp;
														Tidigare handlingar
													</td>
												</tr>
											</table>			
											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12" title="svew_tik1..9">&nbsp;&nbsp;&nbsp;Kategori:</td>
													<td class="text12" title="svew_tit1..9">Type:</td>
													<td class="text12" title="svew_tix1..9">Identitet:</td>
												</tr>
												<tr>
													<td class="text12">6.<input type="text" class="inputTextMediumBlue" name="svew_tik6" id="svew_tik6" size="1" maxlength="1" value='${model.record.svew_tik6}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit6" id="svew_tit6" size="3" maxlength="3" value='${model.record.svew_tit6}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix6" id="svew_tix6" size="35" maxlength="35" value='${model.record.svew_tix6}'></td>
												</tr>
												<tr>
													<td class="text12">7.<input type="text" class="inputTextMediumBlue" name="svew_tik7" id="svew_tik7" size="1" maxlength="1" value='${model.record.svew_tik7}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit7" id="svew_tit7" size="3" maxlength="3" value='${model.record.svew_tit7}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix7" id="svew_tix7" size="35" maxlength="35" value='${model.record.svew_tix7}'></td>
												</tr>
												<tr>
													<td class="text12">8.<input type="text" class="inputTextMediumBlue" name="svew_tik8" id="svew_tik8" size="1" maxlength="1" value='${model.record.svew_tik8}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit8" id="svew_tit8" size="3" maxlength="3" value='${model.record.svew_tit8}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix3" id="svew_tix8" size="35" maxlength="35" value='${model.record.svew_tix8}'></td>
												</tr>
												<tr>
													<td class="text12">9.<input type="text" class="inputTextMediumBlue" name="svew_tik9" id="svew_tik9" size="1" maxlength="1" value='${model.record.svew_tik9}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tit9" id="svew_tit9" size="3" maxlength="3" value='${model.record.svew_tit9}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_tix9" id="svew_tix9" size="35" maxlength="35" value='${model.record.svew_tix9}'></td>
												</tr>
												<tr>
													<td colspan="3" class="text12" height="25">&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>  <!-- End Tidigare handlingar -->




									<tr> <!-- Godsmärkning / container -->
										<td width="50%"  valign="top">
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
														&nbsp;
														Godsmärkning
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr>
													<td class="text12" title="svew_god1..5">&nbsp;&nbsp;&nbsp;Godsmärkning:</td>
													<td class="text12" title="svew_kot1..5">Kolli antal:</td>
													<td class="text12" title="svew_kos1..5">Kolli slag [kod]:</td>
												</tr>
												<tr>
													<td class="text12">1.<input type="text" class="inputTextMediumBlue" name="svew_godm" id="svew_godm" size="45" maxlength="42" value='${model.record.svew_godm}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kota" id="svew_kota" size="5" maxlength="5" value='${model.record.svew_kota}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kosl" id="svew_kosl" size="5" maxlength="4" value='${model.record.svew_kosl}'></td>
												</tr>
												<tr>
													<td class="text12">2.<input type="text" class="inputTextMediumBlue" name="svew_god2" id="svew_god2" size="45" maxlength="42" value='${model.record.svew_god2}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kot2" id="svew_kot2" size="5" maxlength="5" value='${model.record.svew_kot2}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kos2" id="svew_kos2" size="5" maxlength="4" value='${model.record.svew_kos2}'></td>
												</tr>
												<tr>
													<td class="text12">3.<input type="text" class="inputTextMediumBlue" name="svew_god3" id="svew_god3" size="45" maxlength="42" value='${model.record.svew_god3}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kot3" id="svew_kot3" size="5" maxlength="5" value='${model.record.svew_kot3}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kos3" id="svew_kos3" size="5" maxlength="4" value='${model.record.svew_kos3}'></td>
												</tr>
												<tr>
													<td class="text12">4.<input type="text" class="inputTextMediumBlue" name="svew_god4" id="svew_god4" size="45" maxlength="42" value='${model.record.svew_god4}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kot4" id="svew_kot4" size="5" maxlength="5" value='${model.record.svew_kot4}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kos4" id="svew_kos4" size="5" maxlength="5" value='${model.record.svew_kos4}'></td>
												</tr>
												<tr>
													<td class="text12">5.<input type="text" class="inputTextMediumBlue" name="svew_god5" id="svew_god5" size="45" maxlength="42" value='${model.record.svew_god5}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kot5" id="svew_kot5" size="5" maxlength="5" value='${model.record.svew_kot5}'></td>
													<td><input type="text" class="inputTextMediumBlue" name="svew_kos5" id="svew_kos5" size="5" maxlength="5" value='${model.record.svew_kos5}'></td>
												</tr>
												<tr>
													<td colspan="3" class="text12" height="25">&nbsp;</td>
												</tr>
												
											</table>
										</td>
										
										<td width="50%" valign="top">

											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
													&nbsp;
													Container
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr>
													<td class="text12" title="svew_co01..20">&nbsp;&nbsp;&nbsp;&nbsp;Container nr:</td>
												</tr>
	
												<tr>
													<td class="text12">&nbsp;&nbsp;1.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">&nbsp;&nbsp;2.<input type="text" class="inputTextMediumBlue" name="svew_co02" id="svew_co02" size="20" maxlength="17" value='${model.record.svew_co02}'></td>
													<td class="text12">&nbsp;&nbsp;3.<input type="text" class="inputTextMediumBlue" name="svew_co03" id="svew_co03" size="20" maxlength="17" value='${model.record.svew_co03}'></td>
												</tr>
												<tr>
													<td class="text12">&nbsp;&nbsp;4.<input type="text" class="inputTextMediumBlue" name="svew_co04" id="svew_co04" size="20" maxlength="17" value='${model.record.svew_co04}'></td>
													<td class="text12">&nbsp;&nbsp;5.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">&nbsp;&nbsp;6.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
												</tr>
												<tr>
													<td class="text12">&nbsp;&nbsp;7.<input type="text" class="inputTextMediumBlue" name="svew_co04" id="svew_co04" size="20" maxlength="17" value='${model.record.svew_co04}'></td>
													<td class="text12">&nbsp;&nbsp;8.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">&nbsp;&nbsp;9.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
												</tr>
												<tr>
													<td class="text12">11.<input type="text" class="inputTextMediumBlue" name="svew_co04" id="svew_co04" size="20" maxlength="17" value='${model.record.svew_co04}'></td>
													<td class="text12">12.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">13.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
												</tr>
												<tr>
													<td class="text12">14.<input type="text" class="inputTextMediumBlue" name="svew_co04" id="svew_co04" size="20" maxlength="17" value='${model.record.svew_co04}'></td>
													<td class="text12">15.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">16.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
												</tr>
												<tr>
													<td class="text12">17.<input type="text" class="inputTextMediumBlue" name="svew_co04" id="svew_co04" size="20" maxlength="17" value='${model.record.svew_co04}'></td>
													<td class="text12">18.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
													<td class="text12">19.<input type="text" class="inputTextMediumBlue" name="svew_co01" id="svew_co01" size="20" maxlength="17" value='${model.record.svew_co01}'></td>
												</tr>


											</table>
										
										</td>


										
									</tr>  <!-- End Godsmärkning / container -->


									<tr><td>&nbsp;</td></tr>
									<tr> 
										<td colspan="2" align="right">
											<input class="inputFormSubmit" type="submit" name="submit" id="submit" value='<spring:message code="systema.save"/>'/>
										</td>
									</tr>
								</table>
			 	    		</form>
 	   	 		 		</td>
 	   	 		 	</tr>
 
 	   	 		 </table>
 	   	 		
 	   	 		</td>
 
 	   	 		<td width="30">
 	   	 			&nbsp;
 	   	 		</td>
 	   	 		
 	   	 	</tr>
 
	 	    <tr height="20"><td>&nbsp;</td></tr>	
	 	    
	 		</table>
		</td>
	</tr>
</table>	

<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->
