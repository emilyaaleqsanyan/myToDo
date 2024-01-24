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
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/addToDo")
public class AddToDoServlet extends HttpServlet {


    private ToDoManager toDoManager = new ToDoManager();
    private UserManager userManager = new UserManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ToDo> toDos = toDoManager.getAllToDo();
        req.setAttribute("toDos", toDos);
        req.getRequestDispatcher("/WEB-INF/addToDo.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String finish_date = req.getParameter("finish_date");
        User user = (User) req.getSession().getAttribute("user");
        int userId = user.getId();
        try {
            toDoManager.add(ToDo.builder()
                    .title(title)
                    .created_date(new Date())
                    .finish_date(DateUtil.stringToDateTime(finish_date))
                    .user(userManager.getUserById(userId))
                    .toDoStatus(ToDoStatus.NEW)
                    .build());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/toDos");

    }
}
