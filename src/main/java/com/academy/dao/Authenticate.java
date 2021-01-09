package main.java.com.academy.dao;

import main.java.com.academy.entity.Users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Authenticate {

    public static Users getUser(String username, String password) {

        return getUser("name", username, password);
    }

    public static Users getUserWithEmail(String email, String password) {

        return getUser("email", email, password);
    }

    private static Users getUser(String field, String username, String password) {

        Users user = null;

        try (Connection connection = Database.getConnection()) {

            String sql = String.format("SELECT * FROM users WHERE %s = '%s' AND password = '%s' AND role = 'ADMIN'",
                    field,
                    username,
                    password);

            Statement statement = connection.createStatement();

            ResultSet set = statement.executeQuery(sql);

            if (set.next())
                user = new Users(set.getString("name"),
                        set.getString("password"),
                        set.getString("email"),
                        set.getString("role"));

            statement.close();
            set.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return user;
    }
}
