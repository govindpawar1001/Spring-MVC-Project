<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>

<style>
body{
    margin:0;
    font-family:"Segoe UI", Arial;
    background:#f2f4f7;
}
.container{
    max-width:450px;
    background:#fff;
    margin:60px auto;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}
h2{text-align:center;margin-bottom:20px;}
input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:5px;
}
button{
    width:100%;
    padding:10px;
    background:#4c6ef5;
    border:none;
    color:#fff;
    font-size:15px;
    border-radius:5px;
}
</style>
</head>

<body>
<jsp:include page="Navbar.jsp"/>

<div class="container">
<h2>Add Employee</h2>
<form action="./addEmployee" method="post">
    <input type="text" name="name" placeholder="Employee Name" class="name" required>
    <input type="email" name="email" placeholder="Email" class="email" required>
    <input type="text" name="department" placeholder="Department" class="department" required>
    <input type="number" name="salary" placeholder="Salary" class="salary" required>
    <button>Add Employee</button>
</form>
</div>

</body>
</html>
