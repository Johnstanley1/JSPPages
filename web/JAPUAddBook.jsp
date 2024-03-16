<%-- 
    Document   : JAPUAddBook
    Created on : Mar. 8, 2024, 10:01:29 p.m.
    Author     : joees
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <h1>Add a Book</h1>
            
            <c:if test="${not empty errorMsg}">
                <ul>
                    <c:forEach var="errorMsg" items="${errorMsg}">
                        <i><li>${errorMsg}</li></i>
                    </c:forEach>
                </ul><br>
            </c:if>

            <form action="JAPUAddBook" method="post">
                <input type="hidden" name="action" value="save"/>
                
                <label>Code:</label>
                <input type="text" name="code" id="code" style="width:200px" value="${book.code}"/><br>
                
                <label>Description:</label>
                <input type="text" name="description" id="description" style="width:300px" value="${book.description}"/><br>
                
                <label>Quantity:</label>
                <input type="text" name="quantity" id="quantity" style="width:100px" value="${book.quantity}"/><br>
                
                <input type="submit" value="Save" style="margin-left:115px"/>
                <input type="submit" name="cancel" value="Cancel" formaction="JAPUDisplayBooks" formmethod="get"/>                       
            </form>
        </section>
        
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
