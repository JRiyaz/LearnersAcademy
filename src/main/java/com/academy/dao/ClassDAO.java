package main.java.com.academy.dao;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Students;
import main.java.com.academy.entity.Subjects;
import main.java.com.academy.entity.Teachers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClassDAO {

    public static List<Classes> getAllClassesWithStrength() {

        List<Classes> classes = new ArrayList<>();

        String sql = "SELECT * FROM classes";

        try (Connection connection = Database.getConnection();
             Statement statement = connection.createStatement();
             ResultSet set = statement.executeQuery(sql)) {

            while (set.next()) {

                int class_id = set.getInt("class_id");

                classes.add(new Classes(class_id,
                        set.getString("class_name"),
                        set.getInt("seats"),
                        StudentDAO.getClassStrength(class_id)));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return classes;
    }

    public static Classes getClassWithSubjectsTeachersStudents(int classId) {

        Classes classes = null;

        String sql = "SELECT * FROM classes WHERE class_id = " + classId;

        try (Connection connection = Database.getConnection();
             Statement statement = connection.createStatement();
             ResultSet set = statement.executeQuery(sql)) {

            if (set.next()) {

                List<Students> students = StudentDAO.getStudentsWithClassId(classId);

                List<Subjects> subjects = ClassSubjectsTeachersDAO.getSubjectsWithClassId(connection, classId);

                int class_id = set.getInt("class_id");

                List<Teachers> teachers = new ArrayList<>();

                for (Subjects subject : subjects)
                    teachers.add(ClassSubjectsTeachersDAO.getTeachersWithClassAndSubjectId(connection, class_id,
                            subject.getSubjectId()));

                classes = new Classes(class_id,
                        set.getString("class_name"),
                        set.getInt("seats"),
                        StudentDAO.getClassStrength(class_id),
                        subjects, students, teachers);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return classes;
    }

    public static Classes getClass(int class_id) {

        Classes classes = null;

        try (Connection connection = Database.getConnection()) {

            String sql = "SELECT * FROM classes WHERE class_id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, class_id);

            ResultSet set = statement.executeQuery();

            if (set.next())
                classes = new Classes(set.getInt("class_id"),
                        set.getString("class_name"),
                        set.getInt("seats"));

            statement.close();
            set.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return classes;
    }

    public static int countOfClasses() {

        int count = 0;

        String sql = "SELECT COUNT(class_id) AS count FROM classes";

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

}
