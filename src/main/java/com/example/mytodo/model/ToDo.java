package com.example.mytodo.model;


import com.example.mytodo.model.enums.ToDoStatus;
import jdk.jshell.Snippet;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ToDo {

    private int id;
    private String title;
    private Date created_date;
    private Date finish_date;
    private User user;
    private ToDoStatus toDoStatus;
}
