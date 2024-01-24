<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="com.example.mytodo.model.enums.ToDoStatus" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 23.01.2024
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit
    </title>
</head>
<body>
<% ToDo toDo = (ToDo) request.getAttribute("toDo");%>

Edit ToDo<br>
<br>
<form method="post" action="/editToDo">
    <input type="hidden" name="toDoId" value="<%=toDo.getId()%>"><br>
    toDo title:<input type="text" name="title" value="<%=toDo.getTitle()%>"><br>
    toDo status:<select name="status">
    <option value="<%=toDo.getToDoStatus()%>"><%=ToDoStatus.DONE.name()%>></option>
</select><br>
    toDo finish_date:<input type="date" name="finish_date" value="<%=toDo.getFinish_date()%>"><br>
    <input type="submit" value="edit">

</form>
</body>
</html>
