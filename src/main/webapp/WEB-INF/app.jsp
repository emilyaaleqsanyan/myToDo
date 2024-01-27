<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/main.js"></script>

    <title>Login</title>
</head>
<body>

<div class="container">
    <div class="forms">
        <div class="form login">

            <% if (session.getAttribute("msg") != null) {%>
            <span style="color: red"><%=session.getAttribute("msg")%></span>
            <% session.removeAttribute("msg");%>
            <%}%><br>
            <span class="title">Login</span>

            <form action="/login" method="post">
                <div class="input-field">
                    <input type="text" name="email" placeholder="Enter your email" required>
                    <i class="uil uil-envelope icon"></i>
                </div>
                <div class="input-field">
                    <input type="password" name="password" class="password"  placeholder="Enter your password" required>

                </div>
                <div class="checkbox-text">
                    <div class="checkbox-content">
                        <input type="checkbox" id="logCheck">
                        <label for="logCheck" class="text">Remember me</label>
                    </div>
                </div>
                <div class="input-field button">
                    <input type="submit" value="Login">
                </div>
            </form>

            <br>
            <br>
           <h3> <a href="/register" class="text login-link">Register</a></h3>
        </div>
    </div>
</div>

<script src="script.js"></script>
</body>
</html>
