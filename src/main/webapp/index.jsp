<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home | Employee Management System</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

  <style>
    :root{
      --bg-top: #0b4dbd;
      --bg-bottom: #083a8e;
      --card: #f4f7ff;
      --accent: #0b4dbd;
      --muted: #69707a;
      --glass: rgba(255,255,255,0.06);
      --radius: 16px;
    }

    *{box-sizing:border-box;margin:0;padding:0}
    html,body{height:100%}
    body{
      font-family:"Inter",system-ui,Segoe UI,Roboto,Arial,sans-serif;
      background: linear-gradient(180deg, var(--bg-top) 0%, var(--bg-bottom) 100%);
      color: #111827;
      min-height:100vh;
      display:flex;
      flex-direction:column;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      overflow-x:hidden;
    }

    /* Floating background shapes */
    .bg-shapes{
      position:fixed;
      inset:0;
      pointer-events:none;
      z-index:0;
      overflow:hidden;
    }
    .shape{
      position:absolute;
      border-radius:50%;
      filter: blur(36px);
      opacity:0.10;
      transform:translate3d(0,0,0);
      animation: float 10s ease-in-out infinite;
    }
    .shape.s1{ width:420px;height:420px; background: #6ee7b7; left:-6%; top:6%; animation-duration:14s }
    .shape.s2{ width:300px;height:300px; background:#60a5fa; right:-10%; top:12%; animation-duration:12s }
    .shape.s3{ width:220px;height:220px; background:#fbcfe8; left:20%; bottom:-6%; animation-duration:16s; opacity:0.07 }
    @keyframes float{
      0%{ transform: translateY(0) }
      50%{ transform: translateY(-26px) }
      100%{ transform: translateY(0) }
    }

    /* NAVBAR */
    .navbar{
      position:relative;
      z-index:5;
      display:flex;
      justify-content:space-between;
      align-items:center;
      padding:18px 36px;
      background: rgba(255,255,255,0.06);
      backdrop-filter: blur(6px);
      border-bottom: 1px solid rgba(255,255,255,0.04);
      box-shadow: 0 6px 18px rgba(2,6,23,0.12);
    }

    .brand{
      display:flex;
      align-items:center;
      gap:12px;
      color:var(--card);
      text-decoration:none;
    }

    .logo {
      width:44px;
      height:44px;
      border-radius:10px;
      background: linear-gradient(135deg, rgba(255,255,255,0.12), rgba(255,255,255,0.02));
      display:flex;
      align-items:center;
      justify-content:center;
      color:var(--accent);
      font-weight:800;
      font-size:18px;
      box-shadow: 0 6px 18px rgba(2,6,23,0.12);
      transform-origin:center;
      transition: transform 280ms ease, box-shadow 280ms ease;
      animation: logo-pulse 2200ms infinite;
    }
    @keyframes logo-pulse{
      0%{ transform: scale(1) }
      50%{ transform: scale(1.04) }
      100%{ transform: scale(1) }
    }
    .brand:hover .logo{ transform: scale(1.06); box-shadow: 0 10px 26px rgba(2,6,23,0.18) }

    .nav-links{
      display:flex;
      align-items:center;
      gap:12px;
    }
    .nav-links a{
      color:var(--card);
      text-decoration:none;
      padding:10px 18px;
      border-radius:14px;
      border: 1px solid rgba(255,255,255,0.06);
      transition: background .18s ease, color .18s ease, transform .12s ease;
      font-weight:600;
      font-size:14px;
    }
    .nav-links a:hover{ background:rgba(255,255,255,0.06); transform:translateY(-2px) }

    /* Main area */
    .main {
      flex:1;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:48px 20px;
      z-index:3;
    }

    .card {
      width:100%;
      max-width:980px;
      background:var(--card);
      border-radius:var(--radius);
      padding:48px;
      box-shadow: 0 30px 80px rgba(2,6,23,0.18);
      position:relative;
      text-align:center;
      transform: translateY(12px);
      opacity:0;
      animation: card-in 640ms cubic-bezier(.2,.9,.3,1) 180ms forwards;
    }
    @keyframes card-in {
      to { transform: translateY(0); opacity:1 }
    }

    .title {
      color:var(--accent);
      font-size:34px;
      font-weight:700;
      letter-spacing:-0.02em;
      margin-bottom:12px;
    }

    .subtitle {
      max-width:820px;
      margin:0 auto 22px;
      color:var(--muted);
      font-size:16px;
      line-height:1.6;
    }

    .cta-row {
      margin-top:18px;
      display:flex;
      gap:12px;
      justify-content:center;
      flex-wrap:wrap;
    }

    .btn {
      padding:12px 28px;
      border-radius:28px;
      font-weight:700;
      font-size:14px;
      text-decoration:none;
      cursor:pointer;
    }
    .btn-primary{
      background:var(--accent);
      color:white;
      border: none;
      box-shadow: 0 10px 30px rgba(11,77,189,0.18);
      transition: transform .16s ease;
    }
    .btn-primary:hover{ transform: translateY(-3px) }
    .btn-outline{
      background:transparent;
      color:var(--accent);
      border:2px solid rgba(11,77,189,0.12);
    }

    /* quick feature list */
    .grid {
      margin-top:30px;
      display:grid;
      grid-template-columns: repeat(auto-fit, minmax(200px,1fr));
      gap:16px;
      text-align:left;
    }
    .feature {
      background: rgba(2,6,23,0.02);
      border-radius:12px;
      padding:14px;
    }
    .feature h4{ margin-bottom:8px; color:#0b4dbd }
    .feature p{ color:var(--muted); font-size:14px; line-height:1.45 }

    /* footer */
    .footer{
      background: transparent;
      color: rgba(255,255,255,0.9);
      padding:18px 36px;
      display:flex;
      justify-content:space-between;
      align-items:center;
      font-size:13px;
      gap:12px;
      z-index:3;
    }
    .footer a{ color: rgba(255,255,255,0.9); text-decoration:none; opacity:0.92 }
    .small { color:rgba(255,255,255,0.85) }

    /* responsive tweaks */
    @media (max-width:880px){
      .card{ padding:28px }
      .title{ font-size:28px }
      .navbar{ padding:14px }
    }
    @media (max-width:560px){
      .nav-links a{ padding:8px 12px; font-size:13px }
      .logo{ width:40px; height:40px; font-size:16px }
    }
  </style>
</head>
<body>

  <!-- Decorative floating shapes -->
  <div class="bg-shapes" aria-hidden="true">
    <div class="shape s1"></div>
    <div class="shape s2"></div>
    <div class="shape s3"></div>
  </div>

  <!-- Navbar -->
  <header class="navbar" role="banner">
    <a class="brand" href="${pageContext.request.contextPath}/">
      <span class="logo">EMS</span>
      <span style="color:var(--card);font-weight:700;font-size:18px">Employee Management</span>
    </a>

    <nav class="nav-links" role="navigation" aria-label="Main navigation">
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Registration</a>
    </nav>
  </header>

  <!-- Main content -->
  <main class="main" role="main">
    <section class="card" aria-labelledby="home-title">
      <h1 id="home-title" class="title">Employee Management System</h1>

      <p class="subtitle">
        A lightweight, secure, and user-friendly system to manage employee records.
        Register employees, update profiles, track attendance & files, and generate reports —
        all from a single centralized dashboard optimized for modern teams.
      </p>

      <div class="cta-row" role="group" aria-label="Quick actions">
        <a class="btn btn-primary" href="register.jsp">Get Started (Register)</a>
        <a class="btn btn-outline" href="login.jsp">Sign In</a>
      </div>

      <div class="grid" aria-hidden="false">
        <div class="feature">
          <h4>Simple Registration</h4>
          <p>Fast employee sign-up with validation and secure password handling.</p>
        </div>

        <div class="feature">
          <h4>Profile Management</h4>
          <p>Edit employee details, upload documents, and track updates from a central view.</p>
        </div>

        <div class="feature">
          <h4>Role & Permissions</h4>
          <p>Grant role-based access for admin, manager and staff — secure and auditable.</p>
        </div>

        <div class="feature">
          <h4>Reports & Export</h4>
          <p>Generate employee lists, export CSV files, and review historical changes.</p>
        </div>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer class="footer" role="contentinfo">
    <div class="small">© ${pageContext.request.contextPath != null ? pageContext.request.contextPath : ''} Employee Management System — 2025</div>
    <div>
      <a href="${pageContext.request.contextPath}/">Home</a> ·
      <a href="register.jsp">Register</a> ·
      <a href="login.jsp">Login</a>
    </div>
  </footer>

  <!-- A tiny script to improve accessibility focus behaviour -->
  <script>
    (function(){
      // Ensure keyboard users can see :focus outline
      document.addEventListener('keydown', function(e){
        if(e.key === 'Tab') document.documentElement.classList.add('show-focus');
      }, { once: true });

      // small safe fallback for requestAnimationFrame related effects (no animation libs used)
      // nothing required here, animations purely CSS-driven
    })();
  </script>
</body>
</html>
