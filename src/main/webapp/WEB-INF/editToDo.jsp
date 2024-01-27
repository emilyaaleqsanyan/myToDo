<%@ page import="com.example.mytodo.model.ToDo" %>
<%@ page import="com.example.mytodo.model.enums.ToDoStatus" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 23.01.2024
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mytodo.model.ToDo" %>
<html>
<head >
    <link rel="stylesheet" href="/css/styleAdd.css">
    <title>Add ToDos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&amp;display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head><meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://codepen.io/paulj05hua/pen/LYGLJYQ">
<link rel="canonical" href="https://codepen.io/paulj05hua/pen/LYGLJYQ">
<link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">


<body>
<% ToDo toDo = (ToDo) request.getAttribute("toDo");%>
<div class="container m-5 p-2 rounded mx-auto bg-light shadow">
    <!-- App title section -->
    <div class="row m-1 p-4">
        <div class="col">
            <div class="p-1 h1 text-primary text-center mx-auto display-inline-block">
                <i class="fa fa-check bg-primary text-white rounded p-2"></i>
                <u>Edit Todo</u>
            </div>
        </div>
    </div>
    <!-- Create todo section -->
    <form method="post" action="/editToDo">
        <input type="hidden" name="toDoId" value="<%=toDo.getId()%>"><br>
        <div class="row m-1 p-3">
            <div class="col col-11 mx-auto">
                <div class="row bg-white rounded shadow-sm p-2 add-todo-wrapper align-items-center justify-content-center">
                    <div class="col">
                        <input type="text" name="title" value="<%=toDo.getTitle()%>"><br>
                    </div>
                    <div class="col-auto m-0 px-2 d-flex align-items-center">
                        <input type="date" name="finish_date" value="<%=toDo.getFinish_date()%>">
                        <select name="status">
                            <option value="<%=toDo.getToDoStatus()%>"><%=ToDoStatus.DONE.name()%>></option>
                        </select>
                    </div>
                    <div class="col-auto px-0 mx-0 mr-2">
                        <input type="submit" value="edit" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </div>
        <div class="p-2 mx-4 border-black-25 border-bottom"></div>
    </form>

</div>
</body>
</html>


















