<%-- 
    Document   : JAPUError
    Created on : Mar. 11, 2024, 10:24:52 p.m.
    Author     : joees
--%>

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
           <h1>Java Error</h1>
           <p>Sorry, java has thrown an exception.</p>
           <p>To continue, click the back button</p>
           
           <h2>Details</h2>
           <p>Type: ${errorClass}</p>
           <p>Message: ${errorMessage}</p>
        </section>
        
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
