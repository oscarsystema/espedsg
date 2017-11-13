<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerTror.jsp" />
<!-- =====================end header ==========================-->
<SCRIPT type="text/javascript" src="resources/js/tror_mainorderlandimport_archive.js?ver=${user.versionEspedsg}"></SCRIPT>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

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
						<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.orderlist.tab"/></font>
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandimport.do?action=doFetch&heavd=${recordOrderTrorLandImport.heavd}&heopd=${recordOrderTrorLandImport.heopd}" > 	
						<img style="vertical-align:middle;" src="resources/images/lorry_green.png" width="18px" height="18px" border="0" alt="update">
						<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.tab"/>&nbsp;${recordOrderTrorLandImport.heavd}/${recordOrderTrorLandImport.heopd}</font>
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandimport_invoice.do?action=doInit&heavd=${recordOrderTrorLandImport.heavd}&heopd=${recordOrderTrorLandImport.heopd}" >
						<img style="vertical-align: bottom" src="resources/images/invoice.png" width="16" hight="16" border="0" alt="show invoice">
						<font class="tabDisabledLink"><spring:message code="systema.tror.order.faktura.tab"/></font><font class="text12"></font>
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a class="text14" onClick="setBlockUI(this);" href="editNotisblock.do?action=doFetch&subsys=tror_li&avd=${recordOrderTrorLandImport.heavd}&opd=${recordOrderTrorLandImport.heopd}&sign=${recordOrderTrorLandImport.hesg}" > 	
						<img style="vertical-align: bottom" src="resources/images/veiledning.png" width="16" hight="16" border="0" alt="show messages">
						<font class="tabDisabledLink"><spring:message code="systema.tror.order.notisblock.tab"/></font><font class="text12">&nbsp;</font>
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandimport_logging.do?avd=${recordOrderTrorLandImport.heavd}&sign=${recordOrderTrorLandImport.hesg}&opd=${recordOrderTrorLandImport.heopd}">
						<img style="vertical-align: bottom" src="resources/images/log-icon.png" width="16" hight="16" border="0" alt="show log">
						<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.logging.tab"/></font>
						
					</a>
				</td>
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tab" align="center" nowrap>
					<img style="vertical-align: bottom" src="resources/images/archive.png" width="16" hight="16" border="0" alt="show archive">
					<font class="tabLink"><spring:message code="systema.tror.order.archive.tab"/></font><font class="text12">&nbsp;</font>
				</td>
				<c:if test="${recordOrderTrorLandImport.hepk1 == 'J' || recordOrderTrorLandImport.hepk1 == 'P'}">
					<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
					<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
						<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandimport_freightbill_edit.do?dfavd=${recordOrderTrorLandImport.heavd}&sign=${recordOrderTrorLandImport.hesg}&dfopd=${recordOrderTrorLandImport.heopd}">
							<img style="vertical-align: bottom" src="resources/images/fraktbrev.png" width="16" hight="16" border="0" alt="show freight doc">
							<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.fraktbrev.tab"/></font>
						</a>
					</td>
				</c:if>	
				<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
				<td width="12%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a class="text14" onClick="setBlockUI(this);" href="tror_mainorderlandimport_more.do?avd=${recordOrderTrorLandImport.heavd}&sign=${recordOrderTrorLandImport.hesg}&opd=${recordOrderTrorLandImport.heopd}">
						<img style="vertical-align: bottom" src="resources/images/sort_down.png" width="10" hight="10" border="0" alt="show more">
						<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tror.order.more.tab"/></font>
					</a>
				</td>
				<td width="50%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			</tr>
			<tr height="3"><td></td></tr>
		</table>
		</td>
	</tr>
	

	<%-- list component --%>
	<tr>
		<td>		
		<table width="100%" cellspacing="0" border="0" cellpadding="0">
	    	
	        <tr height="2"><td></td></tr> 
			<tr>
				<td>
				<table width="100%" cellspacing="0" border="0" cellpadding="0">
					<thead>
					<tr class="tableHeaderField" height="20">
					
	                    <th align="left" class="tableHeaderFieldFirst">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.topicNr"/>&nbsp;</th>
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.docType"/>&nbsp;</th> 
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.subject"/>&nbsp;</th> 
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.date"/>&nbsp;</th>
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.time"/>&nbsp;</th>
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.additionalInfo"/>&nbsp;</th>
	                    <th align="left" class="tableHeaderField">&nbsp;<spring:message code="systema.tror.orders.archive.list.label.document"/>&nbsp;</th> 
	                    
	               </tr> 
	               </thead>
	               <tbody>
	               <c:if test="${not empty list}">    
		           	<c:forEach items="${list}" var="record" varStatus="counter">    
		               <c:choose>           
		                   <c:when test="${counter.count%2==0}">
		                       <tr class="tableRow" height="25" >
		                   </c:when>
		                   <c:otherwise>   
		                       <tr class="tableOddRow" height="25" >
		                   </c:otherwise>
		               </c:choose>
		               <td class="tableCellFirst" >&nbsp;${model.opd}&nbsp;&nbsp;<font class="text8">[${model.sign}]</font></td>
		               <td class="tableCell">&nbsp;${record.docType}</td>
		               <td class="tableCell" >&nbsp;${record.subject}</td>
		               <td class="tableCell" >&nbsp;${record.createDate}</td>
		               <td class="tableCell" >&nbsp;${record.createTime}</td>
		               <td class="tableCell" >&nbsp;${record.additionalInfo}</td>
		               <%-- <td class="tableCell" >&nbsp;${record.url}</td> --%> 
		               <td class="tableCell" >&nbsp;
		               		<a href="tvinnsadimport_renderArchive.do?fp=${record.url}" target="_new" >
			               		<img src="resources/images/pdf.png" border="0" width="16px" height="16px" alt="Visa arkivdokument" >
			               		${record.documentName}
		               		</a>
		               </td>
		            </tr> 
		            </c:forEach>
		            </c:if>
		            </tbody>
	            </table>
			</td>	
			</tr>
		</table>
		</td>
	</tr>

</table>	
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->

