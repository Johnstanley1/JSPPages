<%-- 
    Document   : JAPUECart
    Created on : Apr. 9, 2024, 9:06:35 a.m.
    Author     : joees
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAPU Programming Club</title>
    </head>
    <body>
        <jsp:include page="Includes/JAPUBanner.jsp"/>
        <section>
            <h4 style="text-align: center">Your Loan Cart</h4>
            <table class="noBorder">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Description</th>
                        <th style="text-align: right">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalQuantity" value="0"/>
                    <c:forEach var="item" items="${loanCart.items}">
                        <tr>
                            <td><c:out value="${item.code}"/></td>
                            <td><c:out value="${item.description}"/></td>
                            <td style="text-align: right"><c:out value="${item.quantity}"/></td>
                            <c:set var="totalQuantity" value="${totalQuantity + item.quantity}"/>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td></td>
                            <td style="text-align: right">Total</td>
                            <td style="text-align: right"><c:out value="${totalQuantity}"/></td>
                        </tr>
                </tbody>
            </table><br>
                        
            <a href="<c:url value='JAPUClearCart'/>">Clear the cart</a><br><br>
            <a href="<c:url value='JAPULoan'/>">Return to eloan</a>                  
                
        </section>
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
