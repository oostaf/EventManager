<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">
    <title>Oops, something went wrong. Please contact administrator</title>
</head>
<body>
<jsp:include page="navigationPanel.jsp"></jsp:include>
<h3>Oops, something went wrong. Please contact your administrator</h3>
<title>Oops, something went wrong. Please contact administrator</title>
<div class="text-center">
    <img src='<c:url value="/resources/images/oops.jpg"></c:url>' class="rounded img-thumbnail" alt="Oops">
</div>
</body>
</html>
