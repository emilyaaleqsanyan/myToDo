<%@ page import="java.util.List" %>
<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="com.example.mytodo.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 22.01.2024
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href=" https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">

    <title>ToDo</title>
</head>
<body>

<%
    List<ToDo> toDos = (List<ToDo>) request.getAttribute("toDos");
    User user = (User) session.getAttribute("user");

%>

todos    |     <a href="/addToDo">Add ToDo</a>


<table id="todosTable">
    <thead>

    <tr style="background: cornflowerblue">
        <th >ID</th>
        <th>TITLE</th>
        <th>CREATED DATE</th>
        <th>FINISH DATE</th>
        <th>USER ID</th>
        <th>STATUS</th>
        <th>DELETE</th>

    </tr>
    </thead>

    <%
        if(!toDos.isEmpty()){
            for (ToDo toDo : toDos) {%>
<tbody>
    <tr>
        <td><%=toDo.getId()%></td>
        <td><a href="/singleToDo?id=<%=toDo.getId()%>"><%=toDo.getTitle()%></a></td>
        <td><%=toDo.getCreated_date()%></td>
        <td><%=toDo.getFinish_date()%></td>
        <td><%=user.getId()%></td>
        <td><%=toDo.getToDoStatus()%></td>

        <td><a href="/deleteToDo?id=<%=toDo.getId()%>">delete</a></td>


    </tr>
</tbody>
    <%}
    %>
</table>
<%}%>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script>
    new DataTable('#todosTable');
</script>
</body>
</html>
