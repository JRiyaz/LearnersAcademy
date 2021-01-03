package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Subjects;
import main.java.com.academy.entity.Teachers;

public class TeacherDAO {

	public static List<Teachers> getAllTeachers() {

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

	public static List<Teachers> getFewTeachersWithOffset(int limit, int offset, boolean need_classes,
			boolean need_subjects) {

		return getTeachersWithLimtAndOffset(limit, offset, need_classes, need_subjects);
	}

	public static int countOfTeachers() {

		int count = 0;

		try (Connection connection = Database.getConnection()) {

			String sql = "SELECT COUNT(teacher_id) AS count FROM teachers";

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

	private static List<Teachers> getTeachersWithLimtAndOffset(int limit, int offset, boolean get_classes,
			boolean get_subjects) {

		List<Teachers> teachers = new ArrayList<>();

		try (Connection connection = Database.getConnection()) {

//			String check = " WHERE teacher_id = ";

			String sql = "SELECT * FROM teachers";

			if (limit > 0)
				sql = "SELECT * FROM teachers LIMIT " + limit;

			if (limit > 0 && offset > 0)
				sql = "SELECT * FROM teachers LIMIT " + limit + " OFFSET " + (offset - 1);

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {

				List<Subjects> subjects = new ArrayList<>();

				List<Classes> classes = new ArrayList<>();

				int teacherId = set.getInt("teacher_id");

				if (get_subjects) {

					List<Integer> subjectIds = getSubjectIDs(connection, teacherId);

					for (int subjectId : subjectIds)
						subjects.add(SubjectDAO.getSubjects(connection, subjectId));
				}

				if (get_classes) {

					List<Integer> classIds = getClassIDs(connection, teacherId);

					for (int classId : classIds)
						classes.add(ClassDAO.getClass(connection, classId));
				}

				teachers.add(new Teachers(teacherId, set.getString("name"), set.getInt("age"), set.getString("gender"),
						set.getString("email_id"), subjects, classes));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teachers;
	}

	private static List<Integer> getSubjectIDs(Connection connection, int teacherId) {

		List<Integer> integers = new ArrayList<>();

		try {
			String sql = "SELECT subject_id FROM teacher_subjects WHERE teacher_id = ?";

			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setInt(1, teacherId);

			ResultSet set = statement.executeQuery();

			while (set.next()) {

				integers.add(set.getInt("subject_id"));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return integers;
	}

	private static List<Integer> getClassIDs(Connection connection, int teacherId) {

		List<Integer> integers = new ArrayList<>();

		try {
			String sql = "SELECT class_id FROM class_teachers WHERE teacher_id = ?";

			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setInt(1, teacherId);

			ResultSet set = statement.executeQuery();

			while (set.next()) {

				integers.add(set.getInt("class_id"));
			}

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return integers;
	}
}
