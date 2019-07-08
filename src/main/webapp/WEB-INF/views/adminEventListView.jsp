<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- MDBootstrap Datatables  -->
    <script type="text/javascript" src="<c:url value="/resources/js/datatables.min.js"></c:url>"></script>
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
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet">
    <link href="<c:url value="/resources/css/datatables.min.css"></c:url>" rel="stylesheet">
    <link href="<c:url value="/resources/css/table.css"></c:url>" rel="stylesheet">
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

        $(document).ready(function () {
            $('#eventTable').DataTable({
                "searching": false,// false to disable search (or any other option)
                columnDefs: [{
                    orderable: false,
                    targets: [7, 8]
                }]
            });
            $('.dataTables_length').addClass('bs-select');
        });

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
                $('.searchButton').attr("href", "searchEvents?searchText=" + searchTextVal + "&searchDates=" + searchDatesVal +
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

<h3>Event List</h3>


<div class="border border-light p-5">
    <div class="form-group row">
        <div class="col-sm-1 input-group md-form form-sm form-2 pl-0">
            <select id="searchSelect" class="browser-default custom-select input-group-text blue lighten-3">
                <option value="default" disabled selected>Search by:</option>
                <option value="searchByName">Name</option>
                <option value="searchByDescription">Description</option>
                <option value="searchByAddress">Address</option>
            </select>
        </div>
        <div class="col-sm-2">
            <div class="input-group md-form form-sm form-2 pl-0">
                <input class="form-control searchText my-0 py-1 red-border" type="text" placeholder="Search"
                       aria-label="Search" value="${searchText}">
                <div class="input-group-append">
                    <span class="input-group-text blue lighten-3" id="basic-text1"><i class="fas fa-search text-grey"
                                                                                      aria-hidden="true"></i></span>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="input-group md-form form-sm form-2 pl-0 flatpickr">
                <input type="text" id="searchDateField" class="searchDates form-control my-0 py-1" name="date"
                       value="${searchDates}" data-input>
                <button class="clear_button input-group-text blue lighten-3" title="clear" data-clear>
                    <i class="fa fa-window-close"></i>
                </button>
            </div>
        </div>
        <div class="col-sm-2">
            <p>
                <label for="amount">Price range:</label>
                <input type="text" id="amount" readonly style="border:0; color:#4285f4; font-weight:bold;">
            </p>
            <div id="slider-range" class="input-group-text blue lighten-3"></div>
        </div>
        <div class="col-sm-1">
            <div class="input-group md-form form-sm form-2 pl-0">
                <a class="btn searchButton btn-rounded blue lighten-3 btn-sm my-0" type="submit"
                   href="${myURL}">Search</a>
            </div>
        </div>
    </div>
    <table id="eventTable" class="table table-bordered table-sm" width="100%">
        <thead>
        <tr>
            <th class="th-sm">Id</th>
            <th class="th-sm">Name</th>
            <th class="th-sm">Description</th>
            <th class="th-sm">Address</th>
            <th class="th-sm">Price</th>
            <th class="th-sm">Date</th>
            <th class="th-sm">Is Active</th>
            <th class="th-sm">Edit</th>
            <th class="th-sm">Deactivate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${eventList}" var="event">
            <tr>
                <td>${event.id}</td>
                <td>${event.name}</td>
                <td>${event.description}</td>
                <td>${event.location.address}</td>
                <td>$${event.cost}</td>
                <javatime:format value="${event.date}" pattern="yyyy-MM-dd HH:mm" var="parsedDate"/>
                <td>${parsedDate}</td>
                <td>${event.active}</td>
                <td>
                    <a class="btn btn-sm btn-primary btn-rounded" href="editEvent?id=${event.id}">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-sm btn-danger btn-rounded deactivate-event"
                            data-toggle="modal"
                            data-target="#deactivateModal" data-whatever="${event.id}"
                            data-id="deactivateEvent?id=${event.id}">
                        Deactivate
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
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

</body>
</html>