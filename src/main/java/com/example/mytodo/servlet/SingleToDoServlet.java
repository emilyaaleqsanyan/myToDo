package com.example.mytodo.servlet;

import com.example.mytodo.manager.ToDoManager;
import com.example.mytodo.model.ToDo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/singleToDo")
public class SingleToDoServlet extends HttpServlet {



    private ToDoManager toDoManager = new ToDoManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ToDo toDoById = toDoManager.getToDoById(id);
        if(toDoById == null){
            resp.sendRedirect("/toDos");
        }else {
            req.setAttribute("toDo",toDoById);
            req.getRequestDispatcher("/WEB-INF/singleToDo.jsp").forward(req,resp);
        }
    }
}
