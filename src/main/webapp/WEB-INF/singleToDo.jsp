<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="com.example.mytodo.model.enums.ToDoStatus" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 23.01.2024
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ToDo toDo = (ToDo) request.getAttribute("toDo");%>


<html>
<head>
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <title><%=toDo.getTitle()%>
    </title>
</head>
<body>
<table id="singleToDo">
    <thead>
    <tr style="background: cornflowerblue">
        <th>Id</th>
        <th>TITLE</th>
        <th>CREATED DATE</th>
        <th>FINISH DATE</th>
        <th>USER ID</th>
        <th>STATUS</th>
        <td>EDIT</td>
    </tr>
    </thead>

<tbody>
    <tr>
        <td><%=toDo.getId()%></td>
        <td><%=toDo.getTitle()%></td>
        <td><%=toDo.getCreated_date()%></td>
        <td><%=toDo.getFinish_date()%></td>
        <td><%=toDo.getUser().getId()%></td>
        <td><%=toDo.getToDoStatus()%></td>
        <td><a href="/editToDo?id=<%=toDo.getId()%>">edit</a> </td>
    </tr>
</tbody>
</table>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
    new DataTable('#singleToDo');
</script>

</body>
</html>
