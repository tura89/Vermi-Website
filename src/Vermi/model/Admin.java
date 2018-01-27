package Vermi.model;
import Vermi.SHAHasher;

public class Admin {
    private Integer id;
    private String username;
    private String hashedPassword;

    public Admin(String username, String hashedPassword) {
        this(null, username, hashedPassword);
    }

    public Admin(Integer id, String username, String hashedPassword) {
        this.id = id;
        this.username = username;
        this.hashedPassword = hashedPassword;
    }

    public Integer getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getHashedPassword() {
        return hashedPassword;
    }

    @Override
    public String toString() {
        return " ID: " + id + ", Username: " + username
                + ", Hashed Password: " + hashedPassword;
    }

}
