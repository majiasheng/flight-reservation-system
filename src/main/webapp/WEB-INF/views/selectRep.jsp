<%-- 
    Document   : selectRep
    Created on : Nov 30, 2017, 10:14:08 PM
    Author     : majiasheng
--%>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<c:if test="${person.accessControl ne 'CUSTOMER' }">
    <c:redirect url=""/>
</c:if>

<h2>Select Your Reservation Representative</h2>
<hr>
${msg}
${header.referer}
<div class="mask">
    <!--TODO: check if this is from buy now or auction-->
    <c:choose>
        <c:when test="${empty auction}">
            <form action="/bookflight" method="POST">
                <!--hidden inputs from buy now-->
                
            </c:when>
            <c:otherwise>
                <form action="/bookflightViaAuction" method="POST">        
                    <!--hidden inputs from auction-->
<!--                <input type="hidden" name="NYOP" value="${auction.NYOP}"/><br>
                <input type="hidden" name="personAccNo" value="${auction.personAccNo}"/>
                <input type="hidden" name="airline" value="${auction.airline}"/>
                <input type="hidden" name="flightNo" value="${auction.flightNo}"/>
                <input type="hidden" name="flightClass" value="${auction.flightClass}"/>-->
                </c:otherwise>
            </c:choose>

            <select name="rep">
                <c:forEach var="rep" items="${customerRepresentative}">
                    <!--TODO hide ssn.....-->
                    <option value="${rep.ssn}">${rep.firstName} ${rep.lastName}</option>
                </c:forEach>
            </select>

            <input type="submit" value="Select"/>
        </form>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>