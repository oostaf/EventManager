<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h3>Event List</h3>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Address</th>
        <th>Price</th>
        <th>Date</th>
        <th>Is Active</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${eventList}" var="event">
        <tr>
            <td>${event.id}</td>
            <td>${event.name}</td>
            <td>${event.description}</td>
            <td>${event.address}</td>
            <td>${event.cost}</td>
            <javatime:format value="${event.date}" pattern="yyyy-MM-dd HH:mm" var="parsedDate"/>
            <td>${parsedDate}</td>
            <td>${event.active}</td>
            <td>
                <a href="editProduct?code=${event.id}">Edit</a>
            </td>
            <td>
                <a href="deleteProduct?code=${event.id}">Deactivate</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="createEvent">Create Event</a>


</body>
</html>