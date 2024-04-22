<%-- 
    Document   : JAPUAdmin
    Created on : Feb. 5, 2024, 7:29:58 p.m.
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
            <h1>Admin: Data Maintenance</h1>
            <a href="<c:url value='JAPUDisplayBooks?action=displayBooks'/>">Maintain Books</a><br><br>
            <a href="<c:url value='JAPUMemberAdmin?action=displayMembers'/>">Display Members</a>
        </section>
        
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
