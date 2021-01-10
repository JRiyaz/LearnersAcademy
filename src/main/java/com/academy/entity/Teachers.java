package main.java.com.academy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * This is an entity class for the database table public.teachers
 *
 * @author Riyaz J
 * @version 1.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teachers implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int teacherId;
    private String name;
    private int age;
    private String gender;
    private String emailId;
    private List<Subjects> subjects;
    private List<Classes> classes;

    public Teachers(int teacherId, String name, int age, String gender, String emailId) {
        super();
        this.teacherId = teacherId;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.emailId = emailId;
    }
}
