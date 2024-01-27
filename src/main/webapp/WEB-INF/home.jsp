<%@ page import="com.example.mytodo.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 22.01.2024
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head >
    <script src="/main.js"></script>
    <title>Home Page</title>


</head>
<body style="background: #4070f4">

<div style="margin-top: 10px; margin-left: 8px">
<% if (session.getAttribute("user") != null){
    User user = (User) session.getAttribute("user");
%>
 Welcome <%=user.getName() + " " + user.getSurname()%>  !!! <a href="/logout">Logout</a><br>
<%}
%>
<div >
    <a href="/toDos">View All toDo</a>
</div>
</div>
</body>
</html>
