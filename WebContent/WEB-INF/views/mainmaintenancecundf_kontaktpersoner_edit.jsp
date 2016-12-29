<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerMainMaintenance.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/mainmaintenancecundf_kontaktpersoner_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	
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
						<font class="tabDisabledLink">&nbsp;Vedlikehold</font>
						<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="general list">
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="15%" valign="bottom" class="tabDisabled" align="center">
						<a id="alinkMainCundfGate" tabindex=-1 style="display:block;" href="mainmaintenancecundf_vkund.do">
	
						<font class="tabDisabledLink">&nbsp;Kunderegister</font>&nbsp;
						<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="avd. general list">
						</a>
					</td>
					<c:choose>
						
						<c:when test="${not empty kundeSessionParams.kundnr}">
							<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
							<td width="15%" valign="bottom" class="tab" align="center">
								<font class="tabLink">&nbsp;Kunde</font>&nbsp;
								<font class="text11MediumBlue">[${tab_knavn_display}]</font>
							</td>
							<td width="55%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
						</c:when>
						<c:otherwise>
							<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
							<td width="15%" valign="bottom" class="tab" align="center">
									<font class="tabLink">&nbsp;Lage ny kunde</font>&nbsp;						
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
							<td width="80" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintKontaktGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_kunde_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Kunde</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabSub" align="center" nowrap>
									<font class="tabLinkMinor">&nbsp;Kontakter</font>&nbsp;						
							</td>

							<td width="80" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintVareImpGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Varer(import)</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintVareExpGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareexp_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Varer(export)</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabledSub" align="center">
								<a id="alinkMainMaintFritextGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_fritext_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Fritekst</font>&nbsp;						
								</a>
							</td>

							<td width="80" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_params_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Parametere</font>&nbsp;						
								</a>
							</td>
							
							<td width="80" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintMavgGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_xxx_edit.do">
									<font class="tabDisabledLinkMinor">&nbsp;Miljøavgift</font>&nbsp;						
								</a>
							</td>							
							
