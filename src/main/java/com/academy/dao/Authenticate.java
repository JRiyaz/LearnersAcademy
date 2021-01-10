package main.java.com.academy.dao;

import main.java.com.academy.entity.Users;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This class handles all the authentication related tasks.
 *
 * @author Riyaz J
 * @version 1.1
 */
public class Authenticate {

    /**
     * This method takes username and password method arguments and checks if the user is present in the database
     * records with that password and return the user object with user details. If user is not present it will
     * return empty user object.
     *
     * @param username - String name of the user
     * @param password - String password of the user
     * @return Users
     */
    public static Users getUser(String username, String password) {

        return getUser("name", username, password);
    }

    /**
     * This method takes email and password method arguments and checks if the user is present with the given email id
     * in the database records with that password and return the user object with the user details. If user is not
     * present it will return empty user object.
     *
     * @param email    - String email of the user
     * @param password - String password of the user
     * @return Users
     */
    public static Users getUserWithEmail(String email, String password) {

        return getUser("email", email, password);
    }

    /**
     * This is method is internal implementation for the above two methods. It takes field, username and, password
     * method arguments and check if the user is present with the given field in the database record with that password
     * and return the user object with the user details. If user is not present it will return empty user object.
     *
     * @param field    - String field with which user will be queried
     * @param username - String username of the user
     * @param password - String password of the user
     * @return Users
     */
    private static Users getUser(String field, String username, String password) {

        Users user = null;

        String sql = String.format("SELECT * FROM users WHERE %s = '%s' AND password = '%s' AND role = 'ADMIN'",
                field,
                username,
                password);

        try (Connection connection = Database.getConnection();
             Statement statement = connection.createStatement();
             ResultSet set = statement.executeQuery(sql)) {

            if (set.next())
                user = new Users(set.getString("name"),
                        set.getString("password"),
                        set.getString("email"),
                        set.getString("role"));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return user;
    }
}
