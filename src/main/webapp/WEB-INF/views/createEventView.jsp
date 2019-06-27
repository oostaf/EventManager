<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>
    <style>
        textarea {
            width: 300px;
            height: 150px;
        }
    </style>
</head>
<body>


<h3>Create Event</h3>


<form method="POST" action="${pageContext.request.contextPath}/createEvent">
    <table border="0">
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${event.name}"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><textarea type="text" name="description" maxlength="300" value="${event.description}"></textarea></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address" value="${event.address}"/></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" name="price" value="${event.price}"/></td>
        </tr>
        <tr>
            <td>Date</td>
            <td><input type="datetime-local" name="date" value="${event.date}"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Submit"/>
                <a href="eventList">Cancel</a>
            </td>
        </tr>
    </table>
</form>


</body>
</html>
