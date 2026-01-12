<%@page import="com.linkcode.in.springMVC.POJO.EmployeePOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Employee</title>

<style>
body{margin:0;font-family:"Segoe UI";background:#f2f4f7;}
.container{
    max-width:600px;
    margin:80px auto;
    background:#fff;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
    text-align:center;
}
input,button{
    width:100%;
    padding:10px;
    margin-top:10px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input[type="number"] {
    -moz-appearance: textfield;
}
button{
    background:#007bff;
    border:none;
    color:white;
    border-radius:5px;
}
.msg{
    margin-top:10px;
    font-weight:bold;
}
.error{
    color:red;
}
.success{
    color:green;
}
.result{
    width:100%;
    margin-top:20px;
    border-collapse:collapse;
    border-radius:8px;
    overflow:hidden;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}
.result th,.result td{
    padding:15px 12px;
    text-align:center;
    border:none;
}
.result th{
    background:#007bff;
    color:white;
    font-weight:600;
    font-size:14px;
    text-transform:uppercase;
    letter-spacing:0.5px;
}
.result td{
    background:#e3f2fd;
    color:#333;
    font-size:14px;
    border-bottom:1px solid #f0f0f0;
}
.result tr:hover td{
    background:#bbdefb;
}
.result tbody tr{
    background:#e3f2fd;
}

</style>
</head>

<body>
<jsp:include page="/WEB-INF/Views/Navbar.jsp"/>
<% EmployeePOJO emp=(EmployeePOJO)request.getAttribute("emp");
String msg=(String) request.getAttribute("msg");%>

<div class="container">
<h2>Search Employee</h2>
<form action="./search" method="post">
    <input type="number" name="id" placeholder="Enter Employee ID" required>
    <button>Search</button>
    
    
    <% if(msg!=null){%>
    
<h3 class="msg <%= emp != null ? "success" : "error" %>"><%=msg %></h3>
    
   <%} %> 
   
   <%if(emp!=null){ %>
   <table class="result">
  <thead>
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Email</th>
    <th>Department</th>
    <th>Salary</th>
</tr>
</thead>

<tbody>
<tr>
    <td><%=emp.getId() %></td>
    <td><%=emp.getName() %></td>
    <td><%=emp.getEmail() %></td>
    <td><%=emp.getDepartment() %></td>
    <td><%=emp.getSalary() %></td>
</tr>
</tbody>

   </table>
   
   <%} %>
   
</form>
</div>

</body>
</html>
