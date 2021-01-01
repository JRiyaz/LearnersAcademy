package main.java.com.academy.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
