<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerTds.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/tdsglobal_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	<SCRIPT type="text/javascript" src="resources/js/tdsadmin_norskimport.js?ver=${user.versionEspedsg}"></SCRIPT>	
			
	<style type = "text/css">
	.ui-datepicker { font-size:9pt;}
	</style>


<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
<tr>
	<td>
	<%-- tab container component --%>
	<table width="100%"  class="text11" cellspacing="0" border="0" cellpadding="0">
		<tr height="2"><td></td></tr>
		<tr height="25"> 
			<td width="20%" valign="bottom" class="tabDisabled" align="center" nowrap>
				<a style="display:block;" id="transportLink" runat="server" href="tdsadmin_transport.do">
					<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tds.admin.transport.list.tab"/></font>
					<img valign="bottom" src="resources/images/list.gif" border="0" alt="general list">
				</a>
			</td>
			<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			<td width="20%" valign="bottom" class="tab" align="center" nowrap>
				<font class="tabLink">&nbsp;<spring:message code="systema.tds.admin.norsk.import.list.tab"/></font>
				<img valign="bottom" src="resources/images/list.gif" border="0" alt="general list">
			</td>
			<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			<td width="20%" valign="bottom" class="tabDisabled" align="center" nowrap>
				<a style="display:block;" id="norskImportLink" runat="server" href="tdsadmin_norskexport.do">
        			<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tds.admin.norsk.export.list.tab"/></font>
				<img valign="bottom" src="resources/images/list.gif" border="0" alt="general list">
				</a>
			</td>
			<td width="40%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
		</tr>
	</table>
	</td>
</tr>

<tr>
	<td>
	<%-- search filter component --%>
		
 		<table width="100%" class="tabThinBorderWhite" border="0" cellspacing="0" cellpadding="0">
 	        <tr height="3"><td></td></tr>
 	        <form name="tdsAdminSadImportSearchForm" id="tdsAdminSadImportSearchForm" action="tdsadmin_norskimport?action=doFind" method="post" >
 	        <tr>	
 	        		<td class="text12" align="left" >&nbsp;&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.avd"/></td>
                <td class="text12" align="left" >&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.sign"/></td>
                <td class="text12" align="left" >&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.transportuppdrag"/></td>
                <td class="text12" align="left" >&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.sender"/></td>
                <td class="text12" align="left" >&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.receiver"/></td>
                <td class="text12" align="left" >&nbsp;&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.datum"/></td>
                <td>&nbsp;</td>
			</tr>
 	        <tr>
 	        		
				<td align="left" >&nbsp;
           			<select name="avd" id="avd">
	            		<option value="">-Välj-</option>
	 				  	<c:forEach var="record" items="${model.avdList}" >
                             	 	<option value="${record.avd}"<c:if test="${searchFilter.avd == record.avd}"> selected </c:if> >${record.avd}</option>
						</c:forEach> 
					</select>
				</td>
				<td align="left" >
           			<select name="sign" id="sign">
	            		<option value="">-Välj-</option>
	 				  	<c:forEach var="record" items="${model.signList}" >
                             	 	<option value="${record.sign}"
                             	 		<c:if test="${searchFilter.sign == record.sign}"> selected </c:if> >
                             	 		${record.sign}</option>
						</c:forEach> 
					</select>
				</td>
				
				<td align="left" ><input type="text" class="inputText" name="opd" id="opd" size="10" maxlength="10" value='${searchFilter.opd}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="avsNavn" id="avsNavn" size="10" maxlength="50" value='${searchFilter.avsNavn}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="motNavn" id="motNavn" size="10" maxlength="50" value='${searchFilter.motNavn}'>&nbsp;</td>
				<td align="left" ><input onKeyPress="return numberKey(event)" type="text" class="inputText" name="datum" id="datum" size="10" maxlength="8" value='${searchFilter.datum}'>&nbsp;</td>
				<td valign="top" align="left" >
                   &nbsp;<input class="inputFormSubmit" type="submit" name="submit" value='<spring:message code="search.label"/>'>
                   <img src="resources/images/find.png" border="0" alt="">
                </td>
			</tr>
			</form>
			<tr height="10"><td></td></tr>
		</table>
	</td>
	</tr>
	<tr height="3"><td></td></tr>
	<%-- Validation errors --%>
	<spring:hasBindErrors name="record"> <%-- name must equal the command object name in the Controller --%>
	<tr>
		<td>
           	<table width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
           	<tr>
			<td class="textError">					
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
	<%-- list component --%>
	<c:if test="${not empty list}">
	<tr>
		<td>		
		<table width="100%" cellspacing="0" border="0" cellpadding="0">
	    	<%-- separator --%>
	        <tr height="1"><td></td></tr> 
			<tr>
				<td>
				<table width="100%" cellspacing="0" border="0" cellpadding="0">
					<tr class="tableHeaderField" height="20" valign="left">
	                    <td class="tableHeaderFieldFirst" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.avd"/></td>
                			<td class="tableHeaderField" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.sign"/></td>
		                <td class="tableHeaderField" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.transportuppdrag"/></td>
		                <td class="tableHeaderField" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.sender"/></td>
		                <td class="tableHeaderField" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.receiver"/></td>
		                <td class="tableHeaderField" align="left" >&nbsp;<spring:message code="systema.tds.admin.sadimport.list.search.label.datum"/></td>
	                </tr>     
		            <c:forEach items="${list}" var="topic" varStatus="counter">    
		               <c:choose>           
		                   <c:when test="${counter.count%2==0}">
		                       <tr class="tableRow" height="20" >
		                   </c:when>
		                   <c:otherwise>   
		                       <tr class="tableOddRow" height="20" >
		                   </c:otherwise>
		               </c:choose>
		               <td class="tableCellFirst" width="5%">&nbsp;${topic.avd}</td>
		               <td class="tableCell" >&nbsp;${topic.sign}</td>
		               <td class="tableCell" >&nbsp;${topic.opd}</td>
		               <td class="tableCell" >&nbsp;${topic.avsNavn}</td>
		               <td class="tableCell" >&nbsp;${topic.motNavn}</td>
		               <td class="tableCell" >&nbsp;${topic.datum}</td>
		            </tr> 
		            </c:forEach>
	            </table>
			</td>	
			</tr>
		</table>
		</td>
	</tr>
    </c:if> 
    
</table>	
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->

