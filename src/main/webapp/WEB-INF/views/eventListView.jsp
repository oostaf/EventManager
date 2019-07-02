<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<!DOCTYPE html>
<html>
<head>

    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/js/mdb.min.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Event List</title>
    <script>
        $(document).ready(function () {
            // For A Delete Record Popup
            $('.deactivate-event').click(function () {
                var id = $(this).attr('data-id');

                $('.deactivateEvent').attr("href", id);
            });
        });

    </script>
</head>
<body>
<jsp:include page="navigationPanel.jsp"></jsp:include>

<h3>Event List</h3>
<div class="border border-light p-5">
    <table id="eventTable" class="table table-striped table-bordered" width="80%">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Address</th>
            <th>Price</th>
            <th>Date</th>
            <th>Is Active</th>
            <th>Edit</th>
            <th>Deactivate</th>
        </tr>
        <c:forEach items="${eventList}" var="event">
            <tr>
                <td>${event.id}</td>
                <td>${event.name}</td>
                <td>${event.description}</td>
                <td>${event.location.address}</td>
                <td>${event.cost}</td>
                <javatime:format value="${event.date}" pattern="yyyy-MM-dd HH:mm" var="parsedDate"/>
                <td>${parsedDate}</td>
                <td>${event.active}</td>
                <td>
                    <a href="editEvent?id=${event.id}">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-sm btn-danger btn-rounded deactivate-event" data-toggle="modal"
                            data-target="#deactivateModal" data-whatever="${event.id}"
                            data-id="deactivateEvent?id=${event.id}">
                        Deactivate
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="deactivateModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Event deactivation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="deactivateModalBody">
                Are you sure you wanna deactivate this event?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a class="deactivateEvent btn btn-primary" href="">Deactivate</a>
            </div>
        </div>
    </div>
</div>

<%--<a href="createEvent">Create Event</a>--%>


</body>
</html>