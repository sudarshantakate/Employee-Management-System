<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Employee Registration Form</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

  <style>
    :root{
      --brand:#0b4dbd;
      --card:#f4f7ff;
      --muted:#666;
      --radius:20px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family:"Inter",sans-serif;
      background:linear-gradient(180deg,#0b4dbd 0%,#0a3fa8 100%);
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:24px;
    }

    .card{
      width:100%;
      max-width:760px;
      background:var(--card);
      border-radius:var(--radius);
      box-shadow:0 14px 40px rgba(3,27,85,0.18);
      padding:36px;
      text-align:center;
    }

    .brand{
      color:var(--brand);
      font-weight:700;
      font-size:26px;
      margin:0 0 8px;
    }
    .lead{
      margin:0 0 24px;
      color:var(--muted);
      font-size:15px;
    }

    form{
      max-width:620px;
      margin:0 auto;
      text-align:left;
    }

    .row{
      display:flex;
      gap:16px;
      flex-wrap:wrap;
      margin-bottom:10px;
    }

    .field{
      flex:1 1 280px;
      display:flex;
      flex-direction:column;
      margin-bottom:14px;
    }

    label{
      font-size:13px;
      font-weight:600;
      color:#163055;
      margin-bottom:8px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"]{
      padding:12px 14px;
      border-radius:12px;
      border:1px solid #e0e6f2;
      outline:none;
      font-size:14px;
    }

    input:focus{
      border-color:var(--brand);
      box-shadow:0 4px 12px rgba(11,77,189,0.08);
    }

    .actions{
      display:flex;
      justify-content:center;
      margin-top:18px;
    }

    button{
      background:var(--brand);
      color:#fff;
      border:none;
      padding:12px 36px;
      font-weight:700;
      border-radius:30px;
      cursor:pointer;
      font-size:15px;
    }

    button:hover{ opacity:0.95; }

    .foot{
      margin-top:20px;
      text-align:center;
      color:var(--muted);
      font-size:13px;
    }
  </style>
</head>

<body>
  <div class="card">
    <h1 class="brand">Employee Registration Form</h1>
    <p class="lead">Create your employee account — it only takes a minute.</p>

    <form action="${pageContext.request.contextPath}/reg" method="post">
      <!-- CSRF token if Spring Security enabled -->
      <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->

      <div class="row">
        <div class="field">
          <label for="empname">Employee Name</label>
          <input id="empname" name="empname" type="text" placeholder="Full name" required>
        </div>

        <div class="field">
          <label for="empUserName">Username</label>
          <input id="empUserName" name="empUserName" type="text" placeholder="username" required>
        </div>
      </div>

      <div class="row">
        <div class="field">
          <label for="empPassword">Password</label>
          <input id="empPassword" name="empPassword" type="password" placeholder="Create a password" required>
        </div>

        <div class="field">
          <label for="empMail">Email</label>
          <input id="empMail" name="empMail" type="email" placeholder="you@company.com" required>
        </div>
      </div>

      <div class="field">
        <label for="empAddress">Address</label>
        <input id="empAddress" name="empAddress" type="text" placeholder="Address, city, postal code" required>
      </div>

      <div class="actions">
        <button type="submit">Register</button>
      </div>

      <p class="foot">Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Log in</a></p>
    </form>
  </div>
</body>
</html>
