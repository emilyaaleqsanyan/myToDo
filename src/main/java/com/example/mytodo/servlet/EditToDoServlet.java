package com.example.mytodo.servlet;

import com.example.mytodo.DateUtil;
import com.example.mytodo.manager.ToDoManager;
import com.example.mytodo.manager.UserManager;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.model.User;
import com.example.mytodo.model.enums.ToDoStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(urlPatterns = "/editToDo")
public class EditToDoServlet extends HttpServlet {


    private ToDoManager toDoManager = new ToDoManager();
    private UserManager userManager = new UserManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ToDo toDo = toDoManager.getToDoById(id);
        req.setAttribute("toDo",toDo);

        req.getRequestDispatcher("/WEB-INF/editToDo.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id =Integer.parseInt(req.getParameter("toDoId")) ;
        String title = req.getParameter("title");
        String finishDate = req.getParameter("finish_date");
        String status = req.getParameter("status");
        try {
            toDoManager.edit(ToDo.builder()
                            .id(id)
                            .title(title)
                            .finish_date(DateUtil.stringToDateTime(finishDate))
                            .toDoStatus(ToDoStatus.DONE)
                    .build());
            resp.sendRedirect("/toDos");
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
