<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>

    <script type="text/javascript" src="<c:url value="/resources/js/datatables.min.js"></c:url>"></script>
    <link href="<c:url value="/resources/css/datatables.min.css"></c:url>" rel="stylesheet">
    <link href="<c:url value="/resources/css/table.css"></c:url>" rel="stylesheet">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">
    <header>

        <nav class="navbar navbar-expand-lg navbar-dark blue">
            <a class="navbar-brand"><strong>EventManager</strong></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="eventList">Admin events list</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="newEventList?pageId=1">User events list</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="createEvent">Add event</a>
                    </li>
                </ul>
            </div>
        </nav>

    </header>
</head>
<body>

</body>
</html>
