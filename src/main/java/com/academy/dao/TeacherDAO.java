package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Subjects;
import main.java.com.academy.entity.Teachers;

public class TeacherDAO {

	public static List<Teachers> getAllTeachersWithClassesAndSubjects() {

		return getTeachersWithLimtAndOffset(0, 0, true, true);
	}

	public static List<Teachers> getAllTeachersWithClasses() {

		return getTeachersWithLimtAndOffset(0, 0, true, false);
	}

	public static List<Teachers> getAllTeachersWithSubjects() {

		return getTeachersWithLimtAndOffset(0, 0, false, true);
	}

	public static List<Teachers> getFewTeachers(int limit, boolean need_classes, boolean need_subjects) {

		return getTeachersWithLimtAndOffset(limit, 1, need_classes, need_subjects);
	}

	public static List<Teachers> getFewTeachersWithLimitAndOffset(int limit, int offset, boolean need_classes,
			boolean need_subjects) {

		return getTeachersWithLimtAndOffset(limit, offset, need_classes, need_subjects);
	}

	public static int countOfTeachers() {

		int count = 0;

		String sql = "SELECT COUNT(teacher_id) AS count FROM teachers";

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			if (set.next())
				count = set.getInt("count");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	private static List<Teachers> getTeachersWithLimtAndOffset(int limit, int offset, boolean get_classes,
			boolean get_subjects) {

		List<Teachers> teachers = new ArrayList<>();

		String sql = "SELECT * FROM teachers";

		if (limit > 0)
			sql = "SELECT * FROM teachers LIMIT " + limit;

		if (limit > 0 && offset > 0)
			sql = "SELECT * FROM teachers LIMIT " + limit + " OFFSET " + offset;

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			while (set.next()) {

				List<Subjects> subjects = new ArrayList<>();

				List<Classes> classes = new ArrayList<>();

				int teacherId = set.getInt("teacher_id");

				if (get_subjects)
					subjects.addAll(ClassSubjectsTeachersDAO.getSubjectsWithTeacherId(connection, teacherId));

				if (get_classes)
					classes.addAll(ClassSubjectsTeachersDAO.getClassesWithTeacherId(connection, teacherId));

				teachers.add(new Teachers(teacherId, set.getString("name"), set.getInt("age"), set.getString("gender"),
						set.getString("email_id"), subjects, classes));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teachers;
	}

	public static Teachers getTeacher(int teacher_id) {

		Teachers teacher = null;

		String sql = "SELECT * FROM teachers WHERE teacher_id = " + teacher_id;

		try (Connection connection = Database.getConnection();
				Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(sql)) {

			if (set.next())
				teacher = new Teachers(set.getInt("teacher_id"), set.getString("name"), set.getInt("age"),
						set.getString("gender"), set.getString("email_id"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teacher;
	}
}
