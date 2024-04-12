<%-- 
    Document   : JAPUELoan
    Created on : Apr. 7, 2024, 8:31:17 p.m.
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
            <table class="ELoan">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Description</th>
                        <th>QOH</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${loanItems}">
                         <tr>
                            <td><c:out value="${item.code}"/></td>
                            <td><c:out value="${item.description}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.quantity > 0}">
                                        <c:out value="${item.quantity}"/>
                                    </c:when>
                                    <c:otherwise>0</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.quantity > 0}">
                                        <a href="JAPUCart?action=reserve&amp;code=${item.code}">Reserve</a>
                                    </c:when>
                                    <c:otherwise>N/A</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
