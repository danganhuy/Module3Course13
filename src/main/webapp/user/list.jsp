<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        #user-data {
            margin: 30px auto;
            width: fit-content;
            box-shadow: 0 0 10px rgba(60, 60, 150, 0.75);
            padding: 15px;
            border-radius: 10px;
        }
        #user-table {
            margin: auto;
            border-collapse: collapse;
            font-size: 18px;
        }
        #user-table td, th {
            border-style: solid;
            border-width: 2px;
            border-color: blue;
            padding: 15px 20px;
        }
        #user-table th {
            background-color: #a5a0ff;
        }
        #user-table tr:nth-child(odd) {
            background-color: #d7e3ff;
        }
        .search-container {
            background-color: white;
            margin: 30px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .search-container h1 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            color: #333;
        }

        .search-container form {
            display: flex;
            align-items: center;
        }

        .search-container input[type="text"] {
            flex: 1;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-container button {
            padding: 10px 20px;
            margin-left: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <center>
        <h1>User Management</h1>
        <h2>
            <a href="/users?action=create">Add New User</a>
        </h2>
    </center>

    <div class="search-container">
        <form action="/users" method="get">
            <input type="text" name="country" placeholder="Type country">
            <button type="submit" name="action" value="search">Search</button>
        </form>
    </div>
    <div id="user-data">
        <table id="user-table">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <a href="/users?action=edit&id=${user.id}">Edit</a>
                        <a href="/users?action=delete&id=${user.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>