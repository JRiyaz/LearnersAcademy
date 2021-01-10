package main.java.com.academy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * This is an entity class for the database table public.users
 *
 * @author Riyaz J
 * @version 1.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String user_id;
    private String name;
    private transient String password;
    private String email;
    private String role;

    public Users(String name, String password, String email, String role) {
        super();
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
    }
}
