<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Employee Management</title>

<style>
body{
    margin:0;
    font-family:"Segoe UI", Arial, sans-serif;
    background:#f2f4f7;
}

/* HERO */
.hero{
    background:#3f5870;
    color:white;
    padding:70px 20px;
    text-align:center;
}

.hero h1{
    font-size:36px;
    margin-bottom:10px;
}

.hero p{
    font-size:15px;
    opacity:0.9;
}

/* CARDS */
.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
    gap:25px;
    padding:40px 60px;
    margin-top:-30px;
}

.card{
    background:#f8f9fa;
    border-radius:10px;
    padding:25px;
    text-align:center;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

.card h3{
    margin-bottom:10px;
    color:#333;
}

.card p{
    font-size:14px;
    color:#666;
    margin-bottom:15px;
}

.btn{
    display:inline-block;
    padding:6px 14px;
    border-radius:5px;
    text-decoration:none;
    color:white;
    font-size:14px;
}

.btn-add{ background:#4c6ef5; }
.btn-search{ background:#2f9e44; }
.btn-update{ background:#f1c40f; color:#000; }
.btn-remove{ background:#e03131; }

.btn:hover{ opacity:0.9; }
</style>
</head>

<body>

<!-- INCLUDE NAVBAR -->
<jsp:include page="Navbar.jsp"/>

<!-- HERO -->
<div class="hero">
    <h1>Welcome to the Employee Management System</h1>
    <p>Easily manage employee data — add, search, update, and remove records.</p>
</div>

<!-- CARDS -->
<div class="cards">

    <div class="card">
        <h3>Add Employee</h3>
        <p>Create a new employee record.</p>
        <a href="addEmployee" class="btn btn-add">Add</a>
    </div>

    <div class="card">
        <h3>Search Employee</h3>
        <p>Find employee details easily.</p>
        <a href="search" class="btn btn-search">Search</a>
    </div>

    <div class="card">
        <h3>Update Info</h3>
        <p>Modify employee data as needed.</p>
        <a href="update" class="btn btn-update">Update</a>
    </div>

    <div class="card">
        <h3>Remove Employee</h3>
        <p>Delete a record from the system.</p>
        <a href="removeEmployee" class="btn btn-remove">Remove</a>
    </div>

</div>

</body>
</html>
