<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Success</title>
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
  <style>
    :root{
      --brand: #0b4dbd;
      --card: #f4f7ff;
      --muted: #6b7280;
      --radius: 20px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family:"Inter",system-ui,Arial,sans-serif;
      background: linear-gradient(180deg,#0b4dbd 0%, #083a8e 100%);
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:24px;
    }

    .card{
      width:100%;
      max-width:720px;
      background:var(--card);
      border-radius:var(--radius);
      padding:36px;
      text-align:center;
      box-shadow: 0 18px 50px rgba(2,24,71,0.18);
      position:relative;
      overflow:visible;
    }

    h1{ color:var(--brand); margin:0 0 8px; font-size:28px; font-weight:700 }
    .message{ color:#163055; font-size:18px; margin:12px 0 18px }
    .sub{ color:var(--muted); margin-bottom:22px }

    .actions { display:flex; gap:12px; justify-content:center; margin-top:14px }
    .btn {
      display:inline-block; padding:12px 26px; border-radius:26px; font-weight:700; text-decoration:none;
    }
    .btn-primary{ background:var(--brand); color:#fff }
    .btn-outline{ background:transparent; border:2px solid rgba(11,77,189,0.14); color:var(--brand) }

    /* CENTER STAGE: popper + tick */
    .celebrate {
      position:absolute;
      left:50%;
      top:-72px;
      transform:translateX(-50%);
      width:160px;
      height:160px;
      pointer-events:none;
      display:flex;
      align-items:center;
      justify-content:center;
      z-index:20;
    }

    /* popper circle that expands then fades */
    .popper {
      width:70px; height:70px; border-radius:50%;
      background: radial-gradient(circle at 30% 30%, #ffefc2 0%, #ffd166 30%, transparent 60%);
      box-shadow: 0 8px 30px rgba(11,77,189,0.08);
      transform-origin:center;
      opacity:0;
      animation: pop-in 700ms ease-out forwards;
    }

    @keyframes pop-in {
      0% { transform: scale(.2) rotate(-10deg); opacity:0 }
      40% { transform: scale(1.15) rotate(6deg); opacity:1 }
      100% { transform: scale(1) rotate(0deg); opacity:0.98 }
    }

    /* burst rays */
    .ray { position:absolute; width:8px; height:28px; background:linear-gradient(#ffd166,#ff7ca3); top:6px; left:50%; transform-origin:center bottom; border-radius:6px; opacity:0; }
    .ray.r1 { transform: translateX(-50%) rotate(0deg); animation: ray-pop .9s ease-out .06s forwards }
    .ray.r2 { transform: translateX(-50%) rotate(36deg); animation: ray-pop .9s ease-out .08s forwards }
    .ray.r3 { transform: translateX(-50%) rotate(72deg); animation: ray-pop .9s ease-out .10s forwards }
    .ray.r4 { transform: translateX(-50%) rotate(108deg); animation: ray-pop .9s ease-out .12s forwards }
    .ray.r5 { transform: translateX(-50%) rotate(144deg); animation: ray-pop .9s ease-out .14s forwards }
    .ray.r6 { transform: translateX(-50%) rotate(180deg); animation: ray-pop .9s ease-out .16s forwards }
    .ray.r7 { transform: translateX(-50%) rotate(216deg); animation: ray-pop .9s ease-out .18s forwards }
    .ray.r8 { transform: translateX(-50%) rotate(252deg); animation: ray-pop .9s ease-out .20s forwards }
    .ray.r9 { transform: translateX(-50%) rotate(288deg); animation: ray-pop .9s ease-out .22s forwards }
    .ray.r10 { transform: translateX(-50%) rotate(324deg); animation: ray-pop .9s ease-out .24s forwards }

    @keyframes ray-pop {
      0% { transform: translateX(-50%) rotate(var(--rot,0deg)) scaleY(.1); opacity:0 }
      60% { transform: translateX(-50%) rotate(var(--rot,0deg)) scaleY(1.1); opacity:1 }
      100% { transform: translateX(-50%) rotate(var(--rot,0deg)) scaleY(1); opacity:0.95 }
    }

    /* animated confetti (container) */
    .confetti {
      position:absolute;
      left:50%; top:28px;
      width: 360px; height: 240px;
      transform: translateX(-50%);
      pointer-events:none;
      overflow:visible;
      z-index:15;
    }

    /* tick (svg) */
    .tick {
      width:92px; height:92px; display:block;
      transform: scale(0);
      opacity:0;
      transition: transform 420ms cubic-bezier(.2,.9,.3,1), opacity 200ms;
      filter: drop-shadow(0 8px 20px rgba(2,24,71,0.14));
    }
    .tick.show {
      transform: scale(1);
      opacity:1;
    }

    /* little bounce */
    .tick.pulse {
      animation: pulse 1200ms ease infinite 500ms;
      transform-origin:center;
    }
    @keyframes pulse {
      0% { transform: scale(1) }
      50% { transform: scale(1.06) }
      100% { transform: scale(1) }
    }

    /* message fade */
    .card .message, .card .sub, .actions { opacity:0; transform: translateY(8px); transition: all 420ms ease; }
    .card.show .message, .card.show .sub, .card.show .actions { opacity:1; transform: translateY(0) }

    /* small responsive tweak */
    @media (max-width:540px) {
      .celebrate { top:-60px; transform:translateX(-50%) scale(.9) }
      .confetti { width:260px; height:160px }
    }
  </style>
</head>
<body>
  <div class="card" id="card">
    <!-- celebration elements live at the top-center of the card -->
    <div class="celebrate" id="celebrate" aria-hidden="true">
      <div class="confetti" id="confetti"></div>

      <div class="popper" id="popper" aria-hidden="true"></div>

      <!-- rays -->
      <div class="ray r1"></div>
      <div class="ray r2"></div>
      <div class="ray r3"></div>
      <div class="ray r4"></div>
      <div class="ray r5"></div>
      <div class="ray r6"></div>
      <div class="ray r7"></div>
      <div class="ray r8"></div>
      <div class="ray r9"></div>
      <div class="ray r10"></div>

      <!-- check tick SVG (hidden at first) -->
      <svg class="tick" id="tick" viewBox="0 0 64 64" aria-hidden="true" role="img">
        <defs>
          <linearGradient id="g" x1="0" x2="1">
            <stop offset="0" stop-color="#6ee7b7"></stop>
            <stop offset="1" stop-color="#06b6d4"></stop>
          </linearGradient>
        </defs>
        <circle cx="32" cy="32" r="30" fill="url(#g)" />
        <path d="M18 34 L28 44 L46 20" fill="none" stroke="#fff" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>

    <h1>Success!</h1>

    <p class="message" id="msg">
      ${message != null ? message : 'Your information has been saved successfully.'}
    </p>

    <p class="sub">You can now log in or return to the homepage.</p>

    <div class="actions" id="actions">
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Go to Login</a>
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/">Home</a>
    </div>
  </div>

  <script>
    // small confetti system (vanilla JS) - creates many DOM pieces and animates them
    (function(){
      const confettiContainer = document.getElementById('confetti');
      const tick = document.getElementById('tick');
      const popper = document.getElementById('popper');
      const card = document.getElementById('card');

      function rand(min, max){ return Math.random() * (max - min) + min; }

      // create confetti pieces
      function spawnConfetti(amount){
        const colors = ['#ff7ca3','#ffd166','#6ee7b7','#06b6d4','#8b5cf6'];
        for(let i=0;i<amount;i++){
          const el = document.createElement('div');
          el.className = 'c';
          const size = Math.floor(rand(6, 12));
          el.style.width = size + 'px';
          el.style.height = (size*1.6) + 'px';
          el.style.background = colors[Math.floor(rand(0, colors.length))];
          el.style.position = 'absolute';
          el.style.left = (confettiContainer.clientWidth/2) + 'px';
          el.style.top = (confettiContainer.clientHeight/2) + 'px';
          el.style.opacity = 0.95;
          el.style.borderRadius = Math.random() > .5 ? '2px' : '50%';
          confettiContainer.appendChild(el);

          // animate each piece using requestAnimationFrame
          const angle = rand(-Math.PI, Math.PI);
          const velocity = rand(2, 7);
          const gravity = 0.15 + Math.random() * 0.12;
          const rotateSpeed = rand(-0.2, 0.2);
          let vx = Math.cos(angle) * velocity;
          let vy = Math.sin(angle) * velocity;
          let x = confettiContainer.clientWidth/2;
          let y = confettiContainer.clientHeight/2;
          let rot = rand(0,360);

          (function animate(){
            vy += gravity;
            x += vx;
            y += vy;
            rot += rotateSpeed * 10;
            el.style.transform = `translate(${x}px, ${y}px) rotate(${rot}deg)`;
            el.style.opacity = 1 - (y / (confettiContainer.clientHeight*2));
            if(y < confettiContainer.clientHeight*2){
              requestAnimationFrame(animate);
            } else {
              // remove after animation ends
              el.remove();
            }
          })();
        }
      }

      // orchestrate sequence on page load
      window.addEventListener('load', function(){
        // reveal card contents slightly after animations start
        setTimeout(()=> card.classList.add('show'), 250);

        // burst popper + rays instantly
        popper.classList.add('pop-active');

        // spawn confetti after tiny delay
        setTimeout(()=> spawnConfetti(36), 120);

        // show tick after 420ms (scale in)
        setTimeout(()=> {
          tick.classList.add('show');
          tick.classList.add('pulse');
        }, 420);

        // optionally remove celebration after a while to keep DOM clean
        setTimeout(()=> {
          const celeb = document.getElementById('celebrate');
          if(celeb) celeb.style.transition = 'opacity .8s'; celeb.style.opacity = '0';
          // keep messages visible
        }, 3800);
      });
    })();
  </script>
</body>
</html>
