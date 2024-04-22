<%-- 
    Document   : JAPUEditMember
    Created on : Apr. 20, 2024, 11:13:33 p.m.
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
            <h2>Edit an existing member</h2>
            
            <c:if test="${message != null}">
                <p><i>${message}</i></p>
            </c:if><br>
            
            <form action="JAPUMemberAdmin" method="post">
                <input type="hidden" name="action" value="editMember">
                <input type="hidden" name="db_operation" value="update">
                <input type="hidden" name="email" value="${member.emailAddress}">
                
                <label>Email:</label>
                <input type="text" id="email" name="email" style="width:300px" value="${member.emailAddress}" disabled="true"><br>

                <label>Full Name:</label>
                <input type="text" id="fullName" name="fullName" style="width:200px" value="${member.fullName}"><br>

                <label>Phone:</label>
                <input type="phone" id="phone" name="phone"  value="${member.phoneNumber}" style="width:100px"><br>

                <label>IT Program</label>
                <select id="program" name="program">
                        <option value="CAS" ${member.programName eq 'CAS' ? 'selected' : ''}>CAS</option>
                        <option value="SQATE" ${member.programName eq 'SQATE' ? 'selected' : ''}>SQATE</option>
                        <option value="CPA" ${member.programName eq 'CAP' ? 'selected' : ''}>CPA</option>
                        <option value="CP" ${member.programName eq 'CP' ? 'selected' : ''}>CP</option>
                        <option value="CAD" ${member.programName eq 'CAD' ? 'selected' : ''}>CAD</option>
                        <option value="ITID" ${member.programName eq 'ITID' ? 'selected' : ''}>ITID</option>
                        <option value="ITSS" ${member.programName eq 'ITSS' ? 'selected' : ''}>ITSS</option>
                </select><br>  

                <label>Year Level:</label>
                <select id="level" name="level">
                        <option value="1" ${member.yearLevel eq '1' ? 'selected' : ''}>1</option>
                        <option value="2" ${member.yearLevel eq '2' ? 'selected' : ''}>2</option>
                        <option value="3" ${member.yearLevel eq '3' ? 'selected' : ''}>3</option>
                        <option value="4" ${member.yearLevel eq '4' ? 'selected' : ''}>4</option>
                </select><br>  
                
                <label>&nbsp;</label>
                <input type="submit" value="Update">
                <input type="reset" name="reset" value="Reset">
            </form>       
        </section>
            
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>