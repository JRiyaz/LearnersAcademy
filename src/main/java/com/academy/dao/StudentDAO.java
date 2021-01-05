package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

		String sql = "SELECT COUNT(student_id) AS count FROM students";

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql);) {

			if (set.next())
				count = set.getInt("count");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	private static List<Students> getStudentsWithLimtAndOffset(int limit, int offset, boolean get_classes) {

		List<Students> students = new ArrayList<>();

		String sql = "SELECT * FROM students ORDER BY student_id";

		if (limit > 0)
			sql += " LIMIT " + limit;

		if (limit > 0 && offset > 0)
			sql += " OFFSET " + offset;

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			while (set.next()) {

				Classes classes = null;

				if (get_classes)
					classes = ClassDAO.getClass(set.getInt("class_id"));

				students.add(new Students(set.getInt("student_id"), set.getString("name"), set.getInt("age"),
						set.getString("gender"), set.getString("email_id"), classes));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return students;
	}

	public static Students getStudent(int student_id) {

		Students student = null;

		String sql = "SELECT * FROM students WHERE student_id = " + student_id;

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			if (set.next())
				student = new Students(set.getInt("student_id"), set.getString("name"), set.getInt("age"),
						set.getString("gender"), set.getString("email_id"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return student;
	}

	public static List<Students> getStudentsWithClassId(int class_id) {

		List<Students> students = new ArrayList<>();

		String sql = "SELECT * FROM students WHERE class_id = " + class_id +" ORDER BY student_id";

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				students.add(new Students(set.getInt("student_id"), set.getString("name"), set.getInt("age"),
						set.getString("gender"), set.getString("email_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return students;
	}

	public static int getClassStrength(int class_id) {

		int strength = 0;

		try (Connection connection = Database.getConnection()) {

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
}
