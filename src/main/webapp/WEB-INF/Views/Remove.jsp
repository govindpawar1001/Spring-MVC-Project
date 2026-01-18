<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.linkcode.in.springMVC.POJO.EmployeePOJO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Employee</title>
<style>
body {
	margin: 0;
	font-family: "Segoe UI";
	background: #f2f4f7;
}

.container {
	max-width: 800px;
	background: #fff;
	margin: 50px auto;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.form-section {
	text-align: center;
	margin-bottom: 30px;
}

input, button {
	padding: 10px;
	margin: 5px;
}

input[type=number]::-webkit-outer-spin-button, input[type=number]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input[type=number] {
	-moz-appearance: textfield;
}

button {
	background: #e03131;
	border: none;
	color: white;
	border-radius: 5px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background: #f8f9fa;
}

.msg {
	margin: 15px 0;
	padding: 10px;
	border-radius: 5px;
	background: #d4edda;
	color: #155724;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />

	<div class="container">
		<div class="form-section">
			<h2>Remove Employee</h2>
			<form action="remove" method="post">
				<input type="number" name="id" placeholder="Employee ID" required>
				<button type="submit">Delete</button>
			</form>

			<%
			if (request.getAttribute("msg") != null) {
				String msg = (String) request.getAttribute("msg");
				String bgColor = msg.contains("not found") ? "#f8d7da" : "#d4edda";
				String textColor = msg.contains("not found") ? "#721c24" : "#155724";
			%>
			<div class="msg"
				style="background:<%=bgColor%>;color:<%=textColor%>"><%=msg%></div>
			<%
			}
			%>
		</div>

		<h3>All Employees</h3>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Department</th>
				<th>Salary</th>
			</tr>
			<%
			List<EmployeePOJO> employees = (List<EmployeePOJO>) request.getAttribute("employees");
			if (employees != null) {
				for (EmployeePOJO emp : employees) {
			%>
			<tr>
				<td><%=emp.getId()%></td>
				<td><%=emp.getName()%></td>
				<td><%=emp.getEmail()%></td>
				<td><%=emp.getDepartment()%></td>
				<td><%=emp.getSalary()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>
</body>
</html>
