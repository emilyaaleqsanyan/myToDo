package com.example.mytodo.servlet;

import com.example.mytodo.manager.ToDoManager;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(urlPatterns = "/toDos")
public class ToDosServlet extends HttpServlet {


    private ToDoManager toDoManager = new ToDoManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int userId = user.getId();

        List<ToDo> toDos = toDoManager.getAllToDoByUserId(userId);

        req.setAttribute("toDos", toDos);
        req.getRequestDispatcher("/WEB-INF/todos.jsp").forward(req,resp);

    }
}
