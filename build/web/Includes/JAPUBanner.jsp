<%-- 
    Document   : JAPUBanner
    Created on : Feb. 5, 2024, 7:14:17 p.m.
    Author     : joees
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAPU Programming Club</title>
        <link href="Styles/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <img src="Images/japu-icon.png" alt="header-image" width="70px"/>
            <h1>JAPU Computer Programming Club</h1>
            <h2>IT@Conestoga</h2>
        </header>
        <nav id="nav_bar">
            <ul>
                <li><a href="<c:url value='JAPUIndex.jsp'/>">Home</a></li>
                <li><a href="<c:url value='JAPURegister.jsp'/>">Register</a></li>
                <li><a href="<c:url value='JAPULoan'/>">eLoan</a></li>
                <li><a href="<c:url value='JAPUECart.jsp'/>">eCart</a></li>
                <li><a href="<c:url value='JAPUAdmin.jsp'/>">Admin</a></li>
            </ul>
        </nav>
    </body>
</html>
