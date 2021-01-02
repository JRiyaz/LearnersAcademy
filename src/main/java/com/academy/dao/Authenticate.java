package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import main.java.com.academy.entity.Users;

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

			String sql = "SELECT * FROM users WHERE " + field + " = '" + username + "' AND password = '" + password
					+ "' AND role = 'ADMIN'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			if (set.next())
				user = new Users(set.getString("name"), set.getString("password"), set.getString("email"),
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