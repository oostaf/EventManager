<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="<c:url value="/resources/css/bootstrap/bootstrap.min.css"></c:url>" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="<c:url value="/resources/css/bootstrap/mdb.min.css"></c:url>" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="<c:url value="/resources/css/bootstrap/style.min.css"></c:url>" rel="stylesheet">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/js/mdb.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!--  Flatpickr  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/themes/material_blue.css">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>

    <title>New Events List</title>

    <script>
        Date.prototype.addDays = function (days) {
            var date = new Date(this.valueOf());
            date.setDate(date.getDate() + days);
            return date;
        }

        var today = new Date();
        var week = today.addDays(7);
        $(function () {
            $(".flatpickr").flatpickr({
                wrap: true,
                mode: "range",
                dateFormat: "m-d-Y",
                defaultDate: [today.toLocaleDateString("en-US"), week.toLocaleDateString("en-US")]
            });
        });

        $(document).ready(function () {
            $('.searchButton').click(function () {
                var searchBySelect = $('#searchSelect').val();
                if (!searchBySelect) {
                    searchBySelect = "default";
                }
                var searchPriceVal = $('#amount').val();
                var searchTextVal = $('.searchText').val();
                var searchDatesVal = $('.searchDates').val();
                $('.searchButton').attr("href", "searchOnNewEvents?searchText=" + searchTextVal + "&searchDates=" + searchDatesVal +
                    "&searchBy=" + searchBySelect + "&searchPrice=" + searchPriceVal);
            });
        });

        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: ${maxEventsCost},
                values: [${minSelectedEventsCost}, ${maxSelectedEventsCost}],
                slide: function (event, ui) {
                    $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                }
            });
            $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                " - $" + $("#slider-range").slider("values", 1));
        });
        $(document).ready(function () {
            document.getElementById('searchSelect').value = "${selectValue}";

            if ("${searchDates}" != "") {
                document.getElementById('searchDateField').value = "${searchDates}";
            }
        });
    </script>
</head>
<body>
<jsp:include page="navigationPanel.jsp"></jsp:include>
<main class="mt-5 pt-5">
    <div class="container">
        <section class="card wow fadeIn" id="intro">
            <div class="border border-light p-5">
                <div class="form-group row">
                    <div class="col-sm-2 input-group md-form form-sm form-2 pl-0">
                        <select id="searchSelect"
                                class="browser-default custom-select input-group-text blue lighten-3">
                            <option value="default" disabled selected>Search by:</option>
                            <option value="searchByName">Name</option>
                            <option value="searchByDescription">Description</option>
                            <option value="searchByAddress">Address</option>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group md-form form-sm form-2 pl-0">
                            <input class="form-control searchText my-0 py-1 red-border" type="text"
                                   placeholder="Search"
                                   aria-label="Search" value="${searchText}">
                            <div class="input-group-append">
                    <span class="input-group-text blue lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
                                                                                      aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group md-form form-sm form-2 pl-0 flatpickr">
                            <input type="text" id="searchDateField" class="searchDates form-control my-0 py-1"
                                   name="date"
                                   value="${searchDates}" data-input>
                            <button class="clear_button input-group-text blue lighten-3" title="clear" data-clear>
                                <i class="fa fa-window-close"></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group md-form form-sm form-2 pl-0">
                            <a class="btn searchButton btn-rounded blue lighten-3 btn-sm my-0" type="submit"
                               href="${myURL}">Search</a>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <p>
                            <label for="amount">Price range:</label>
                            <input type="text" id="amount" readonly
                                   style="border:0; color:#4285f4; font-weight:bold;">
                        </p>
                        <div id="slider-range" class="input-group-text blue lighten-3"></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pt-5">
            <div class="wow fadeIn">
                <c:forEach items="${eventList}" var="event">
                <div class="row wow fadeIn">
                    <div class="col-lg-5 col-xl-4 mb-4">
                        <div class="view overlay rounded z-depth-1">
                            <img src="<c:url value="/resources/images/eventImage.jpg"></c:url>"
                                 class="img-fluid" alt="">
                            <a href="" target="_blank">
                                <div class="mask rgba-white-slight waves-effect waves-light"></div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-xl-7 ml-xl-4 mb-4">
                        <h3 class="mb-3 font-weight-bold dark-grey-text">
                            <strong>${event.name}</strong>
                        </h3>
                        <p class="grey-text">${event.description}</p>
                        <p class="grey-text">${event.location.address}</p>
                        <p class="grey-text">Only ${event.cost}$</p>
                        <a href="" target="_blank" class="btn btn-primary btn-md waves-effect waves-light">See details
                        </a>
                    </div>
                </div>
                <hr class="mb-5">
                </c:forEach>
                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-blue">

                        <!--Arrow left-->
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>

                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!--Pagination-->
        </section>
    </div>
</main>
</body>
</html>
