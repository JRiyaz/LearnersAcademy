package main.java.com.academy.dao;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Subjects;
import main.java.com.academy.entity.Teachers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * This class handles the queries for the database table class_subjects_teachers
 *
 * @author Riyaz J
 * @version 1.1
 */
public class ClassSubjectsTeachersDAO {

    /**
     * This method takes connection and classId as method arguments and fetches all the subjects for the given classId
     * in the database and returns list of Subjects. If there are no subjects for the given classId it will return empty
     * list.
     *
     * @param connection - Connection object
     * @param classId    -  int classId of the Classes
     * @return List<Subjects>
     */
    public static List<Subjects> getSubjectsWithClassId(Connection connection, int classId) {

        List<Subjects> subjects = new ArrayList<>();

        String sql = "SELECT subject_id from class_subjects_teachers WHERE class_id = " + classId;

        try (Statement statement = connection.createStatement(); ResultSet set = statement.executeQuery(sql)) {

            while (set.next())
                subjects.add(SubjectDAO.getSubject(set.getInt("subject_id")));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return subjects;
    }

    /**
     * This method takes connection and teacher_id as method arguments and fetches all the distinct classes for the
     * given teacher_id and returns a list of Classes. If there are no classes for the given teacher_id it will return
     * an empty list.
     *
     * @param connection - Connection object
     * @param teacher_id - int teacher_id
     * @return List<Classes>
     */
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

    /**
     * This method takes connection and teacher_id as method arguments and fetches all the distinct subjects for the
     * given teacher_id and returns a list of Subjects. If there are no subjects for the given teacher_id it will return
     * an empty list.
     *
     * @param connection - Connection object
     * @param teacher_id - int teacher_id
     * @return List<Subjects>
     */
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

    /**
     * This method takes connection, class_id and, subject_id as method arguments and fetches all the teachers for the
     * given class_id and subject_id and returns Teacher object. If there are no teachers for the given class_id and
     * subject_id it will return empty teacher object.
     *
     * @param connection - Connection object
     * @param class_id   - int class_id
     * @param subject_id - int subject_id
     * @return Teachers
     */
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
