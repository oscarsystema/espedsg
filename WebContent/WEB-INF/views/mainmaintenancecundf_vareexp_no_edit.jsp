<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerMainMaintenance.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/mainmaintenancecundf_vareimp_no_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	
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
							<td width="100" valign="bottom" class="tabSub" align="center" nowrap>
									<font class="tabLinkMinor">&nbsp;
										<spring:message code="systema.main.maintenance.customer.vareregister.exp.no"/>
									</font>&nbsp;						
							</td>
							<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
								<a id="alinkMainMaintVareImpNoGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_no.do">
									<font class="tabDisabledLinkMinor">&nbsp;
									   <spring:message code="systema.main.maintenance.customer.vareregister.imp.no"/>
									</font>
								</a>
							</td>
							<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
							<!--  	<a id="alinkMainMaintFritextGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_dk_edit.do"> -->
									<font class="tabDisabledLinkMinor">&nbsp;
										 <spring:message code="systema.main.maintenance.customer.vareregister.imp.dk"/>
									</font>&nbsp;						
							<!--  	</a> -->
							</td>
							<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
							<!-- 	<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareexp_dk_edit.do">  -->
									<font class="tabDisabledLinkMinor">&nbsp;
										 <spring:message code="systema.main.maintenance.customer.vareregister.exp.dk"/>
									</font>&nbsp;						
							<!--  	</a> -->
							</td>							
							<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
							<!-- 	<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareimp_se_edit.do">  -->
									<font class="tabDisabledLinkMinor">&nbsp;
										 <spring:message code="systema.main.maintenance.customer.vareregister.imp.se"/>
									</font>&nbsp;						
							<!--  	</a> -->
							</td>
							<td width="100" valign="bottom" class="tabDisabledSub" align="center" nowrap>
							<!--  	<a id="alinkMainMaintParamsGate" onClick="setBlockUI(this);" href="mainmaintenancecundf_vareexp_se_edit.do"> -->
									<font class="tabDisabledLinkMinor">&nbsp;
										 <spring:message code="systema.main.maintenance.customer.vareregister.exp.se"/>
									</font>&nbsp;						
							<!-- 	</a>  -->
							</td>		
							
						 	<td width="490" class="tabFantomSpace" align="center" nowrap></td>

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
								<th align="center" width="2%" class="tableHeaderField" >&nbsp;Endre&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;Varenr.&nbsp;</th>
			                    <th class="tableHeaderField" >&nbsp;Beskrivelse&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;VF&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;LK&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;Tariffnr.&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;Tn&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;Pref.&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;PVA&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;Tollsats&nbsp;</th>
								<th class="tableHeaderField" >&nbsp;MF&nbsp;</th>
			                    <th align="center" class="tableHeaderField">Slett</th>
			                </tr>  
				             </thead> 
				             <tbody >  
					            <c:forEach var="record" items="${model.list}" varStatus="counter">   
					               <tr class="tableRow" height="20" >
						               <td id="recordUpdate_${record.varenr}_${record.levenr}" onClick="getRecord(this);" align="center" width="2%" class="tableCellFirst" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
				               				<img src="resources/images/update.gif" border="0" alt="edit">
						               </td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 1px;border-color:#FAEBD7;"><font class="text12">&nbsp;${record.varenr}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.varebe}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2vf}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2lk}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2vnti}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2tn}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2pre}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2pva}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2as}&nbsp;</font></td>
						               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.w2mfr}&nbsp;</font></td>
						               
						               <td align="center" width="2%" class="tableCell" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
				               				<a onclick="javascript:return confirm('Er du sikker på at du vil slette denne?')" tabindex=-1 href="tvinnsadmaintenanceimport_sad001ar_edit.do?action=doDelete&id=${model.dbTable}&varenr=${record.varenr}&levenr=${record.levenr}">
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

<!-- 
 	   	 		 	<tr id="details">
 	   	 		 		<td>
							<form action="mainmaintenancecundf_vareimp_no_edit.do" name="formRecord" id="formRecord" method="POST" >
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
									<tr>
										<td>
											<table class="formFrameHeaderPeachWithBorder" width="100%" 	cellspacing="0" border="0" align="left">
												<tr>
													<td class="text12Bold">&nbsp;
														<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.param"/>
													</td>
												</tr>
											</table>			

											<table class="formFramePeachGrayRoundBottom"  width="100%" cellspacing="0" border="0" align="center">
												<tr> 
													<td width="50%" >
														<table>
															<tr>
																<td class="text12" title="sypaid">&nbsp;<font class="text14RedBold" >*</font>
																	<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.sypaid"/>:&nbsp;&nbsp;&nbsp;
																</td>
																<td><input type="text" required oninvalid="this.setCustomValidity('Obligatoriskt')" onchange="setCustomValidity('')" class="inputTextMediumBlueMandatoryField" name="sypaid" id="sypaid" size="10" maxlength="5" value='${model.record.sypaid}'></td>
																<td class="text12" title="sypaid">
																	<a tabindex="-1" id="sypaidIdLink">
																		<img style="cursor:pointer;vertical-align: middle;" src="resources/images/find.png" width="14px" height="14px" border="0" alt="Søk" >
																	</a>
																</td>
																
																<td class="text12" title="sypaidDesc">&nbsp;
																	<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.sypaidDesc"/>:&nbsp;&nbsp;</td>
																<td><input type="text" readonly class="inputTextReadOnly" name="sypaidDesc" id="sypaidDesc" size="50" maxlength="50" value='${model.record.sypaidDesc}'></td>
																
															</tr>

															<tr>
																<td class="text12" title="sysort">&nbsp;
																	<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.sysort"/>:
																</td>
																<td><input type="text" onKeyPress="return numberKey(event)" class="inputTextMediumBlue"  name="sysort" id="sysort" size="10" maxlength="3" value='${model.record.sysort}'>
																</td>
															</tr>

														</table>
													</td>
													<td width="50%" valign="top">
														<table>
															<tr>
																<td colspan="2" class="text12" title="syvrdn">&nbsp;<font class="text14RedBold" >*</font>
																	<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.syvrdn"/>:
																</td>
																<td><input type="text" onKeyPress="return numberKey(event)" required oninvalid="setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" onchange="setCustomValidity('')" class="inputTextMediumBlueMandatoryField"  name="syvrdn" id="syvrdn" size="20" maxlength="15" value='${model.record.syvrdn}'>
																</td>
															<tr>
																<td colspan="2" class="text12" title="syvrda">&nbsp;<font class="text14RedBold" >*</font>
																	<spring:message code="systema.main.maintenance.mainmaintenancecundf.syparf.syvrda"/>:
																</td>
																<td><input type="text" required oninvalid="setCustomValidity('Obligatoriskt')" oninput="setCustomValidity('')" onchange="setCustomValidity('')" class="inputTextMediumBlueMandatoryField"  name="syvrda" id="syvrda" size="60" maxlength="50" value='${model.record.syvrda}'>
																</td>
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
											<input class="inputFormSubmit" type="submit" name="submit" id="submit" value='<spring:message code="systema.save"/>'/>
										</td>
									</tr>
								</table>
			 	    		</form>
 	   	 		 		</td>
 	   	 		 	</tr>
 	
  -->	   	 		 
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
