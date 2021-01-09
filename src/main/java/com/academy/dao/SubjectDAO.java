package main.java.com.academy.dao;

import main.java.com.academy.entity.Subjects;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {

    public static List<Subjects> getAllSubjects() {

        List<Subjects> subjects = new ArrayList<>();

        String sql = "SELECT * FROM subjects ORDER BY subject_id";

        try (Connection connection = Database.getConnection();
             Statement statement = connection.createStatement();
             ResultSet set = statement.executeQuery(sql)) {

            while (set.next())
                subjects.add(new Subjects(set.getInt("subject_id"), set.getString("name")));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return subjects;
    }

    protected static Subjects getSubject(int subject_id) {

        Subjects subject = null;

        try (Connection connection = Database.getConnection()) {

            String sql = "SELECT * FROM subjects WHERE subject_id = ? ORDER BY name";

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, subject_id);

            ResultSet set = statement.executeQuery();

            if (set.next())
                subject = new Subjects(set.getInt("subject_id"), set.getString("name"));

            statement.close();

            set.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return subject;
    }
}