<!-- 
							<td width="50" class="tabDisabledTrailingEnd"></td>
 -->
						 	<td width="540" class="tabFantomSpace" align="center" nowrap></td>
						</tr>
					</table>
				</td>
 	   	 	
 	   	 	
 	   	 	</tr> <!-- End second tab row -->
 	   	 	
 	   	 	<tr height="30">
 	   	 		<td>&nbsp;</td>
 	   	 		<td width="100%">
 	   	 		 <table id="mainArea" class="tabThinBorderWhite" width="100%" cellspacing="0" border="0" align="left">
 	   	 		 	<tr id="list">
 	   	 		 		<td>&nbsp;
							<table id="mainList" class="display compact cell-border" >
							<thead>
								<tr>
									<th align="center" class="tableHeaderField" >&nbsp;Endre&nbsp;</th>
									<th class="tableHeaderField" >&nbsp;Kontaktperson&nbsp;</th>
									<th class="tableHeaderField" >&nbsp;Funksjon&nbsp;</th>
				                    <th class="tableHeaderField" >&nbsp;Telefon&nbsp;</th>
									<th class="tableHeaderField" >&nbsp;Mobil&nbsp;</th>
									<th class="tableHeaderField" >&nbsp;E-mail&nbsp;</th>
									<th class="tableHeaderField" >&nbsp;Slett&nbsp;</th>
				                </tr>  
				             </thead> 
				             <tbody >  
					            <c:forEach var="record" items="${model.list}" varStatus="counter">   
					               <tr class="tableRow" height="20" >
					               <td id="recordUpdate_${record.cfirma}_${record.ccompn}_${record.cconta}_${record.ctype}" onClick="getRecord(this);" align="center" width="5%" class="tableCellFirst" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
			               				<img src="resources/images/update.gif" border="0" alt="edit">
					               </td>
					               <td width="15%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 1px;border-color:#FAEBD7;"><font class="text12">&nbsp;${record.cconta}&nbsp;</font></td>
					               <td width="15%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 1px;border-color:#FAEBD7;"><font class="text12">&nbsp;${record.ctype}&nbsp;</font></td>
					               <td width="10%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.cphone}&nbsp;</font></td>
					               <td width="10%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.cmobil}&nbsp;</font></td>
					               <td width="40%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.cemail}&nbsp;</font></td>
			                       <td align="center" width="5%" class="tableCell" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
			               				<a onclick="javascript:return confirm('Er du sikker på at du vil slette denne?')" tabindex=-1 href="mainmaintenancecundf_kontaktpersoner_edit.do?action=doDelete&cfirma=${record.cfirma}&ccompn=${record.ccompn}&cconta=${record.cconta}&ctype=${record.ctype}">
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
							<form action="mainmaintenancecundf_kontaktpersoner_edit.do" name="formRecord" id="formRecord" method="POST" >
								<input type="hidden" name="applicationUser" id="applicationUser" value="${user.user}">
								<input type="hidden" name="updateId" id="updateId" value="${model.updateId}"> 
								<input type="hidden" name="ccontaorg" id="ccontaorg" value="${model.record.ccontaorg}"> 
								<input type="hidden" name="action" id="action" value="doUpdate">
								<table id="kontakpersonerDetails" width="100%" cellspacing="0" border="0" align="left">
									<%-- Validation errors --%>
									<spring:hasBindErrors name="record"> <%-- name must equal the command object name in the Controller --%>
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
									
									<%-- Other errors (none validation errors) --%>
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
											<button name="newRecordButton" id="newRecordButton" class="inputFormSubmitStd" type="button" >Lage ny</button>&nbsp;&nbsp;
											<button disabled="disabled" name="copyRecordButton" id="copyRecordButton" class="inputFormSubmitStd" type="button" >Kopiere</button>
										</td>
									</tr>
									<tr height="2">
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
													&nbsp;Kontaktinfo 
													</td>
												</tr>
											</table>			
											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="50%" >
														<table>
															<tr>
																<td class="text12" title="cconta">&nbsp;<font class="text14RedBold" >*</font>Kontaktperson:&nbsp;&nbsp;&nbsp;</td>
																<td><input type="text" required oninvalid="this.setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" class="inputTextMediumBlueMandatoryField" name="cconta" id="cconta" size="35" maxlength="30" value='${model.record.cconta}'></td>
																<td class="text12" title="cphone">&nbsp;Telefon:&nbsp;&nbsp;</td>
																<td><input type="text" class="inputTextMediumBlue" name="cphone" id="cphone" size="15" maxlength="15" value='${model.record.cphone}'></td>
															</tr>
															<tr>
																<td class="text12" title="ctype">&nbsp;<font class="text14RedBold" >*</font>Funksjon:
												 				&nbsp;<img onMouseOver="showPop('8_info');" onMouseOut="hidePop('8_info');"style="vertical-align:bottom;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
												 				
												 				<div class="text11" style="position: relative;" align="left">
												 				<span style="position:absolute; top:2px; width:250px;" id="8_info" class="popupWithInputText text11"  >
														           		<b>Funksjon</b>
														           		<p>
														           		Oppgi funksjon eller velj fastekode som gyldige funksjon.
														           		</p>
														           		<p> 
																		Hvis verdien begynner med * så regnes verdi som faste kode.
																		Hvis verdien begynner med * så kan verdi i Faste koder brukes nedenfor, i <b>Avvikende vedleggsliste på kundenivå</b>
														           		</p>
																</span>
																</div>
																</td>
																<td><input type="text" required oninvalid="setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" onchange="setCustomValidity('')" class="inputTextMediumBlueMandatoryField"  name="ctype" id="ctype" size="35" maxlength="30" value='${model.record.ctype}'>
																</td>
																<td class="text12" title="cmobil">
																	<a tabindex="-1" id="ctypeIdLink">
																		<img style="cursor:pointer;vertical-align: middle;" src="resources/images/find.png" width="14px" height="14px" border="0" alt="Søk" >
																	</a>
																	&nbsp;Mobil:
																</td>
																<td><input type="text" class="inputTextMediumBlue" name="cmobil" id="cmobil" size="15" maxlength="15" value='${model.record.cmobil}'></td>
															</tr>
															<tr>
																<td class="text12" title="cmerge">&nbsp;Slå sammen PDF:</td>
																<td>
																	<select name="cmerge" id="cmerge" >
								 					  					<option value="">-velg-</option>
								 					  					<option value="J"<c:if test="${model.record.cmerge == 'J'}"> selected </c:if> >Ja</option>
													  					<option value="N"<c:if test="${ model.record.cmerge == 'N'}"> selected </c:if> >Nej</option>
													  				</select>
																	
																 	<font class="text12" title="cprint">&nbsp;Print:</font> 
																	<select name="cprint" id="cprint" >
								 					  					<option value="">-velg-</option>
								 					  					<option value="J"<c:if test="${model.record.cprint == 'J'}"> selected </c:if> >Ja</option>
													  					<option value="N"<c:if test="${ model.record.cprint == 'N'}"> selected </c:if> >Nej</option>
													  				</select>
																</td>
																<td>
																 	<font class="text12" title="clive">&nbsp;Vedlegg:</font> 
																</td>
																<td>
																	<select name="clive" id="clive" >
								 					  					<option value="">-velg-</option>
								 					  					<option value="V"<c:if test="${model.record.clive == 'V'}"> selected </c:if> >Ja</option>
													  				</select>
																</td>
															</tr>
														</table>
													</td>
													<td width="50%" valign="top">
														<table>
															<tr>
																<td colspan="2" class="text12" title="cemail">&nbsp;E-mail:</td>
																<td><input type="text" class="inputTextMediumBlue" name="cemail" id="cemail" size="70" maxlength="70" value='${model.record.cemail}'></td>
															<tr>
																<td colspan="2" class="text12" title="cemne">&nbsp;E-mail, emne:</td>
																<td><input type="text" class="inputTextMediumBlue" name="cemne" id="cemne" size="70" maxlength="80" value='${model.record.cemne}'></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td>&nbsp;
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
													&nbsp;Avvikende vedleggsliste på kundenivå
													</td>
													<td align="right">&nbsp;Ref.
														<a tabindex="-1" id="ctypeRefLink">
															<img style="cursor:pointer;vertical-align:middle;" src="resources/images/find.png" width="14px" height="14px" border="0" alt="Søk" >
														</a>
														&nbsp;&nbsp;
													</td>	
												</tr>
											</table>			
											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="50%" >
														<table>
															<tr>
																<td class="text12" title="arkvedk.avkved">&nbsp;Faste koder:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved1" id="avkved1" size="2" maxlength="2" value='${model.record.avkved1}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved2" id="avkved2" size="2" maxlength="2" value='${model.record.avkved2}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved3" id="avkved3" size="2" maxlength="2" value='${model.record.avkved3}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved4" id="avkved4" size="2" maxlength="2" value='${model.record.avkved4}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved5" id="avkved5" size="2" maxlength="2" value='${model.record.avkved5}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved6" id="avkved6" size="2" maxlength="2" value='${model.record.avkved6}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved7" id="avkved7" size="2" maxlength="2" value='${model.record.avkved7}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved8" id="avkved8" size="2" maxlength="2" value='${model.record.avkved8}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved9" id="avkved9" size="2" maxlength="2" value='${model.record.avkved9}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved10" id="avkved10" size="2" maxlength="2" value='${model.record.avkved10}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved11" id="avkved11" size="2" maxlength="2" value='${model.record.avkved11}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved12" id="avkved12" size="2" maxlength="2" value='${model.record.avkved12}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved13" id="avkved13" size="2" maxlength="2" value='${model.record.avkved13}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved14" id="avkved14" size="2" maxlength="2" value='${model.record.avkved14}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved15" id="avkved15" size="2" maxlength="2" value='${model.record.avkved15}'></td>
															</tr>
															<tr>
																<td class="text12" title="avkved.avkved">&nbsp;Faste koder:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved16" id="avkved16" size="2" maxlength="2" value='${model.record.avkved16}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved17" id="avkved17" size="2" maxlength="2" value='${model.record.avkved17}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved18" id="avkved18" size="2" maxlength="2" value='${model.record.avkved18}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved19" id="avkved19" size="2" maxlength="2" value='${model.record.avkved19}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved20" id="avkved20" size="2" maxlength="2" value='${model.record.avkved20}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved21" id="avkved21" size="2" maxlength="2" value='${model.record.avkved21}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved22" id="avkved22" size="2" maxlength="2" value='${model.record.avkved22}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved23" id="avkved23" size="2" maxlength="2" value='${model.record.avkved23}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved24" id="avkved24" size="2" maxlength="2" value='${model.record.avkved24}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved25" id="avkved25" size="2" maxlength="2" value='${model.record.avkved25}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved26" id="avkved26" size="2" maxlength="2" value='${model.record.avkved26}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved27" id="avkved27" size="2" maxlength="2" value='${model.record.avkved27}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved28" id="avkved28" size="2" maxlength="2" value='${model.record.avkved28}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved29" id="avkved29" size="2" maxlength="2" value='${model.record.avkved29}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="avkved30" id="avkved30" size="2" maxlength="2" value='${model.record.avkved30}'></td>

															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td>&nbsp;
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">
													&nbsp;Inc/Omit
													</td>
												</tr>
											</table>			
											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="20%" >
														<table>
															<tr>
																<td class="text12" title="cavdio">&nbsp;Inc/Omit:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																<td>
																	<select name="cavdio" id="cavdio" >
								 					  					<option value="">-velg-</option>
								 					  					<option value="I"<c:if test="${model.record.cmerge == 'I'}"> selected </c:if> >Inc</option>
													  					<option value="O"<c:if test="${ model.record.cmerge == 'O'}"> selected </c:if> >Omit</option>
													  				</select>
																</td>
																<td class="text12" title="cavd">&nbsp;Avdeling:</td>
															</tr>
															<tr>
																<td colspan="3" class="text12" title="cavd" height="25">&nbsp;</td>
															</tr>
															<tr>
																<td class="text12" title="copdio">&nbsp;Inc/Omit:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
																<td>
																	<select name="copdio" id="copdio" >
								 					  					<option value="">-velg-</option>
								 					  					<option value="I"<c:if test="${model.record.cmerge == 'I'}"> selected </c:if> >Inc</option>
													  					<option value="O"<c:if test="${ model.record.cmerge == 'O'}"> selected </c:if> >Omit</option>
													  				</select>
																</td>
																<td class="text12" title="copd">&nbsp;Ordertype:</td>
															</tr>
														</table>
													</td>
													<td width="80%" valign="top">
														<table>
															<tr>
																<td><input type="text" class="inputTextMediumBlue" name="cavd1" id="cavd1" size="4" maxlength="4" value='${model.record.cavd1}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd2" id="cavd2" size="4" maxlength="4" value='${model.record.cavd2}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd3" id="cavd3" size="4" maxlength="4" value='${model.record.cavd3}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd4" id="cavd4" size="4" maxlength="4" value='${model.record.cavd4}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd5" id="cavd5" size="4" maxlength="4" value='${model.record.cavd5}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd6" id="cavd6" size="4" maxlength="4" value='${model.record.cavd6}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd7" id="cavd7" size="4" maxlength="4" value='${model.record.cavd7}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd8" id="cavd8" size="4" maxlength="4" value='${model.record.cavd8}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd9" id="cavd9" size="4" maxlength="4" value='${model.record.cavd9}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd10" id="cavd10" size="4" maxlength="4" value='${model.record.cavd10}'></td>
															</tr>
															<tr>
																<td><input type="text" class="inputTextMediumBlue" name="cavd11" id="cavd11" size="4" maxlength="4" value='${model.record.cavd11}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd12" id="cavd12" size="4" maxlength="4" value='${model.record.cavd12}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd13" id="cavd13" size="4" maxlength="4" value='${model.record.cavd13}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd14" id="cavd14" size="4" maxlength="4" value='${model.record.cavd14}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd15" id="cavd15" size="4" maxlength="4" value='${model.record.cavd15}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd16" id="cavd16" size="4" maxlength="4" value='${model.record.cavd16}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd17" id="cavd17" size="4" maxlength="4" value='${model.record.cavd17}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd18" id="cavd18" size="4" maxlength="4" value='${model.record.cavd18}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd19" id="cavd19" size="4" maxlength="4" value='${model.record.cavd19}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="cavd20" id="cavd20" size="4" maxlength="4" value='${model.record.cavd20}'></td>
															</tr>
															<tr>
																<td><input type="text" class="inputTextMediumBlue" name="copd1" id="copd1" size="2" maxlength="2" value='${model.record.copd1}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="copd2" id="copd2" size="2" maxlength="2" value='${model.record.copd2}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="copd3" id="copd3" size="2" maxlength="2" value='${model.record.copd3}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="copd4" id="copd4" size="2" maxlength="2" value='${model.record.copd4}'></td>
																<td><input type="text" class="inputTextMediumBlue" name="copd5" id="copd5" size="2" maxlength="2" value='${model.record.copd5}'></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr><td>&nbsp;</td></tr>
									<tr> 
										<td align="right">
											<input class="inputFormSubmit" type="submit" name="submit" id="submit" value='Lagre'/>
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
