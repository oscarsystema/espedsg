<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header =====================================-->
<jsp:include page="/WEB-INF/views/headerEbookingChildWindows.jsp" />
<!-- =====================end header ====================================-->

	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
	specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/ebooking_childwindow.js?ver=${user.versionEspedsg}"></SCRIPT>
	
	<table width="90%" height="500px" class="tableBorderWithRoundCorners3D_RoundOnlyOnBottom" cellspacing="0" border="0" cellpadding="0">
		<tr height="5"><td colspan="2"></td></tr>
		<tr>
			<td colspan="3" class="text14Bold">&nbsp;&nbsp;&nbsp;
			<img title="search" valign="bottom" src="resources/images/search.gif" width="24px" height="24px" border="0" alt="search">
			Forp.koder
			</td>
		</tr>
		<tr height="20"><td colspan="2"></td></tr>
		<tr>
		<td valign="top">
		<form action="ebooking_childwindow_packingcodes.do?action=doFind" name="searchPackingCodesForm" id="searchPackingCodesForm" method="post">
			<input type="hidden" name="callerLineCounter" id="callerLineCounter" value='${model.container.callerLineCounter}'>
			
			<%-- =====================================================  --%>
          	<%-- Here we have the search [Packing codes form] popup window --%>
          	<%-- =====================================================  --%>
          		<%-- this container table is necessary in order to separate the datatables element and the frame above, otherwise
			 	the cosmetic frame will not follow the whole datatable grid including the search field... --%>
				<table id="containerdatatableTable" cellspacing="2" align="left" width="100%" >
					<tr height="5"><td></td></tr>
					<tr>
					<td>
						<table>
						<tr>
							<td class="text11">&nbsp;Kode</td>
							<td class="text11">&nbsp;<input type="text" class="inputText" name="kode" id="kode" size="10" maxlength="10" value="${model.container.kode}"></td>
							
							<td class="text11">&nbsp;Tekst</td>
							<td class="text11">&nbsp;<input type="text" class="inputText" name="tekst" id="tekst" size="10" maxlength="20" value="${model.container.tekst}"></td>
						
							<td class="text11">&nbsp;</td>
	           				<td align="right">&nbsp;<input class="inputFormSubmit" type="submit" name="submit" value='<spring:message code="systema.ebooking.search"/>'>
		           		</tr>
		           		
		           		</table>
					</td>
					</tr>
					<%-- Validation errors --%>
					<spring:hasBindErrors name="record"> <%-- name must equal the command object name in the Controller --%>
					<tr>
						<td colspan="20">
			            	<table align="left" border="0" cellspacing="0" cellpadding="0">
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

					<tr><td><hr size="1" width="100%"/></td></tr>								           		
	           		<tr height="15"><td></td></tr>
					
					<tr class="text12" >
					<td class="ownScrollableSubWindowDynamicWidthHeight" width="100%" style="height:30em;">
					<%-- this is the datatables grid (content)--%>
					<table id="packingCodesList" class="display compact cell-border" width="100%" >
						<thead>
						<tr style="background-color:#EEEEEE">
							<th class="text11" title="adunnr">&nbsp;Kode&nbsp;</th>
		                    <th class="text11" title="adembg">&nbsp;Tekst&nbsp;</th>
		                    <th class="text11" title="adindx">&nbsp;Len.&nbsp;</th>
		                    <th class="text11" title="adklas">&nbsp;Bre.&nbsp;</th>
		                    <th class="text11" title="adsedd">&nbsp;Høy&nbsp;</th>
		                    <th class="text11" title="adtres">&nbsp;Lm-l&nbsp;</th>
		                    <th class="text11" title="adfakt">&nbsp;Lm-f&nbsp;</th>
		                </tr> 
		                </thead>
		                
		                <tbody>
		                <c:forEach var="record" items="${model.packingCodesList}" varStatus="counter">    
			               <c:choose>           
			                   <c:when test="${counter.count%2==0}">
			                       <tr class="text11">
			                   </c:when>
			                   <c:otherwise>   
			                       <tr class="text11">
			                   </c:otherwise>
			               </c:choose>
			               
		               	   <c:choose>
		               	   <c:when test="${not empty model.container.callerLineCounter}">
			               	   <td nowrap style="cursor:pointer;" class="text11MediumBlue" 
				               		id="kode_${record.enkode}@text_${record.entext}@len_${record.enlen}@brd_${record.enbrd}@hoy_${record.enhoy}@lm_${record.enlm}@lm2_${record.enlm2}@dt_${counter.count}" >
				               		&nbsp;<img title="select" valign="bottom" src="resources/images/update.gif" border="0" alt="edit">
				               		&nbsp;&nbsp;${record.enkode}
			               	   </td>
		               	   </c:when>
		               	   <c:otherwise>
		               	   	   <%-- Explicit New Line --%>	
			               	   <td nowrap style="cursor:pointer;" class="text11MediumBlue" 
				               		id="kode${record.enkode}@text${record.entext}@len${record.enlen}@brd${record.enbrd}@hoy${record.enhoy}@lm${record.enlm}@lm2${record.enlm2}@dt_${counter.count}" >
				               		&nbsp;<img title="select" valign="bottom" src="resources/images/update.gif" border="0" alt="edit">
				               		&nbsp;&nbsp;${record.enkode}
			               	   </td>
		               	   </c:otherwise>
		               	   </c:choose>
		               	   
		               	   <td class="text11">&nbsp;${record.entext}</td>
		               	   <td class="text11">&nbsp;${record.enlen}</td>
		               	   <td class="text11">&nbsp;${record.enbrd}</td>
			               <td class="text11">&nbsp;${record.enhoy}</td>
			               <td class="text11">&nbsp;${record.enlm}</td>
			               <td class="text11">&nbsp;${record.enlm2}</td>
			            </tr> 
			            </c:forEach>
			            </tbody>
		            </table>
		            </td>
	           		</tr>
        			</table>
				
		</form>	
		</td>
		</tr>
	</table> 
