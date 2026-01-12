<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.navbar{
    background:#ffffff;
    height:60px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 50px;
    box-shadow:0 2px 6px rgba(0,0,0,0.1);
}

.logo{
    font-size:22px;
    font-weight:600;
    color:#333;
}

.nav-links a{
    margin-left:25px;
    text-decoration:none;
    color:#555;
    font-size:15px;
    font-weight:500;
}

.nav-links a:hover{
    color:#000;
}
</style>

<div class="navbar">
    <div class="logo">Linkcode</div>
    <div class="nav-links">
        <a href="home">Home</a>
        <a href="addEmployee">Add</a>
        <a href="search">Search</a>
        
        <a href="update">Update</a>
        <a href="removeEmployee">Remove</a>
        <a href="create">Logout</a>
    </div>
</div>
