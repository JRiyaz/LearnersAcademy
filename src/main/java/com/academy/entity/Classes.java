package main.java.com.academy.entity;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
	private List<Subjects> Subjects;
	private List<Students> Students;
	private List<Teachers> Teachers;

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
