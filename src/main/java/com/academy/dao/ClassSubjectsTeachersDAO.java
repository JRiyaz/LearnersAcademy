package main.java.com.academy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Subjects;
import main.java.com.academy.entity.Teachers;

public class ClassSubjectsTeachersDAO {

	public static List<Classes> getClassesWithSubjectId(Connection connection, int subjectId) {

		List<Classes> classes = new ArrayList<>();

		String sql = "SELECT class_id from class_subjects_teachers WHERE subject_id = " + subjectId;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				classes.add(ClassDAO.getClass(set.getInt("class_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return classes;
	}

	public static List<Subjects> getSubjectsWithClassId(Connection connection, int classId) {

		List<Subjects> subjects = new ArrayList<>();

		String sql = "SELECT subject_id from class_subjects_teachers WHERE class_id = " + classId;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				subjects.add(SubjectDAO.getSubject(set.getInt("subject_id")));

			statement.close();
			set.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return subjects;
	}

	public static List<Classes> getClassesWithTeacherId(Connection connection, int teacher_id) {

		List<Classes> classes = new ArrayList<>();

		String sql = "SELECT DISTINCT class_id from class_subjects_teachers WHERE teacher_id = " + teacher_id;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				classes.add(ClassDAO.getClass(set.getInt("class_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return classes;
	}

	public static List<Teachers> getTeachersWithClassId(Connection connection, int class_id) {

		List<Teachers> teachers = new ArrayList<>();

		String sql = "SELECT teacher_id from class_subjects_teachers WHERE class_id = " + class_id;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				teachers.add(TeacherDAO.getTeacher(set.getInt("teacher_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teachers;
	}

	public static List<Subjects> getSubjectsWithTeacherId(Connection connection, int teacher_id) {

		List<Subjects> subjects = new ArrayList<>();

		String sql = "SELECT DISTINCT subject_id FROM class_subjects_teachers WHERE teacher_id = " + teacher_id;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				subjects.add(SubjectDAO.getSubject(set.getInt("subject_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return subjects;
	}

	public static List<Teachers> getTeachersWithSubjectId(Connection connection, int subject_id) {

		List<Teachers> teachers = new ArrayList<>();

		String sql = "SELECT teacher_id FROM class_subjects_teachers WHERE subject_id = " + subject_id;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			while (set.next())
				teachers.add(TeacherDAO.getTeacher(set.getInt("teacher_id")));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teachers;
	}

	public static Teachers getTeachersWithClassAndSubjectId(Connection connection, int class_id, int subject_id) {

		Teachers teacher = null;

		String sql = "SELECT teacher_id FROM class_subjects_teachers WHERE class_id = " + class_id
				+ " AND subject_id = " + subject_id;

		try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

			if (set.next())
				teacher = TeacherDAO.getTeacher(set.getInt("teacher_id"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teacher;
	}
}
