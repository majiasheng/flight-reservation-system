<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${person.accessControl ne 'MANAGER'}">
    <c:redirect url="" />
</c:if>
<spring:url var="jquery" value="/resources/js/jquery.min.js" />
<script src="${jquery}"></script>
<script>
    $(document).ready(function () {
        $("#city-form").hide();
        $("#customer-form").hide();
        $("input[name=mode]").change(function () {
            if (this.value === "flightNo") {
                $("#city-form").hide();
                $("#customer-form").hide();
                $("#flight-form").show();
                $("#flightNo").attr("required", true);
                $("#airline").attr("required", true);
                $("#city").attr("required", false);
                $("#customer").attr("required", false);
            } else if (this.value === "city") {
                $("#customer-form").hide();
                $("#flight-form").hide();
                $("#city-form").show();
                $("#flightNo").attr("required", false);
                $("#airline").attr("required", false);
                $("#city").attr("required", true);
                $("#customer").attr("required", false);
            } else if (this.value === "customer") {
                $("#flight-form").hide();
                $("#city-form").hide();
                $("#customer-form").show();
                $("#flightNo").attr("required", false);
                $("#airline").attr("required", false);
                $("#city").attr("required", false);
                $("#customer").attr("required", true);
            }
        });
    });
</script>

<h2>Revenue Summary</h2>
<%@include file="/WEB-INF/views/includes/error.jsp" %>
<div class="mask">
    <form method="GET" action="/revenue-summary">
        <strong>Search by:</strong>
        <input type="radio" name="mode" value="flightNo" checked="checked" />Flight Number
        <input type="radio" name="mode" value="city" />Destination City
        <input type="radio" name="mode" value="customer" />Customer Account Number
        <div id="flight-form">
            Airline ID: <input type="text" id="airline" name="airline" required pattern="[A-Za-z]{2}"/>
            Flight Number: <input type="number" id="flightNo" name="flightNo" class="number-textfield" required pattern="[0-9]+"/>
        </div>
        <div id="city-form">
            Destination City: <input type="text" name="city" id="city" />
        </div>
        <div id="customer-form">
            Account Number: <input type="number" name="customer" id="customer" class="number-textfield" pattern="[0-9]+" />
        </div>
        <input type="submit" value="Get Revenue Summary"/>
    </form>
</div>
<c:choose>
    <c:when test="${not empty result or not empty results}">
        <div class="mask">
            <c:choose>
                <c:when test="${param.mode eq 'city'}">
                    The total revenue generated by ${city} was &#36;${result}.
                </c:when>
                <c:when test="${param.mode eq 'flightNo'}">
                    <c:set var="total" value="${0}" />
                    <table>
                        <tr>
                            <th>Airline</th>
                            <th>Flight Number</th>
                            <th>Revenue</th>
                        </tr>
                        <c:forEach items="${results}" var="flight">
                            <tr>
                                <td>${flight.airline}</td>
                                <td>${flight.flightNo}</td>
                                <td><fmt:formatNumber type="currency">${flight.fare}</fmt:formatNumber></td>
                            </tr>
                            <c:set var="total" value="${total + flight.fare}" />
                        </c:forEach>
                        <tr>
                            <td colspan="2"><strong>TOTAL</strong></td>
                            <td><fmt:formatNumber type="currency">${total}</fmt:formatNumber></td>
                        </tr>
                    </table>
                </c:when>
                <c:when test="${param.mode eq 'customer'}">
                    <c:set var="total" value="${0}" />
                    <table>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Reservation Number</th>
                            <th>Revenue</th>
                        </tr>
                        <c:forEach items="${results}" var="reservation">
                            <tr>
                                <td>${reservation.customer.firstName}</td>
                                <td>${reservation.customer.lastName}</td>
                                <td>${reservation.reservationNo}</td>
                                <td><fmt:formatNumber type="currency">${reservation.totalFare}</fmt:formatNumber></td>
                            </tr>
                            <c:set var="total" value="${total + reservation.totalFare}" />
                        </c:forEach>
                        <tr>
                            <td colspan="3"><strong>TOTAL</strong></td>
                            <td><fmt:formatNumber type="currency">${total}</fmt:formatNumber></td>
                        </tr>
                    </table>
                </c:when>
            </c:choose>
        </div>
    </c:when>
    <c:when test="${empty param.mode}">
        
    </c:when>
    <c:otherwise>
        <div class="mask">No results found.</div>
    </c:otherwise>
</c:choose>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>