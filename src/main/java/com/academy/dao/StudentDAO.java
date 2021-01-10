package main.java.com.academy.dao;

import main.java.com.academy.entity.Classes;
import main.java.com.academy.entity.Students;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * This is a DAO class for {@link Students} entity.
 *
 * @author Riyaz J
 * @version 1.1
 */
public class StudentDAO {

    /**
     * This method returns the list of Students for the given method arguments.
     *
     * @param limit        - int limit of records
     * @param offset       - int offset from which records to be fetched
     * @param need_classes - boolean need_classes
     * @return List<Students>
     */
    public static List<Students> getFewStudentsWithOffset(int limit, int offset, boolean need_classes) {

        return getStudentsWithLimitAndOffset(limit, offset, need_classes);
    }

    /**
     * This method counts all the students in the database and return the count of students.
     *
     * @return int
     */
    public static int countOfStudents() {

        int count = 0;

        String sql = "SELECT COUNT(student_id) AS count FROM students";

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

    /**
     * This method fetches all the students for the given method arguments and returns a list of Students.
     * If there are not students then it will return empty list.
     *
     * @param limit       - int limit of records
     * @param offset      - int offset from which records to be fetched
     * @param get_classes - boolean get_classes
     * @return List<Students>
     */
    private static List<Students> getStudentsWithLimitAndOffset(int limit, int offset, boolean get_classes) {

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

                students.add(new Students(set.getInt("student_id"),
                        set.getString("name"),
                        set.getInt("age"),
                        set.getString("gender"),
                        set.getString("email_id"), classes));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return students;
    }

    /**
     * This method returns the list of students for the given class_id. If there are no students it will return
     * empty list.
     *
     * @param class_id - int class_id
     * @return List<Students>
     */
    public static List<Students> getStudentsWithClassId(int class_id) {

        List<Students> students = new ArrayList<>();

        String sql = "SELECT * FROM students WHERE class_id = " + class_id + " ORDER BY student_id";

        try (Connection connection = Database.getConnection();
             Statement statement = connection.createStatement();
             ResultSet set = statement.executeQuery(sql)) {

            while (set.next())
                students.add(new Students(set.getInt("student_id"),
                        set.getString("name"),
                        set.getInt("age"),
                        set.getString("gender"),
                        set.getString("email_id")));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return students;
    }

    /**
     * This method fetches the count of all the students for the given class_id.
     *
     * @param class_id - int class_id
     * @return int
     */
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
