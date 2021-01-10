package main.java.com.academy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * This is an entity class for the database table public.students
 *
 * @author Riyaz J
 * @version 1.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Students implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int studentId;
    private String name;
    private int age;
    private String gender;
    private String emailId;
    private Classes cls;

    public Students(int studentId, String name, int age, String gender, String emailId) {
        super();
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.emailId = emailId;
    }
}
