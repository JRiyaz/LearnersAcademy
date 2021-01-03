package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import main.java.com.academy.entity.Classes;

public class ClassDAO {

	public static List<Classes> getClasses() {

		List<Classes> classes = new ArrayList<>();

		try (Connection connection = Database.getConnection()) {

			String sql = "SELECT * FROM classes";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {

				int class_id = set.getInt("class_id");

				classes.add(new Classes(class_id, set.getString("class_name"), set.getInt("seats"),
						getStrength(connection, class_id)));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return classes;
	}

	public static int getStrength(Connection connection, int class_id) {

		int strength = 0;

		try {

			String sql = "SELECT COUNT(class_id) AS strength FROM students WHERE class_id = ?";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, class_id);

			ResultSet set = statement.executeQuery();

			if (set.next())
				strength = set.getInt("strength");

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return strength;
	}

	protected static Classes getClass(Connection connection, int id) {

		Classes classes = null;

		try {

			String sql = "SELECT * FROM classes WHERE class_id = ?";

			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setInt(1, id);

			ResultSet set = statement.executeQuery();

			if (set.next())
				classes = new Classes(set.getInt("class_id"), set.getString("class_name"), set.getInt("seats"));

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return classes;
	}

}
