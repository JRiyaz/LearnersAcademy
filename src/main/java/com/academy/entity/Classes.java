package main.java.com.academy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * This is an entity class for the database table public.classes
 *
 * @author Riyaz J
 * @version 1.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Classes implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int classId;
    private String name;
    private int seats;
    private int strength;
    private List<Subjects> subjects;
    private List<Students> students;
    private List<Teachers> teachers;

    public Classes(int classId, String name, int seats) {
        super();
        this.classId = classId;
        this.name = name;
        this.seats = seats;
    }

    public Classes(int classId, String name, int seats, int strength) {
        super();
        this.classId = classId;
        this.name = name;
        this.seats = seats;
        this.strength = strength;
    }
}
