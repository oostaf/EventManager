<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/dark.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!--  Flatpickr  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>

<%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>


    <!-- JQuery -->
    <%--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <!-- Bootstrap tooltips -->
    <%--    <script type="text/javascript"--%>
    <%--            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>--%>
    <!-- Bootstrap core JavaScript -->
    <%--    <script type="text/javascript"--%>
    <%--            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
    <!-- MDB core JavaScript -->
    <%--    <script type="text/javascript"--%>
    <%--            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/js/mdb.min.js"></script>--%>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">


    <meta charset="UTF-8">
    <title>Create Event</title>
    <style>
        <%@include file="/WEB-INF/css/datepicker.css"%>
        textarea {
            width: 300px;
            height: 150px;
        }
    </style>
</head>
<body>
<script>
    $(function () {
        $("#dateField").flatpickr({
            enableTime: true,
            dateFormat: "m-d-Y H:i"
        });
    });

    (function() {
        'use strict';
        window.addEventListener('load', function() {
// Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
// Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>


<form class="border border-light p-5 needs-validation" method="POST" action="${pageContext.request.contextPath}/createEvent" novalidate>
    <p class="h4 mb-4">Create Event</p>

    <div class="form-group row">
        <div class="col-sm-10">
            <label for="nameField">Event name</label>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" value="${event.name}" id="nameField" placeholder="Please enter a valid event name" name="name" required>
            <div class="invalid-feedback">
                Event name could not be empty.
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="descriptionField">Description</label>
        </div>
        <div class="col-sm-5">
            <textarea id="descriptionField" class="form-control" name="description" value="${event.description}" rows="3"></textarea>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="addressField">Address</label>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="addressField" value="${event.address}" name="address" required>
            <div class="invalid-feedback">
                Address field could not be empty.
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="priceField">Price</label>
        </div>
        <div class="col-sm-5">
            <input type="number" id="priceField" class="form-control" name="price" value="${event.price}" required>
            <div class="invalid-feedback">
                Price field could not be empty.
            </div>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="dateField">Date</label>
        </div>
        <div class="col-sm-5">
            <input type="text" id="dateField" class="form-control" name="date" value="${event.date}" required>
        </div>
    </div>
    <button class="btn btn-primary purple-gradient btn-sm" type="submit">Submit</button>
    <a href="eventList" class="btn blue-gradient btn-primary btn-sm">Cancel</a>

    <%-- <table border="0">
         <tr>
             <td>Name</td>
             <td><input type="text" name="name" class="form-control is-valid" value="${event.name}" required placeholder="Please enter a valid event name"/>
                 <div class="valid-feedback feedback-icon">
                     <i class="fa fa-check"></i>
                 </div>
                 <div class="invalid-feedback feedback-icon">
                     <i class="fa fa-times"></i>
                 </div></td>
         </tr>
         <tr>
             <td>Description</td>
             <td><textarea type="text" name="description" maxlength="300" value="${event.description}"></textarea></td>
         </tr>
         <tr>
             <td>Address</td>
             <td><input type="text" name="address" value="${event.address}" required/></td>
         </tr>
         <tr>
             <td>Price</td>
             <td><input type="text" pattern="\d+" name="price" value="${event.price}" required/></td>
         </tr>
         <tr>
             <td>Date</td>
             <td><input type="text" name="date" value="${event.date}" id="datepicker" required/></td>
         </tr>
         <tr>
             <td colspan="2">
                 <input type="submit" value="Submit"/>
                 <a href="eventList">Cancel</a>
             </td>
         </tr>
     </table>--%>
</form>


</body>
</html>
