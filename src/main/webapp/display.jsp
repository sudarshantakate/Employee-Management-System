<%@ page import="com.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee List | EMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
:root{
  --blue1:#1e5fd8;
  --blue2:#1b56c6;
  --blue3:#164bb1;
  --card:#ffffff;
  --muted:#6b7280;
  --radius:12px;
}

*{box-sizing:border-box}

body{
  margin:0;
  font-family:system-ui,Segoe UI,Roboto,Arial;
  background:#f3f6fb;
  color:#111827;
}

/* ================= NAVBAR ================= */
.navbar{
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:18px 36px;
  background:linear-gradient(180deg,var(--blue1),var(--blue2),var(--blue3));
  box-shadow:0 6px 18px rgba(2,6,23,0.25);
}

.brand{
  display:flex;
  align-items:center;
  gap:12px;
  text-decoration:none;
  color:#fff;
}

.logo{
  width:42px;
  height:42px;
  border-radius:10px;
  background:rgba(255,255,255,0.15);
  display:flex;
  align-items:center;
  justify-content:center;
  font-weight:800;
}

.nav-links{
  display:flex;
  gap:12px;
}

.nav-links a{
  color:#fff;
  text-decoration:none;
  padding:10px 20px;
  border-radius:999px;
  background:rgba(255,255,255,0.15);
  font-weight:600;
  transition:background .2s ease, transform .15s ease;
}

.nav-links a:hover{
  background:rgba(255,255,255,0.25);
  transform:translateY(-1px);
}

/* ================= CONTENT ================= */
.wrapper{
  max-width:1100px;
  margin:32px auto;
  background:var(--card);
  border-radius:var(--radius);
  padding:22px;
  box-shadow:0 12px 32px rgba(2,6,23,0.08);
}

h2{
  margin:0 0 16px;
  color:var(--blue1);
}

/* table */
.table-wrap{overflow-x:auto}

table{
  width:100%;
  border-collapse:collapse;
  min-width:880px;
}

thead th{
  padding:14px;
  background:#f6f9ff;
  color:var(--blue1);
  font-weight:700;
  border-bottom:1px solid #e6eefb;
}

tbody td{
  padding:13px 14px;
  border-bottom:1px solid #eef4fb;
}

tbody tr:hover{background:#fbfdff}

.radio-col{text-align:center;width:70px}

/* actions */
.actions{
  display:flex;
  justify-content:flex-end;
  gap:12px;
  margin-top:18px;
}

.btn{
  padding:10px 20px;
  border:none;
  border-radius:8px;
  font-weight:700;
  cursor:pointer;
}

.btn-update{
  background:var(--blue1);
  color:#fff;
}

.btn-delete{
  background:#ef4444;
  color:#fff;
}

.hint{
  margin-top:10px;
  font-size:13px;
  color:var(--muted);
}
</style>

<script>
function getSelectedId(){
  let radios=document.querySelectorAll("input[name='empId']");
  for(let r of radios){ if(r.checked) return r.value; }
  return null;
}

function doAction(url,msg){
  let id=getSelectedId();
  if(!id){
    alert("Please select an employee first.");
    return;
  }
  if(msg && !confirm(msg)) return;
  document.empForm.action=url;
  document.empForm.method="post";
  document.empForm.submit();
}

function updateEmp(){
  doAction("updateEmp","Do you want to update this employee?");
}

function deleteEmp(){
  doAction("deleteEmp","Do you want to DELETE this employee?");
}
</script>
</head>

<body>

<!-- ================= NAVBAR ================= -->
<header class="navbar">
  <a class="brand" href="${pageContext.request.contextPath}/">
    <span class="logo">EMS</span>
    <span style="font-size:18px;font-weight:700;">Employee Management</span>
  </a>

  <nav class="nav-links">
    <a href="${pageContext.request.contextPath}/">Home</a>
    <a href="register.jsp">Registration</a>
  </nav>
</header>

<!-- ================= CONTENT ================= -->
<div class="wrapper">
<h2>Employee List</h2>

<div class="table-wrap">
<form name="empForm" id="empForm">

<table>
<thead>
<tr>
  <th class="radio-col">Select</th>
  <th>Employee ID</th>
  <th>Name</th>
  <th>Username</th>
  <th>Password</th>
  <th>Email</th>
  <th>Address</th>
</tr>
</thead>

<tbody>
<%
List<Employee> list=(List<Employee>)request.getAttribute("data");
if(list==null || list.isEmpty()){
%>
<tr>
  <td colspan="7" style="text-align:center;padding:26px;">
    No Employee Records Found.
  </td>
</tr>
<%
}else{
for(Employee emp:list){
%>
<tr>
  <td class="radio-col">
    <input type="radio" name="empId" value="<%=emp.getEmpId()%>">
  </td>
  <td><%=emp.getEmpId()%></td>
  <td><%=emp.getEmpname()%></td>
  <td><%=emp.getEmpUserName()%></td>
  <td><%=emp.getEmpPassword()%></td>
  <td><%=emp.getEmpMail()%></td>
  <td><%=emp.getEmpAddress()%></td>
</tr>
<%
}} %>
</tbody>
</table>

<div class="actions">
  <button type="button" class="btn btn-update" onclick="updateEmp()">Update</button>
  <button type="button" class="btn btn-delete" onclick="deleteEmp()">Delete</button>
</div>

<p class="hint">Select an employee and click Update or Delete.</p>

</form>
</div>
</div>

</body>
</html>
