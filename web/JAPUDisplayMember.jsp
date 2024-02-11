<%-- 
    Document   : JAPUDisplayMember
    Created on : Feb. 7, 2024, 1:14:16 a.m.
    Author     : joees
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Members</title>
    </head>
    <body>
        <jsp:include page="Includes/JAPUBanner.jsp"/>

        <section>
            <h2>Thanks for joining our club</h2>
            <p>Here is the information you entered:</p>
            
            <label>Full Name:</label>
            <span>${param.fullName}</span><br>
            
            <label>Email:</label>
            <span>${param.email}</span><br>

            <label>Phone:</label>
            <span>${param.phone}</span><br>
        
            <label>IT Program:</label>
            <span>${param.program}</span><br>
        
            <label>Year Level:</label>
            <span>${param.level}</span><br>
            
            <p>
                To register another member, click on the back button in your browser
                or the return button shown below
            </p><br>
            
            <form action="JAPURegister.jsp">
                <input type="hidden" name="action" value="join">
                <input type="submit" value="Return" class="margin_left">
            </form>
        </section>
        
        <jsp:include page="/Includes/JAPUFooter.jsp"/>
    </body>
</html>
