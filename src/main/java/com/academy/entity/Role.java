package main.java.com.academy.entity;

public enum Role {

    USER(1),
    ADMIN(2),
    MANAGER(3);

    private int id;

    Role(int id) {
        this.id = id;
    }
}
