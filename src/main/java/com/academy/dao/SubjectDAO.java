package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import main.java.com.academy.entity.Subjects;

public class SubjectDAO {

	public static List<Subjects> getSubjects() {

		List<Subjects> subjects = new ArrayList<>();

		try (Connection connection = Database.getConnection()) {

			String sql = "SELECT * FROM subjects";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {

				subjects.add(new Subjects(set.getInt("subject_id"), set.getString("name")));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return subjects;
	}
}
