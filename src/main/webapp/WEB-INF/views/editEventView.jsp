<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!--  Flatpickr  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_blue.css">

    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">


    <meta charset="UTF-8">
    <title>Edit Event</title>
</head>
<body>
<script>
    var stringDate = "${event.date}";
    var bits = stringDate.split(/\D/);
    var predefineDate = new Date(bits[0], --bits[1], bits[2], bits[3], bits[4]);
    $(function () {
        $("#dateField").flatpickr({
            enableTime: true,
            dateFormat: "m-d-Y H:i",
            defaultDate: predefineDate
        });
    });

    (function () {
        'use strict';
        window.addEventListener('load', function () {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();

    $(function () {
        var locationsList = [
            <c:forEach items="${locations}" var="location" varStatus="status">
            '${location.address}'
            <c:if test="${!status.last}">
            ,
            </c:if>
            </c:forEach>
        ];
        $("#addressField").autocomplete({
            source: locationsList
        });
    });
</script>

<jsp:include page="navigationPanel.jsp"></jsp:include>
<form class="border border-light p-5 needs-validation" method="POST"
      action="${pageContext.request.contextPath}/editEvent" novalidate>
    <p class="h4 mb-4">Edit Event</p>

    <input type="hidden" name="id" value="${event.id}">

    <div class="form-group row">
        <div class="col-sm-10">
            <label for="nameField">Event name</label>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" value="${event.name}" id="nameField"
                   placeholder="Please enter a valid event name" name="name" required>
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
            <textarea id="descriptionField" class="form-control" name="description" value="${event.description}"
                      rows="3">${event.description}</textarea>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="addressField">Address</label>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="addressField" value="${event.location.address}" name="location" required>
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
            <input type="number" id="priceField" class="form-control" name="cost" value="${event.cost}" required>
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
    <button class="btn btn-primary purple-gradient btn-sm" type="submit">Update</button>
    <a href="eventList" class="btn blue-gradient btn-primary btn-sm">Cancel</a>
</form>
</body>
</html>
