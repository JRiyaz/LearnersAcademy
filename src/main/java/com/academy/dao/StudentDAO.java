package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Students;

public class StudentDAO {

	public static List<Students> getAllStudents() {

		return getStudentsWithLimtAndOffset(0, 0, false);
	}

	public static List<Students> getAllStudentsWithClass() {

		return getStudentsWithLimtAndOffset(0, 0, true);
	}

	public static List<Students> getFewStudents(int limit, boolean need_classes) {

		return getStudentsWithLimtAndOffset(limit, 1, need_classes);
	}

	public static List<Students> getFewStudentsWithOffset(int limit, int offset, boolean need_classes) {

		return getStudentsWithLimtAndOffset(limit, offset, need_classes);
	}

	public static int countOfStudents() {

		int count = 0;

		try (Connection connection = Database.getConnection()) {

			String sql = "SELECT COUNT(student_id) AS count FROM students";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			if (set.next())
				count = set.getInt("count");

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	private static List<Students> getStudentsWithLimtAndOffset(int limit, int offset, boolean get_classes) {

		List<Students> students = new ArrayList<>();

		try (Connection connection = Database.getConnection()) {

			String sql = "SELECT * FROM students";

			if (limit > 0)
				sql = "SELECT * FROM students LIMIT " + limit;

			if (limit > 0 && offset > 0)
				sql = "SELECT * FROM students LIMIT " + limit + " OFFSET " + offset;

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {

				Classes classes = null;

				int classId = set.getInt("class_id");

				if (get_classes) {
					classes = ClassDAO.getClass(connection, classId);
				}

				students.add(new Students(set.getInt("student_id"), set.getString("name"), set.getInt("age"),
						set.getString("gender"), set.getString("email_id"), classes));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return students;
	}
}
