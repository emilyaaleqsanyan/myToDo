<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration or Sign Up form in HTML CSS | CodingLab </title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/main.js"></script>
    <title>Register</title>
</head>
<body>
<div class="wrapper">
                <% if (session.getAttribute("msg") != null) {%>
                <span style="color: red"><%=session.getAttribute("msg")%></span>
                <% session.removeAttribute("msg");%>
                <%}%><br>
                <h2>Registration</h2>

                <form action="/register" method="post">
                    <div class="input-box">
                        <input type="text" name="name" placeholder="Enter your name" required>
                    </div>

                    <div class="input-box">
                        <input type="text" name="surname" placeholder="Enter your surname" required>
                    </div>
                    <div class="input-box">
                        <input type="text" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="input-box">
                        <input type="password" name="password" class="password" placeholder="Create a password"
                               required>
                    </div>

                    <div class="input-box button">
                        <input type="submit" value="Registered">
                    </div>
                    <div class="text">
                        <h3> <a href="/" class="text login-link">Login Now</a></h3>
                    </div>
                </form>
</div>

<script src="script.js"></script>
</body>
</html>



