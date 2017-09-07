<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerTror.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/trorglobal_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	<SCRIPT type="text/javascript" src="resources/js/tror_mainorderlist.js?ver=${user.versionEspedsg}"></SCRIPT>
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
			<td width="15%" valign="bottom" class="tab" align="center" nowrap>
				<img style="vertical-align:middle;" src="resources/images/bulletGreen.png" width="6px" height="6px" border="0" alt="open orders">
				<font class="tabLink">&nbsp;<spring:message code="systema.tror.orderlist.tab" /></font>
			</td>
			<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			<td width="15%" valign="bottom" class="tabDisabled" align="center" nowrap>
				
				<a tabindex=-1 id="createNewOrderTabIdLink" style="display:block;" runat="server" href="#">
					<img style="vertical-align:middle;" src="resources/images/add.png" width="12px" height="12px" border="0" alt="create new">
					<font class="tabDisabledLink"><spring:message code="systema.ebooking.createnew.order.tab"/></font>
				</a>
				
			</td>
			<td width="70%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
		</tr>
	</table>
	</td>
	</tr>
	
	
	
	<tr>
	<td>
		<table width="100%" class="tabThinBorderWhiteWithSideBorders" border="0" cellspacing="0" cellpadding="0">
			<tr height="10"><td></td></tr>
			<%-- Should be set-on for the whole solution. This here was just a prototype
 	        <tr>
 	        <td height="2px" valign="top" align="right"><font class="text11MediumBlue">Stretch workspace</font><input tabindex="-1" type="checkbox" id="checkBoxVisibility">&nbsp;&nbsp;</td>
 	        </tr>
 	        --%>
		</table>		
	</td>
	</tr>
	
	
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
			<table id="wrapperTable" class="tabThinBorderWhite" width="100%" cellspacing="1">
			<%-- OPEN ORDERS --%>
			<%-- search filter component --%>
			<tr>
				<td>
				<form name="searchForm" id="searchForm" action="tror_mainorderlist.do?action=doFind" method="post" >
					<input type="hidden" name="userAvd" id="userAvd" value=''>
					<input type="hidden" name="userHttpCgiRoot" id="userHttpCgiRoot" value='${user.httpCgiRoot}'>
					<input type="hidden" name="userServletHost" id="userServletHost" value='${user.servletHostWithoutHttpPrefix}'>
					<input type="hidden" name="userHttpJQueryDocRoot" id="userHttpJQueryDocRoot" value='${user.httpJQueryDocRoot}'>
					
				<%-- this container table is necessary in order to separate the datatables element and the frame above, otherwise
					 the cosmetic frame will not follow the whole datatable grid including the search field... --%>
				<table id="containerdatatableTable" width="100%" cellspacing="2" align="left" >
				
				<tr>
   				    <td> 
			    	<table width="99%">
			    		<tr > 
				    		<td>&nbsp;<font title="avd" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.avd"/></font></td>
				        	<td>&nbsp;<font title="sign" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.sign"/></font></td>
				        	<td>&nbsp;<font title="orderNr" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.ordernr"/></font></td>
				        	<td>&nbsp;<font title="date" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.date"/></font></td>
				        	<td>
				        		<img onMouseOver="showPop('status_info');" onMouseOut="hidePop('status_info');" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
				 				<font title="status" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.status"/></font>
				 				<div class="text11" style="position: relative; display: inline;" align="left" >
				 				<span style="position:absolute;top:2px; width:400px;" id="status_info" class="popupWithInputText text11"  >
					           		<p>Status på oppdraget. Denne koden forteller hvor langt et oppdrag har kommet i
										"syklusen" fra det første gang registreres til det er ferdig fakturert og avsluttet.</p> 
				           			<ul>
				           				<li><b>' '</b>&nbsp;(blank) "Åpent". Oppdraget er ikke fakturert og det er åpent for alle typer endringer.
				           				<li><b>U</b>&nbsp;Booking / B/L er laget, men oppdrag er ikke bearbeidet. Hvis et oppdrag i sjø-modulen er påbegynt via Booking eller B/L, vill oppdraget inntil man går inn og jobber med det, ha denne statusen.</li>
				           				<li><b>K</b>&nbsp;"Ferdigmeldt". Oppdraget ligger i kø for ferdigmeldte oppdrag. Man har fortsatt mulighet for å endre på fakturaen, eller omgjøre klarmeldingen.</li>
				           				<li><b>C</b>&nbsp;"Klar for samlefaktura". Oppdraget ligger i kø for samlefaktura. Man har fremdeles mulighet for å endre på fakturaen eller fjerne fra samlefakturakø.</li>	
				           				
				           				<li><b>F</b>&nbsp;"Fakturert". Oppdraget er fakturert, men ennå ikke overført til økonomisystemet. Oppdraget kan hverken krediteres eller slettes i denne status. De enkelte fakturaer kan derimot slettes (MENU INV, punkt 6).Fakturanummerene merkes da i fakturajournalen med "**** SLETTET ***".</li>	
				           				<li><b>G</b>&nbsp;"Merket for overføring". Oppdragene har denne status i tiden mellom merking for overføring til regnskap og selve overføringen.Ved denne status kan fakturaer slettes. Fakturanummerene merkes da i fakturajournalen med "**** SLETTET ****".Ordinær kreditering - se under.</li>	
				           				<li><b>T</b>&nbsp;Overført men ikke oppdatert i statistikk. Et oppdrag med denne statusen er ferdig overført til regnskap, men ennå ikke oppdatert i statistikk.</li>	
				           				<li><b>O</b>&nbsp;"Overført". Ferdig overført til regnskap. I denne status kan en faktura i sin helhet krediteres, men ikke slettes.</li>	
				           				<li><b>S</b>&nbsp;"Slettet". Oppdraget er slettet via funksjon for sletting av oppdrag.</li>	
				           				<li><b>X</b>&nbsp;"Under oppdatering ". Noen arbeider med oppdraget, og oppholder seg på oppdragsbildet. Hvis man, mens man er inne på et oppdrag, "mister" kontakten med systemet, eller det oppstår en feilsituasjon, vil oppdraget kunne bli "hengende" i status X.</li>	
				           				<li><b>M</b>&nbsp;"Under oppdatering ". Oppdraget er låst fordi en overføring av import-MVA fra fortollingsprogrammet foregår akkurat nå. OBS! Som man forstår skal et oppdrag ha status 'X' eller 'M' kun en begrenset tidsperiode. Dersom oppdrag har denne status permanent skyldes dette unormalt jobbavbrudd - f.eks strømbrudd.
				           						Ta i så fall kontakt med dataansvarlig slik at hun eller han kan rette statusen på oppdraget til ' '.</li>	
				           							
				           			</ul>
								</span>	
								</div>
				        	</td>
				        	<td>&nbsp;<font title="orderNr" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.delsystem"/></font></td>
				        	<td>&nbsp;<font title="orderNr" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.godsnr"/></font></td>
				        	<%--<td>&nbsp;</td> --%>
				        	<td>&nbsp;<font title="sender" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.sender"/></font></td>
				        	<td>&nbsp;<font title="receiver" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.receiver"/></font></td>
				        	<td>&nbsp;<font title="from" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.from"/></font></td>
				        	<td>&nbsp;<font title="to" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.to"/></font></td>
				        	
			        	</tr>
			        	<tr>
				        	<td>
				        		<select class="inputTextMediumBlue" name="avd" id="avd" autofocus>
			 						<option value="">-velg-</option>
				 				  	<c:forEach var="record" items="${model.avdList}" >
				 				  		<option value="${record.koakon}"<c:if test="${searchFilterTror.avd == record.koakon}"> selected </c:if> >${record.koakon}</option>
									</c:forEach>  
								</select>
				        	</td>
					        <td>
					        	<select class="inputTextMediumBlue" name="sign" id="sign" >
			 						<option value="">-velg-</option>
			 						<c:forEach var="record" items="${model.signatureList}" >
				 				  		<option value="${record.kosfsi}"<c:if test="${searchFilterTror.sign == record.kosfsi}"> selected </c:if> >${record.kosfsi}</option>
									</c:forEach>  
								</select>
					        </td>
				    		<td><input type="text" class="inputText" name="orderNr" id="orderNr" size="8" maxlength="7" value='${searchFilterTror.orderNr}'></td>
					        <td><input type="text" class="inputText" name="date" id="date" size="9" maxlength="8" value='${searchFilterTror.date}'></td>
					        <td><input type="text" class="inputText" name="status" id="status" size="3" maxlength="1" value='${searchFilterTror.status}'>&nbsp;</td>
					        
					        <td>
					        	<select class="inputTextMediumBlue" name="ttype" id="ttype">
					        		<option value="">-velg-</option>
									<option value="A" <c:if test="${searchFilterTror.ttype == 'A'}"> selected </c:if> ><spring:message code="systema.tror.order.suborder.landimport"/></option>
									<option value="B" <c:if test="${searchFilterTror.ttype == 'B'}"> selected </c:if> ><spring:message code="systema.tror.order.suborder.landexport"/></option>
									<option value="C" <c:if test="${searchFilterTror.ttype == 'C'}"> selected </c:if> ><spring:message code="systema.tror.order.suborder.airimport"/></option>
									<option value="D" <c:if test="${searchFilterTror.ttype == 'D'}"> selected </c:if> ><spring:message code="systema.tror.order.suborder.airexport"/></option>
								</select>
					        </td>
					        <td><input type="text" class="inputText" name="godsNr" id="godsNr" size="10" maxlength="20" value='${searchFilterTror.godsNr}'></td>
					        <%--
					        <td nowrap>	
				        		<font title="fromDate/fromDate" class="text12"></font>
					        	&nbsp;<input type="text" class="inputText" name="fromDate" id="fromDate" size="9" maxlength="8" value='${searchFilterTror.fromDate}'>
					        	-<input type="text" class="inputText" name="toDate" id="toDate" size="9" maxlength="8" value='${searchFilterTror.toDate}'>
					        </td>
					         --%>
					        <td><input type="text" class="inputText" name="sender" id="sender" size="15" maxlength="15" value='${searchFilterTror.sender}'></td>
				        	<td><input type="text" class="inputText" name="receiver" id="receiver" size="15" maxlength="15" value='${searchFilterTror.receiver}'></td>
				        	<td><input type="text" class="inputText" name="from" id="from" size="9" maxlength="8" value='${searchFilterTror.from}'></td>
					        <td><input type="text" class="inputText" name="to" id="to" size="9" maxlength="8" value='${searchFilterTror.to}'>&nbsp;</td>
					        <td>	
					        	<input onClick="setBlockUI(this);" class="inputFormSubmit" type="submit" name="submit" id="submit" value='<spring:message code="systema.tror.search"/>'>
					        </td>   
				        </tr>
				    </table>    
					</td>
					
				</tr>
				<%--
				<c:if test="${not empty model.containerOpenOrders.maxWarning}">
					<tr>	
						<td class="listMaxLimitWarning">
						<img style="vertical-align:bottom;" src="resources/images/redFlag.png" width="16" height="16" border="0" alt="Warning">
						${model.containerOpenOrders.maxWarning}</td>
					</tr>
				</c:if>
				--%>
				 
				<tr height="5"><td></td></tr>
				<tr>
				<td >
				<table style="width:100%;" id="openOrders" class="display compact cell-border" cellspacing="0" >
					<thead >
					<tr style="background-color:#BCC6CC">
						<th width="2%" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.avd"/></th>
						<th width="2%" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.edit"/></th>
						<th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.ordernr"/></th> 
						<th width="2%" class="text12"><spring:message code="systema.tror.orders.open.list.search.label.sign"/></th>  
						<th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.turnr"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.date"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.status"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.delsystem"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.godsnr"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.sender"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.receiver"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.antall"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.weight"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.m3"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.from"/></th>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.to"/></th>
	                    <%-- START Print 
	                    <th class="tableHeaderFieldEbookingPrint" align="center" title="Skriv ut">&nbsp;F.br&nbsp;</td>
	                    <th class="tableHeaderFieldEbookingPrint" align="center" title="Skriv ut">&nbsp;Cmr&nbsp;</td>
	                    <th class="tableHeaderFieldEbookingPrint" align="center" title="Skriv ut">&nbsp;Merk Pdf&nbsp;</td>
	                    <th class="tableHeaderFieldEbookingPrint" align="center" title="Skriv ut">&nbsp;Merk Zpl&nbsp;</td>
	                    <%-- END Print --%>
	                    <%-- Transmission 
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.transmit"/></th>
	                    --%>
	                    <th class="text12"><spring:message code="systema.tror.orders.open.list.search.label.delete"/></th>
	                    
	                </tr> 
	                </thead>
	                
	                
	                <tbody >
		            <c:forEach items="${listOpenOrders}" var="record" varStatus="counter">  
		            <input type="hidden" name="unik_${counter.count}" id="unik_${counter.count}" value='${Xrecord.unik}'>
		            <tr class="tex11" >
		               <td width="2%" align="center" class="text11MediumBlue">${record.heavd}</td>	
		               <td width="2%" align="center"  >
			           		<c:if test="${empty record.hest || record.hest == 'U' || record.hest == 'O' || record.hest == 'F' }">
			           			<c:choose>
								<c:when test="${ record.heur == 'A' || record.heur == 'B' || record.heur == 'C' || record.heur == 'D' }">
									<c:if test="${ record.heur == 'A' }">
						           		<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderlandimport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<img title="Update" style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="update">
			    		    				
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'B' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderlandexport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<img title="Update" style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="update">
			    		    				
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'C' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderairimport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<img title="Update" style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="update">
			    		    				
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'D' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderairexport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<img title="Update" style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="update">
			    		    			</a>
		    		    			</c:if>
	    		    			</c:when>
	    		    			<c:otherwise>
		           					&nbsp;
			           			</c:otherwise>
			           			
    		    				</c:choose>
    		    			</c:if>
			           </td>
		               <td title="${record.heopd}" class="text11MediumBlue" id="opd_${record.heopd}@${counter.count}" >
			           		<div id="opd${record.heopd}_linkcontainer${counter.count}" >
				           		<c:if test="${empty record.hest || record.hest == 'U' || record.hest == 'O' || record.hest == 'F' }">
				           		<c:choose>
									<c:when test="${ record.heur == 'A' || record.heur == 'B' || record.heur == 'C' || record.heur == 'D' }">
									<c:if test="${ record.heur == 'A' }">
						           		<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderlandimport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<font class="text11MediumBlue"><b>${record.heopd}</b></font>
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'B' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderlandexport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<font class="text11MediumBlue"><b>${record.heopd}</b></font>
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'C' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderairimport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<img title="Update" style="vertical-align:bottom;" src="resources/images/update.gif" border="0" alt="update">
			    		    				<font class="text11MediumBlue"><b>${record.heopd}</b></font>
			    		    			</a>
		    		    			</c:if>
		    		    			<c:if test="${ record.heur == 'D' }">
		    		    				<a style="cursor:pointer;" id="@opd_${record.heopd}@alinkOpenOrdersListId_${counter.count}"
						           			onClick="setBlockUI(this);" href="tror_mainorderairexport.do?action=doFetch&heavd=${record.heavd}&heopd=${record.heopd}&status=${Xrecord.status}">
			    		    				<font class="text11MediumBlue"><b>${record.heopd}</b></font>
			    		    			</a>
		    		    			</c:if>
		    		    			</c:when>
		    		    			<c:otherwise>
			           					<font class="text11"><b>${record.heopd}</b></font>
				           			</c:otherwise>
	    		    			</c:choose>
	    		    			</c:if>
    		    			</div>
			           </td>
			           
			           <td width="2%" align="center" class="text11MediumBlue">&nbsp;${record.hesg}</td>
			           <td align="center" class="text11MediumBlue">&nbsp;${record.hepro}</td>
			           <td align="center" class="text11MediumBlue">&nbsp;${record.hedtop}</td>
			           <td width="2%" align="center" class="text11MediumBlue">&nbsp;<b><font style="color: orangered">${record.hest}</font></b></td>
			           <td nowrap align="left" class="text11MediumBlue">
			           		<c:choose>
								<c:when test="${ record.heur == 'A' || record.heur == 'B' || record.heur == 'C' || record.heur == 'D' }">
									<c:if test="${ record.heur == 'A' }">
										<img style="vertical-align:middle;" src="resources/images/lorry_green.png" width="16px" height="16px" border="0" alt="update sub-order">
			           					&nbsp;<spring:message code="systema.tror.order.suborder.landimport"/>
			           				</c:if>
			           				<c:if test="${ record.heur == 'B' }">
			           					<img style="vertical-align:middle;" src="resources/images/lorry_blue.png" width="16px" height="16px" border="0" alt="update sub-order">
			           					&nbsp;<spring:message code="systema.tror.order.suborder.landexport"/>
			           				</c:if>
			           				<c:if test="${ record.heur == 'C' }">
			           					<img style="vertical-align:middle;" src="resources/images/airplaneYellow.png" width="16px" height="16px" border="0" alt="update sub-order">
			           					&nbsp;<spring:message code="systema.tror.order.suborder.airimport"/>
			           				</c:if>
			           				<c:if test="${ record.heur == 'D' }">
			           					<img style="vertical-align:middle;" src="resources/images/airplaneBlue.png" width="16px" height="16px" border="0" alt="update sub-order">
			           					&nbsp;<spring:message code="systema.tror.order.suborder.airexport"/>
			           				</c:if>
			           			</c:when>
			           			<c:otherwise>
			           					&nbsp;${record.heur}
			           			</c:otherwise>
		        			</c:choose>
			           				
			           </td>
		               <td align="left" class="text11MediumBlue">&nbsp;${record.hegn}</td>
		               <td align="left" class="text11MediumBlue">&nbsp;${record.henas}</td>
		               <td align="left" class="text11MediumBlue">&nbsp;${record.henak}</td>
		               <td align="center" class="text11MediumBlue">&nbsp;${record.hent}</td>
		               <td align="center" class="text11MediumBlue">&nbsp;${record.hevkt}</td>
		               <td align="center" class="text11MediumBlue">&nbsp;${record.hem3}</td>
		               <td align="center" class="text11MediumBlue">&nbsp;${Xrecord.xfralk}${Xrecord.hesdf}</td>
		               <td align="center" class="text11MediumBlue">&nbsp;${Xrecord.xtillk}${Xrecord.hesdt}</td>
		               <%-- START Print 
	                    <td class="tableCellEbookingPrint" align="center">
	                    	<%-- only those status that have a real state. Status=null is not allowed to print 
	                    	<c:if test="${not empty record.status}"> 
		                    	<a id="fraktbrevLinkId_${record.unik}" href="javascript:void(0);" onClick="TODOprintDocument(this);" >
		                    		<img onMouseOver="showPop('fraktbrev_info${counter.count}');" onMouseOut="hidePop('fraktbrev_info${counter.count}');"style="vertical-align:bottom;" src="resources/images/fraktbrev2.gif" height="14px" width="14px" border="0" alt="send">
				               		<c:choose>
				               			<c:when test="${record.hepk1 == 'Y'}">
				               				<img title="must be printed" style="vertical-align:middle;" src="resources/images/bulletRed.gif" border="0" alt="not printed yet">
				               			</c:when>
				               			<c:otherwise>
				               				<c:if test="${record.hepk1 == 'P'}">
				               					<img title="already printed" style="vertical-align:middle;" src="resources/images/bulletGreen.gif" border="0" alt="print">
				               				</c:if>
				               				<c:if test="${record.hepk1 != 'P'}">
				               					<img title="not printed yet" style="vertical-align:middle;" src="resources/images/bulletYellow.gif" border="0" alt="print">
				               				</c:if>
				               			</c:otherwise>
					               	</c:choose>	
								</a>
								<div class="text11" style="position: relative;" align="left">
									<span style="position:absolute; left:0px; top:0px;" id="fraktbrev_info${counter.count}" class="popupWithInputText"  >
										<font class="text11">
						           			<b>Fraktbrev</b>
					           			</font>
									</span>
								</div>
							</c:if>
	                    </td>
	                    <td class="tableCellEbookingPrint" align="center">
	                    	<c:if test="${not empty record.status}">
		                    	<a id="cmrLinkId_${record.unik}" href="javascript:void(0);" onClick="TODOprintDocument(this);">
		                    		<img onMouseOver="showPop('cmr_info${counter.count}');" onMouseOut="hidePop('cmr_info${counter.count}');"style="vertical-align:bottom;" src="resources/images/fraktbrev2.gif" height="14px" width="14px" border="0" alt="send">
				               		<c:choose>
				               			<c:when test="${record.hepk2 == 'Y'}">
				               				<img title="must be printed" style="vertical-align:middle;" src="resources/images/bulletRed.gif" border="0" alt="not printed yet">
				               			</c:when>
				               			<c:otherwise>
				               				<c:if test="${record.hepk2 == 'P'}">
				               					<img title="already printed" style="vertical-align:middle;" src="resources/images/bulletGreen.gif" border="0" alt="print">
											</c:if>
											<c:if test="${record.hepk2 != 'P'}">
				               					<img title="not printed yet" style="vertical-align:middle;" src="resources/images/bulletYellow.gif" border="0" alt="print">
				               				</c:if>
				               			</c:otherwise>
				               		</c:choose>
								</a>
								<div class="text11" style="position: relative;" align="left">
									<span style="position:absolute; left:0px; top:0px;" id="cmr_info${counter.count}" class="popupWithInputText"  >
										<font class="text11">
						           			<b>CMR fraktbrev</b>
					           			</font>
									</span>
								</div>
							</c:if>
	                    </td>
	                    <td class="tableCellEbookingPrint" align="center">
	                    	<c:if test="${not empty record.status}">
		                    	<a id="merkPdfLinkId_${record.unik}" href="javascript:void(0);" onClick="TODOprintDocument(this);">
		                    		<img onMouseOver="showPop('merkPDF_info${counter.count}');" onMouseOut="hidePop('merkPDF_info${counter.count}');"style="vertical-align:bottom;" src="resources/images/fraktbrev2.gif" height="14px" width="14px" border="0" alt="print">
			               			<c:choose>
				               			<c:when test="${record.hepk3 == 'Y'}">
				               				<img title="must be printed" style="vertical-align:middle;" src="resources/images/bulletRed.gif" border="0" alt="not printed yet">
				               			</c:when>
				               			<c:otherwise>
				               				<c:if test="${record.hepk3 == 'P'}">
				               					<img title="already printed" style="vertical-align:middle;" src="resources/images/bulletGreen.gif" border="0" alt="print">
											</c:if>
											<c:if test="${record.hepk3 != 'P'}">
				               					<img title="not printed yet" style="vertical-align:middle;" src="resources/images/bulletYellow.gif" border="0" alt="print">
				               				</c:if>
				               			</c:otherwise>
				               		</c:choose>
								</a>
								<div class="text11" style="position: relative;" align="left">
									<span style="position:absolute; left:0px; top:0px;" id="merkPDF_info${counter.count}" class="popupWithInputText"  >
										<font class="text11">
						           			<b>Merk PDF</b>
					           			</font>
									</span>
								</div>
							</c:if>
	                    </td>
	                    <td class="tableCellEbookingPrint" align="center">
	                    	<c:if test="${not empty record.status}">
		                    	<a id="merkZplLinkId_${record.unik}" href="javascript:void(0);" onClick="TODOprintDocument(this);">
		                    		<img onMouseOver="showPop('merkZPL_info${counter.count}');" onMouseOut="hidePop('merkZPL_info${counter.count}');"style="vertical-align:bottom;" src="resources/images/fraktbrev2.gif" height="14px" width="14px" border="0" alt="print">
									<c:choose>
				               			<c:when test="${record.hepk3 == 'Y'}">
				               				<img title="must be printed" style="vertical-align:middle;" src="resources/images/bulletRed.gif" border="0" alt="not printed yet">
				               			</c:when>
				               			<c:otherwise>
				               				<c:if test="${record.hepk3 == 'P'}">
				               					<img title="already printed" style="vertical-align:middle;" src="resources/images/bulletGreen.gif" border="0" alt="print">
											</c:if>
											<c:if test="${record.hepk3 != 'P'}">
				               					<img title="not printed yet" style="vertical-align:middle;" src="resources/images/bulletYellow.gif" border="0" alt="print">
				               				</c:if>
				               			</c:otherwise>
				               		</c:choose>
								</a>
								<div class="text11" style="position: relative;" align="left">
									<span style="position:absolute; left:0px; top:0px;" id="merkZPL_info${counter.count}" class="popupWithInputText"  >
										<font class="text11">
						           			<b>Merk ZPL</b>
					           			</font>
									</span>
								</div>
							</c:if>
	                    </td>
	                    <%-- END Print --%>
		               
		               <%--
		               <td align="center" class="text11MediumBlue">
		               		<c:choose>
			               		<c:when test="${Xrecord.status == 'E'}">
			               			<c:choose>
			               			<c:when test="${Xrecord.hepk1 != 'Y' && Xrecord.hepk2 != 'Y' && Xrecord.hepk3 != 'Y'}">
					               		<a style="cursor:pointer;" onClick="setBlockUI(this);" href="TODOebooking_mainorderlist_send_order.do?heunik=${Xrecord.unik}">
					               			<span title="Bookingen kan sendes">
					               			<img src="resources/images/send-file.png" height="18px" width="18px" border="0" alt="send">
					               			</span>
					               		</a>
				               		</c:when>
				               		<c:otherwise>
				               			<img title="Must be printed first (fraktbrev,cmr,etc)" src="resources/images/info3.png" height="12px" width="12px" border="0" alt="must print">
				               		</c:otherwise>
				               		</c:choose>
			               		</c:when>
			               		<c:otherwise>
			               			<c:if test="${Xrecord.status == 'P'}">
			               				<span title="Bookingen er plukket">
			               					<img src="resources/images/complete-icon.png" height="12px" width="12px" border="0" alt="completed">
			               				</span>
			               			</c:if>
			               			<c:if test="${empty Xrecord.status}">
			               				<span title="Booking er sendt inn men ennå ikke plukket til oppdrag">
			               					<img src="resources/images/engines.png" height="16px" width="16px" border="0" alt="in process">
			               				</span>
			               			</c:if>
			               		</c:otherwise>
		               		</c:choose>
		               </td>
		                --%>
		                
		               <td align="center" class="text11MediumBlue">
            		  	 	<a sytle="cursor:pointer;" id="hereff_${Xrecord.hereff}@heunik_${Xrecord.unik}" title="delete" onClick="TODOdoPermanentlyDeleteOrder(this)" tabindex=-1>
			               		<img src="resources/images/delete.gif" border="0" alt="remove">
			               	</a>&nbsp;
					   </td>
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
			
			<tr height="5"><td></td></tr>
			
			</table>
		</td>
		</tr>
		<%-- Pop-up window --%>
		<tr>
		<td>
			<div id="dialogCreateNewOrder" title="Dialog">
				<form  action="tror_mainordergate.do" name="createNewOrderForm" id="createNewOrderForm" method="post">
				 	<input type="hidden" name="actionGS" id="actionGS" value='doUpdate'/>
					<input type="hidden" name="applicationUser" id="applicationUser" value='${user.user}'>
					
					<p class="text12" >&nbsp;<spring:message code="systema.tror.order.suborder.title.types"/></p>
					 				
					<table>
						<tr>
							<td class="text12MediumBlue">Type&nbsp;
								<select class="inputTextMediumBlue11MandatoryField" name="selectedType" id="selectedType">
									<option value="A"><spring:message code="systema.tror.order.suborder.landimport"/></option>
									<option value="B"><spring:message code="systema.tror.order.suborder.landexport"/></option>
									<option value="C"><spring:message code="systema.tror.order.suborder.airimport"/></option>
									<option value="D"><spring:message code="systema.tror.order.suborder.airexport"/></option>
								</select>
								&nbsp;&nbsp;<div style="display:inline;" id="imagePreview"></div>
							</td>
						</tr>
					</table>
						
				</form>
			</div>
		</td>
		</tr>
		
</table>	
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->

