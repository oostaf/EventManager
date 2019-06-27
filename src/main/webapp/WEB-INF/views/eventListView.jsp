<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event List</title>
</head>
<body>

<h3>Event List</h3>

<table border="1" cellpadding="5" cellspacing="1" >
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Address</th>
        <th>Price</th>
        <th>Date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${eventList}" var="event" >
        <tr>
            <td>${event.id}</td>
            <td>${event.name}</td>
            <td>${event.description}</td>
            <td>${event.address}</td>
            <td>${event.cost}</td>
            <td>${event.date}</td>
            <td>
                <a href="editProduct?code=${event.id}">Edit</a>
            </td>
            <td>
                <a href="deleteProduct?code=${event.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="createProduct" >Create Product</a>


</body>
</html>