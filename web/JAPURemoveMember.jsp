<%-- 
    Document   : JAPURemoveMember
    Created on : Apr. 21, 2024, 8:09:17 a.m.
    Author     : joees
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAPU Programming Club</title>
        <link rel="stylesheet" type="text/css" href="Styles/main.css">
    </head>
    <body>
        <jsp:include page="Includes/JAPUBanner.jsp"/>
        
        <section>
            <h2>Do you want to delete this member</h2>
                <form action="JAPUMemberAdmin" method="post">
                    <input type="hidden" name="action" value="deleteMember">
                    <input type="hidden" name="email" value="${member.emailAddress}">

                    <label>Email:</label>
                    <input type="text" id="email" name="email" style="width:300px" value="${member.emailAddress}" disabled="true"><br>

                    <label>Full Name:</label>
                    <input type="text" id="fullName" name="fullName" style="width:200px" value="${member.fullName}" disabled="true"><br>

                    <label>Phone:</label>
                    <input type="phone" id="phone" name="phone" style="width:100px" value="${member.phoneNumber}" disabled="true"><br>

                    <label>IT Program</label>
                    <input type="text" id="program" name="program" style="width:50px" value="${member.programName}" disabled="true"><br>

                    <label>Year Level:</label>
                    <input type="text" id="level" name="level" style="width:50px" value="${member.yearLevel}" disabled="true"><br>

                    <label>&nbsp;</label>
                    <input type="submit" value="Yes">
                    <input type="submit" name="undoAction" value="no" formaction="JAPUMemberAdmin" formmethod="get">                
                </form>
        </section>
            
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>