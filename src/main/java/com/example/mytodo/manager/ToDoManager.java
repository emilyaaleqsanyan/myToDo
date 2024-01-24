package com.example.mytodo.manager;

import com.example.mytodo.DateUtil;
import com.example.mytodo.db.DBConnectionProvider;
import com.example.mytodo.model.ToDo;
import com.example.mytodo.model.enums.ToDoStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ToDoManager {


    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    private UserManager userManager = new UserManager();


    public void add(ToDo toDo) {
        String sql = "INSERT INTO to_do(title, created_date,finish_date,user_Id,status) VALUES(?,?,?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, toDo.getTitle());
            preparedStatement.setString(2, DateUtil.dateTimeToString(toDo.getCreated_date()));
            preparedStatement.setString(3, DateUtil.dateTimeToString(toDo.getFinish_date()));
            preparedStatement.setInt(4, toDo.getUser().getId());
            preparedStatement.setString(5, ToDoStatus.NEW.toString());
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                toDo.setId(id);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<ToDo> getAllToDoByUserId(int id) {
        String sql = "SELECT * FROM to_do WHERE user_Id = '" + id + "'";
        List<ToDo> toDos = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                toDos.add(ToDo.builder()
                        .id(resultSet.getInt("id"))
                        .title(resultSet.getString("title"))
                        .created_date(resultSet.getDate("created_date"))
                        .finish_date(resultSet.getDate("finish_date"))
                        .user(userManager.getUserById(resultSet.getInt("user_Id")))
                        .toDoStatus(ToDoStatus.valueOf(resultSet.getString("status")))
                        .build());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return toDos;
    }

    public List<ToDo> getAllToDo() {
        String sql = "SELECT * FROM to_do ";
        List<ToDo> toDos = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                toDos.add(ToDo.builder()
                        .id(resultSet.getInt("id"))
                        .title(resultSet.getString("title"))
                        .created_date(resultSet.getDate("created_date"))
                        .finish_date(resultSet.getDate("finish_date"))
                        .user(userManager.getUserById(resultSet.getInt("user_Id")))
                        .toDoStatus(ToDoStatus.valueOf(resultSet.getString("status")))
                        .build());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return toDos;
    }

    public void delete(int id) {
        String sql = "DELETE FROM to_do WHERE id = " + id;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ToDo getToDoById(int id) {
        String sql = "SELECT * FROM to_do WHERE id = " + id;
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                return ToDo.builder()
                        .id(resultSet.getInt("id"))
                        .title(resultSet.getString("title"))
                        .created_date(resultSet.getDate("created_date"))
                        .finish_date(resultSet.getDate("finish_date"))
                        .user(userManager.getUserById(resultSet.getInt("user_Id")))
                        .toDoStatus(ToDoStatus.valueOf(resultSet.getString("status")))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;

    }


    public void edit(ToDo toDo) {
        String sql = "UPDATE to_do SET title = ?, finish_date = ?, status = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, toDo.getTitle());
            preparedStatement.setString(2, DateUtil.dateTimeToString(toDo.getFinish_date()));
            preparedStatement.setString(3, toDo.getToDoStatus().toString());
            preparedStatement.setInt(4,toDo.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

