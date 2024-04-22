<%-- 
    Document   : JAPUAddMember
    Created on : Apr. 19, 2024, 1:47:51 p.m.
    Author     : joees
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAPU Programming Club</title>
    </head>
    <body>
        <jsp:include page="Includes/JAPUBanner.jsp"/>
        
        <section>
            <h2>Add a new member</h2>
            
            <c:if test="${message != null}">
                <p><i>${message}</i></p>
            </c:if><br>
            
            <form action="JAPUMemberAdmin" method="post">
                <input type="hidden" name="action" value="addMember">
                
                <label>Email:</label>
                <input type="text" id="email" name="email" style="width:300px" value="${member.emailAddress}"><br>

                <label>Full Name:</label>
                <input type="text" id="fullName" name="fullName" style="width:200px" value="${member.fullName}"><br>

                <label>Phone:</label>
                <input type="phone" id="phone" name="phone" style="width:100px"><br>

                <label>IT Program</label>
                <select id="program" name="program">
                        <option value="CAS">CAS</option>
                        <option value="SQATE">SQATE</option>
                        <option value="CPA">CPA</option>
                        <option value="CP">CP</option>
                        <option value="CAD">CAD</option>
                        <option value="ITID">ITID</option>
                        <option value="ITSS">ITSS</option>
                </select><br>  

                <label>Year Level:</label>
                <select id="level" name="level">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                </select><br>  
                
                <label>&nbsp;</label>
                <input type="submit" value="Save">
                <input type="reset" name="reset" value="Reset">
            </form>       
        </section>
            
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>