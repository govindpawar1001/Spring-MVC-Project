<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>

<style>
body{margin:0;font-family:"Segoe UI";background:#f2f4f7;}
.container{
    max-width:450px;
    background:#fff;
    margin:60px auto;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}
input,button{
    width:100%;
    padding:10px;
    margin-top:10px;
    border:1px solid #ddd;
    border-radius:5px;
}
button{
    background:#f1c40f;
    border:none;
    cursor:pointer;
}
button:hover{background:#f39c12;}
.msg{color:red;margin-top:10px;}
.success{color:green;}
</style>
</head>

<body>
<jsp:include page="Navbar.jsp"/>

<div class="container">
<h2>Update Employee</h2>

<c:if test="${empty emp}">
<form action="searchUpdate" method="post">
    <input type="number" name="id" placeholder="Enter Employee ID" required>
    <button type="submit">Search Employee</button>
</form>
</c:if>

<c:if test="${not empty emp}">
<form action="update" method="post">
    <input type="hidden" name="id" value="${emp.id}">
    <input type="text" name="name" value="${emp.name}" placeholder="Name" required>
    <input type="email" name="email" value="${emp.email}" placeholder="Email" required>
    <input type="text" name="designation" value="${emp.department}" placeholder="Department" required>
    <input type="number" name="salary" value="${emp.salary}" step="0.01" placeholder="Salary" required>
    <button type="submit">Update Employee</button>
</form>
</c:if>

<c:if test="${not empty msg}">
    <div class="msg">${msg}</div>
</c:if>

</div>

</body>
</html>
