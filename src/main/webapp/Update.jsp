<%@ page import="com.entity.Employee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<title>Update Employee</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<style>
:root{
  --brand:#0b4dbd;
  --muted:#6b7280;
  --bg:#f3f6fb;
  --card:#ffffff;
  --radius:12px;
}

*{ box-sizing:border-box; }

body{
  margin:0;
  min-height:100vh;
  display:flex;
  align-items:center;
  justify-content:center;
  font-family:system-ui, -apple-system, "Segoe UI", Roboto, Arial;
  background:
    radial-gradient(1200px 400px at 10% -10%, #e6eeff 0%, transparent 60%),
    radial-gradient(900px 400px at 90% 110%, #edf1ff 0%, transparent 60%),
    var(--bg);
  padding:24px;
}

.card{
  width:100%;
  max-width:520px;
  background:var(--card);
  border-radius:var(--radius);
  box-shadow:0 20px 45px rgba(2,6,23,0.12);
  padding:26px 28px 30px;
}

.card h2{
  margin:0 0 18px;
  color:var(--brand);
  font-size:22px;
  text-align:center;
}

.form-grid{
  display:grid;
  grid-template-columns:1fr;
  gap:14px;
}

.field label{
  display:block;
  font-size:13px;
  font-weight:700;
  color:#374151;
  margin-bottom:4px;
}

.field input{
  width:100%;
  padding:11px 12px;
  border-radius:8px;
  border:1px solid #dbe3f4;
  font-size:14px;
  transition:.2s;
}

.field input:focus{
  outline:none;
  border-color:var(--brand);
  box-shadow:0 0 0 3px rgba(11,77,189,.12);
}

.field input[readonly]{
  background:#f7f9ff;
  color:#555;
}

.actions{
  margin-top:18px;
  display:flex;
  justify-content:flex-end;
  gap:10px;
}

.btn{
  padding:11px 18px;
  border-radius:9px;
  border:none;
  font-weight:800;
  cursor:pointer;
  font-size:14px;
}

.btn-primary{
  background:var(--brand);
  color:#fff;
}

.btn-primary:hover{
  filter:brightness(1.05);
}
</style>
</head>

<body>

<%
  Employee emp = (Employee) request.getAttribute("emp");
%>

<div class="card">
  <h2>Update Employee</h2>

  <form action="updateEmployee" method="post">

    <!-- Employee ID -->
    <div class="field">
      <label>Employee ID</label>
      <input type="number" name="empId" value="<%= emp.getEmpId() %>" readonly>
    </div>

    <div class="form-grid">

      <div class="field">
        <label>Name</label>
        <input type="text" name="empname" value="<%= emp.getEmpname() %>">
      </div>

      <div class="field">
        <label>Username</label>
        <input type="text" name="empUserName" value="<%= emp.getEmpUserName() %>">
      </div>

      <div class="field">
        <label>Password</label>
        <input type="text" name="empPassword" value="<%= emp.getEmpPassword() %>">
      </div>

      <div class="field">
        <label>Email</label>
        <input type="email" name="empMail" value="<%= emp.getEmpMail() %>" readonly>
      </div>

      <div class="field">
        <label>Address</label>
        <input type="text" name="empAddress" value="<%= emp.getEmpAddress() %>">
      </div>

    </div>

    <div class="actions">
      <button type="submit" class="btn btn-primary">Update Employee</button>
    </div>

  </form>
</div>

</body>
</html>
