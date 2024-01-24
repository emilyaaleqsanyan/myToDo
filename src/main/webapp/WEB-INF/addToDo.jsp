<%@ page import="java.util.List" %>
<%@ page import="com.example.mytodo.model.ToDo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 22.01.2024
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add ToDo</title>
</head>
<body>

<% if(session.getAttribute("msg")!= null){%>
<span style="color: red"><%=session.getAttribute("msg")%></span>
<% session.removeAttribute("msg");%>
<%}%>

<br>
<br>

Add ToDo<br>
<form method="post" action="/addToDo">
    Title:<input type="text" name="title"><br>
    Finish date:<input type="date" name="finish_date"><br>


    <input type="submit" value="add">
</form>
</body>
</html>
