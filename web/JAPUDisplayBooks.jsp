<%-- 
    Document   : JAPUDisplayBooks
    Created on : Mar. 7, 2024, 7:54:36 p.m.
    Author     : joees
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <h1>List of Books</h1>
        
            <table>
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Description</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td><c:out value="${book.code}"/></td>
                        <td><c:out value="${book.description}"/></td>
                        <td><c:out value="${book.quantity}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table><br>
          
          <form action="JAPUAddBook.jsp" method="post">
              <input type="submit" value="Add Book"/>
          </form>
        </section>
        
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
