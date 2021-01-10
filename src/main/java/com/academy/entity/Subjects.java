package main.java.com.academy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * This is an entity class for the database table public.subjects
 *
 * @author Riyaz J
 * @version 1.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Subjects implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int subjectId;
    private String name;
}
