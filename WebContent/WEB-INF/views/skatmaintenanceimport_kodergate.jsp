<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerSkatMaintenance.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/skatmaintenanceimport_kodergate.js?ver=${user.versionEspedsg}"></SCRIPT>	
	
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
					<td width="20%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a id="alinkSadMaintImportGate" tabindex=-1 style="display:block;" href="skatmaintenanceimport.do">
							<font class="tabDisabledLink">&nbsp;SKAT - Vedligehold</font>
							<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="general list">
						</a>
					</td>
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="20%" valign="bottom" class="tab" align="center" nowrap>
						<font class="tabLink">&nbsp;Vedligehold - KODER</font>&nbsp;
						<img style="vertical-align: middle;"  src="resources/images/list.gif" border="0" alt="general list">
					</td>
					<td width="60%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
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
				<td width="2%">&nbsp;</td>
					
				<td width="100%">
				<table id="containerdatatableTable" width="90%" cellspacing="1" border="0" align="center">
			    	    <tr>
						<td class="text11">
						<table id="mainList" class="display compact cell-border" >
							<thead>
							<tr>
								<th width="2%" class="tableHeaderField" align="center" >&nbsp;Opdater</th>
			                    <th width="2%" class="tableHeaderField" align="left" >&nbsp;Kodetype&nbsp;</th>
								<th width="80%" class="tableHeaderField" align="left" >&nbsp;Beskrivelse&nbsp;</th>
								<%--
			                    <th class="tableHeaderField" align="left" >&nbsp;Text&nbsp;</th>
			                    <th class="tableHeaderField" align="center" >&nbsp;Status&nbsp;</th>
			                     --%>
			                </tr>  
			                </thead> 
			                <tbody >  
				            <c:forEach var="record" items="${model.list}" varStatus="counter">   
				               <tr class="tableRow" height="20" >
				              
				               <td width="2%" class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" align="center">
				               	<c:choose>
				               		<c:when test="${record.status == 'G'}">
					               		<a id="alinkRecordId_${counter.count}" onClick="setBlockUI(this);" href="skatmaintenanceimport_${record.pgm}.do?id=${record.dbTable}&legend=${record.subject}&dkkd_typ=${record.code}">
		               						<img src="resources/images/update.gif" border="0" alt="edit">
					               		</a>
				               		</c:when>
				               		<c:otherwise>
											<img src="resources/images/lock.gif" border="0" alt="edit">				               		
				               		</c:otherwise>
				               	</c:choose>	
				               </td>
				               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.code}&nbsp;</font></td>
				               <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" width="80%" >
				               		<c:choose>
					               		<c:when test="${record.status == 'G'}">
					               			<a id="alinkRecordDesc_${counter.count}" onClick="setBlockUI(this);" href="skatmaintenanceimport_${record.pgm}.do?id=${record.dbTable}&legend=${record.subject}&dkkd_typ=${record.code}">
		               							<font class="text12SkyBlue">&nbsp;&nbsp;${record.subject}&nbsp;</font>
		               						</a>
					               		</c:when>
					               		<c:otherwise>
					               			<font class="text12">&nbsp;&nbsp;${record.subject}&nbsp;</font>
					               		</c:otherwise>
				               		</c:choose>
				               </td>
				               <%--
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;" ><font class="text12">&nbsp;${record.text}&nbsp;</font></td>
		                       <td class="tableCell" style="border-style: solid;border-width: 0px 1px 1px 0px;border-color:#FAEBD7;"align="center">
		                       		<c:if test="${empty record.status}">
	                       				<img src="resources/images/bulletRed.png" width="12px" height="12px" border="0">
		                       		</c:if>
		                       		<c:if test="${record.status == 'G'}">
		                       			<img src="resources/images/bulletGreen.png" width="12px" height="12px" border="0">
		                       		</c:if>
		                       		<c:if test="${record.status == 'Y'}">
		                       			<img src="resources/images/bulletYellowModern.png" width="11px" height="11px" border="0">
		                       		</c:if>
				              </td>
				               --%>
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

