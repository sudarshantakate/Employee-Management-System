<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login | Employee Management System</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

  <style>
    :root{
      --bg-top: #0b4dbd;
      --bg-bottom: #083a8e;
      --card: #f4f7ff;
      --accent: #0b4dbd;
      --muted: #69707a;
      --radius: 16px;
    }
    *{box-sizing:border-box;margin:0;padding:0}
    html,body{height:100%}
    body{
      font-family:"Inter",system-ui,Arial,sans-serif;
      background: linear-gradient(180deg,var(--bg-top),var(--bg-bottom));
      color:#111827;
      min-height:100vh;
      display:flex;
      flex-direction:column;
    }

    .navbar{
      display:flex;
      justify-content:space-between;
      align-items:center;
      padding:14px 28px;
      background: rgba(255,255,255,0.04);
      border-bottom: 1px solid rgba(255,255,255,0.04);
      z-index:5;
    }
    .brand{ display:flex; align-items:center; gap:10px; text-decoration:none; color:var(--card); font-weight:700 }
    .logo {
      width:40px; height:40px; border-radius:10px;
      display:flex; align-items:center; justify-content:center;
      background: linear-gradient(135deg, rgba(255,255,255,0.08), rgba(255,255,255,0.02));
      color:var(--accent); font-weight:800;
    }
    .nav-links a{
      color:var(--card); text-decoration:none; padding:8px 14px; border-radius:12px; font-weight:600; margin-left:10px;
      border:1px solid rgba(255,255,255,0.04);
    }

    .main {
      flex:1;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:36px 16px;
    }

    .card {
      width:100%;
      max-width:520px;
      background:var(--card);
      border-radius:var(--radius);
      padding:34px;
      text-align:center;
      box-shadow: 0 30px 80px rgba(2,6,23,0.18);
      transform: translateY(8px);
    }

    .title { color:var(--accent); font-size:24px; font-weight:700; margin-bottom:6px; }
    .subtitle { color:var(--muted); font-size:14px; margin-bottom:18px; }

    form { text-align:left; max-width:420px; margin:0 auto; }

    .field { display:flex; flex-direction:column; margin-bottom:14px; }
    label { font-size:13px; color:#163055; font-weight:600; margin-bottom:8px; }
    input[type="text"], input[type="password"]{
      padding:12px 14px; border-radius:12px; border:1px solid #e6ecf8; font-size:14px; background:#fff;
    }

    .row { display:flex; align-items:center; justify-content:space-between; gap:12px; margin-top:6px; }

    .btn {
      width:100%;
      margin-top:12px;
      padding:12px 16px;
      border-radius:28px;
      font-weight:700;
      background:var(--accent);
      color:#fff;
      border:none;
      cursor:pointer;
      font-size:15px;
    }

    .links { margin-top:12px; display:flex; justify-content:space-between; font-size:13px; color:var(--muted); }

    .error { color:#b91c1c; font-size:13px; margin-top:8px; display:none }
  </style>
</head>
<body>

  <header class="navbar" role="banner">
    <a class="brand" href="${pageContext.request.contextPath}/">
      <span class="logo">EMS</span>
      <span>Employee Management</span>
    </a>
    <nav class="nav-links">
      <a href="register.jsp">Register</a>
    </nav>
  </header>

  <main class="main">
    <section class="card">
      <h2 class="title">Employee Login</h2>
      <p class="subtitle">Enter your credentials to access the employee dashboard.</p>

      <!-- IMPORTANT CHANGE: Form now posts to Spring controller -->
      <form id="loginForm" action="${pageContext.request.contextPath}/loginForm" method="post" novalidate>

        <div class="field">
          <label for="username">Username or Email</label>
          <input id="username" name="username" type="text" placeholder="username or email" required>
        </div>

        <div class="field">
          <label for="password">Password</label>
          <input id="password" name="password" type="password" placeholder="your password" required>
        </div>

        <div class="row">
          <label><input type="checkbox" name="remember" /> Remember me</label>
          <a href="${pageContext.request.contextPath}/forgot" style="color:var(--accent); font-weight:600;">Forgot?</a>
        </div>

        <button type="submit" class="btn">Sign in</button>

        <div class="links">
          <div>Don't have an account? <a href="register.jsp">Register</a></div>
          <div>Need help? <a href="${pageContext.request.contextPath}/support">Contact</a></div>
        </div>

        <!-- SERVER ERROR MESSAGE -->
        <c:if test="${not empty errorMsg}">
          <div class="error" style="display:block;">${errorMsg}</div>
        </c:if>

        <!-- CLIENT VALIDATION ERROR -->
        <div id="err" class="error">Please fill in both fields.</div>

      </form>
    </section>
  </main>

  <script>
    (function(){
      const form = document.getElementById('loginForm');
      const err = document.getElementById('err');

      form.addEventListener('submit', function(e){
        const u = form.username.value.trim();
        const p = form.password.value.trim();
        if(!u || !p){
          e.preventDefault();
          err.style.display = 'block';
          return false;
        }
      });
    })();
  </script>

</body>
</html>
