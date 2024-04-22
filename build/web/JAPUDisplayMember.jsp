<%-- 
    Document   : JAPUDisplayMember
    Created on : Feb. 7, 2024, 1:14:16 a.m.
    Author     : joees
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAPU Programming Club</title>
    </head>
    <body>
        <jsp:include page="Includes/JAPUBanner.jsp"/>

        <section>
            <h1>List of members</h1>
            
            <table class="displayMembers">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Program</th>
                        <th>Year</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="member" items="${members}">
                        <tr>
                            <td>${member.emailAddress}</td>
                            <td>${member.fullName}</td>
                            <td>${member.programName}</td>
                            <td>${member.yearLevel}</td>
                            <td><a href="<c:url value='JAPUMemberAdmin?action=editMember&amp;email=${member.emailAddress}'/>">Edit</a></td>
                            <td><a href="<c:url value='JAPUMemberAdmin?action=removeMember&amp;email=${member.emailAddress}'/>">Remove</a></td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <form action="JAPUMemberAdmin" method="get">
                <input type="hidden" name="action" value="addMember">
                <input type="submit" value="Add member">
            </form>
        </section>
        
        <jsp:include page="Includes/JAPUFooter.jsp"/>
    </body>
</html>
