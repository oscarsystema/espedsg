<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerMainMaintenance.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/mainmaintenancecundf_vkund.js?ver=${user.versionEspedsg}"></SCRIPT>	
	
	<style type = "text/css">
	.ui-datepicker { font-size:9pt;}
	</style>


<table width="100%" class="text11" cellspacing="0" border="0" cellpadding="0">
	<tr height="15"><td>&nbsp;</td></tr>
	<tr>
		<td>
		<%-- tab container component --%>
		<table width="100%" class="text11" cellspacing="0" border="0" cellpadding="0">
			<tr height="2"><td></td></tr>
			<tr height="25"> 
				<td width="15%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a id="alinkMainMaintGate" tabindex=-1 style="display:block;" href="mainmaintenancegate.do">
					<font class="tabDisabledLink">&nbsp;Vedlikehold</font>
					<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="general list">
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="15%" valign="bottom" class="tab" align="center">
					<font class="tabLink">&nbsp;Kunderegister</font>&nbsp;
					<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="avd. general list">
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="15%" valign="bottom" class="tabDisabled" align="center">
					<a id="alinkMainMaintVkundNew" onClick="setBlockUI(this);" href="mainmaintenancecundf_vkund_edit.do?action=doCreate">
						<font class="tabDisabledLink">&nbsp;Lage ny kunde</font>&nbsp;						
						<img style="vertical-align: middle;"  src="resources/images/add.png" width="12" height="12" border="0" alt="new">
					</a>
				</td>
				<td width="55%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<%-- space separator --%>
	 		<table width="100%" class="tabThinBorderWhite" border="0" cellspacing="0" cellpadding="0">
	 	    <tr height="20"><td>&nbsp;</td></tr>
	 	    
			<%-- list component --%>
			<tr>
				<td width="3%">&nbsp;</td>
				<td width="100%">
				<table id="containerdatatableTable" width="99%" cellspacing="1" border="0" align="left">
			    	    <tr>
						<td class="text11">
						<table id="mainList" class="display compact cell-border" > 
							<thead>
								<tr>
								    <th width="2%" class="tableHeaderFieldFirst" align="center" >Endre</th>                                                            
									<th width="2%" class="tableHeaderField" align="center" >Kundenr</th>
									<th width="15%" class="tableHeaderField" align="center" >Navn</th>
				                    <th class="tableHeaderField" align="left" >&nbsp;TIN / CVR/SE-nr</th>
				                    <th class="tableHeaderField" align="left" >&nbsp;Adresse</th>
				                    <th class="tableHeaderField" align="center" >Postadresse</th>
				                    <th class="tableHeaderField" align="center" >Postnr</th>
				                    <th class="tableHeaderField" align="center" >Land</th>
				                    <th class="tableHeaderField" align="center" >Tollkredit</th>
				                    <th class="tableHeaderField" align="center" >Firma</th>
				                    <th class="tableHeaderField" align="center" >Slett</th>
				                </tr>  
			                </thead> 
			                <tbody >  
				            <c:forEach var="record" items="${model.list}" varStatus="counter">   
				               <tr class="tableRow" height="20" >
				               <td width="2%" class="tableCellFirst" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" align="center">
									<input type="hidden" name="action" id="action" value="doUpdate">
					               	<a id="alinkRecordId_${counter.count}" onClick="setBlockUI(this);" href="mainmaintenancecundf_vkund_edit.do?action=doUpdate&kundnr=${record.kundnr}&firma=${record.firma}&knavn=${record.knavn}&sonavn=${record.sonavn}">
	               						<img src="resources/images/update.gif" border="0" alt="edit">
				               		</a>
				               </td>
				               <td width="2%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" align="center">${record.kundnr}</td>
				               <td width="2%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" align="center">${record.knavn}</td>
				               <td width="20%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 1px;border-color:#FAEBD7;">&nbsp;${record.syrg}&nbsp;</td>
				               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.adr1}&nbsp;</td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.adr3}&nbsp;</td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.postnr}&nbsp;</td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.syland}&nbsp;</td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.syfr02}&nbsp;${record.sykont}&nbsp;</td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" >&nbsp;${record.firma}&nbsp;</td>
		                       <td align="center" width="2%" class="tableCell" style="cursor:pointer; border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;">
		               				<a onclick="javascript:return confirm('Er du sikker på at du vil slette denne og all tilhørende informasjon?')" tabindex=-1 href="mainmaintenancecundf_vkund_edit.do?action=doDelete&kundnr=${record.kundnr}&firma=${record.firma}">
					               		<img valign="bottom" src="resources/images/delete.gif" border="0" width="15px" height="15px" alt="remove">
					               	</a>
				               </td>
				            </tr> 
				            </c:forEach>
				            </tbody>
			            </table>
					</td>	
					</tr>
				</table>
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
