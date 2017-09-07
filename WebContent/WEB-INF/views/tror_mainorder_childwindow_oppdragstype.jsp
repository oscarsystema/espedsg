<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header =====================================-->
<jsp:include page="/WEB-INF/views/headerTrorChildWindows.jsp" />
<!-- =====================end header ====================================-->

	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
	specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/tror_childwindow.js?ver=${user.versionEspedsg}"></SCRIPT>
	
	<table width="90%" class="tableBorderWithRoundCorners3D_RoundOnlyOnBottom" cellspacing="0" border="0" cellpadding="0">
		<tr height="5"><td colspan="2"></td></tr>
		<tr>
			<td colspan="3" class="text14Bold">&nbsp;&nbsp;&nbsp;
				<img title="search" valign="bottom" src="resources/images/search.gif" width="24px" height="24px" border="0" alt="search">
				<spring:message code="systema.tror.childwindow.oppdragstype.label.title"/>
			</td>
		</tr>
		<tr height="20"><td colspan="2"></td></tr>
		<tr>
		<td valign="top">
			
				<form name="trorTollstedForm" id="trorTollstedForm" action="tror_mainorder_childwindow_oppdragstype.do?action=doFind" method="post">
				<input type="hidden" name="ctype" id="ctype" value="${model.ctype}">	
				<%-- ============================================  --%>
	          	<%-- Here we have the search  popup window --%>
	          	<%-- ============================================  --%>
          		<%-- this container table is necessary in order to separate the datatables element and the frame above, otherwise
			 	the cosmetic frame will not follow the whole datatable grid including the search field... --%>
				<table id="containerdatatableTable" cellspacing="2" align="left" width="100%">
				
					<%-- FILTER (when applicable
					<tr>
					<td>
						<table>
						<form name="trorTollstedForm" id="trorTollstedForm" action="tror_mainorder_childwindow_tollsted.do?action=doFind" method="post">
						<input type="hidden" name="ctype" id="ctype" value="${model.ctype}">
						<tr>
							<td class="text12">&nbsp;<spring:message code="systema.tror.childwindow.tollsted.label.kode"/></td>
							<td class="text12">&nbsp;<input type="text" class="inputText" name="ktskod" id="ktskod" size="8" maxlength="8" value="${model.record.ktskod}"></td>
							<td class="text11">&nbsp;</td>
							<td class="text12">&nbsp;<spring:message code="systema.tror.childwindow.tollsted.label.name"/></td>
							<td class="text12">&nbsp;<input type="text" class="inputText" name="ktsnav" id="ktsnav" size="10" maxlength="35" value="${model.record.ktsnav}"></td>
							
							<td class="text11">&nbsp;</td>
	           				<td align="right">&nbsp;<input class="inputFormSubmit" type="submit" name="submit" value='<spring:message code="search.label"/>'></td>
		           		</tr>
		           		</form>
		           		</table>
					</td>
					</tr>								           		
	           		<tr height="10"><td></td></tr>
	           		 --%>
					<tr class="text12" >
					<td class="ownScrollableSubWindowDynamicWidthHeight" width="90%" style="height:30em;">
					<%-- this is the datatables grid (content)--%>
					<table id="oppdragstypeList" class="display compact cell-border" width="100%">
						<thead>
						<tr style="background-color:#EEEEEE">
							<th width="5%" class="text11">&nbsp;<spring:message code="systema.tror.childwindow.oppdragstype.label.kode"/></th>   
		                    <th class="text11">&nbsp;<spring:message code="systema.tror.childwindow.oppdragstype.label.name"/></th>
		                    <th class="text11">&nbsp;<spring:message code="systema.tror.childwindow.oppdragstype.label.name.english"/></th>

		                </tr> 
		                </thead>
		                
		                <tbody>
		                <c:forEach var="record" items="${model.oppdragstypeList}" varStatus="counter">    
			               <tr class="text11" >
			               <%-- 
			               <td class="text11MediumBlue" style="cursor:pointer;" id="vadrnr_${record.vadrnr}@navn_${record.vadrna}@adr1_${record.vadrn1}@adr2_${record.vadrn2}@postnrsted_${record.vadrn3}@counter_${counter.count}img">
			               	 <img style="vertical-align:middle;" src="resources/images/bebullet.gif" border="0" >
			               </td>
			               --%>
			               <td width="2%" class="text11MediumBlue" style="cursor:pointer;" id="id_${record.ko1kod}@name_${record.ko1ntx}@name2_${record.ko1etx}@counter_${counter.count}">
			               	 	${record.ko1kod}
			               </td>
			               <td class="text11" >&nbsp;${record.ko1ntx}</td>
			               <td class="text11" >&nbsp;${record.ko1etx}</td> 
			                      
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