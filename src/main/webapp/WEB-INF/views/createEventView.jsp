<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="<c:url value="/resources/js/typeahead.bundle.js" />"></script>
    <script src="<c:url value="/resources/js/typeahead.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/typeahead.jquery.js" />"></script>
    <script src="<c:url value="/resources/js/typeahead.jquery.min.js" />"></script>
    <script src="<c:url value="/resources/js/bloodhound.js" />"></script>
    <script src="<c:url value="/resources/js/bloodhound.min.js"/>"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_blue.css">

    <!--  Flatpickr  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">

    <meta charset="UTF-8">
    <title>Create Event</title>
</head>
<body>
<script>
    var today  = new Date().toLocaleDateString("en-US");
    $(function () {
        $("#dateField").flatpickr({
            enableTime: true,
            dateFormat: "m-d-Y H:i",
            defaultDate: today
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

    var substringMatcher = function(strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });
            cb(matches);
        };
    };

    var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
        'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
        'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
        'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
        'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
        'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
        'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
        'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ];

    $('.typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'states',
            source: substringMatcher(states)
        });

</script>

<jsp:include page="navigationPanel.jsp"></jsp:include>
<form class="border border-light p-5 needs-validation" method="POST"
      action="${pageContext.request.contextPath}/createEvent" novalidate>
    <p class="h4 mb-4">Create Event</p>

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
                      rows="3"></textarea>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10">
            <label for="addressField">Address</label>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control typeahead" autocomplete="off" id="addressField" value="${event.location.address}" name="location" required>
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
    <button class="btn btn-primary purple-gradient btn-sm" type="submit">Create</button>
    <a href="eventList" class="btn blue-gradient btn-primary btn-sm">Cancel</a>
</form>


</body>
</html>
