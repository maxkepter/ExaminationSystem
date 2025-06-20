/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "[User]")
// @NamedQuery(name = "find all user", query = "demo")
public class User {

    // user fields name
    public static final String USER_FIRSTNAME = "firstName";
    public static final String USER_LASTNAME = "lastName";
    public static final String USER_EMAIL = "email";
    public static final String USER_ROLE = "role";
    // user role values
    public static final Integer USER_ROLE_STUDENT = 1;
    public static final Integer USER_ROLE_TEACHER = 2;
    public static final Integer USER_ROLE_ADMIN = 3;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false)
    private Integer role;

    @Column(nullable = false, unique = true)
    private String email;

    public User() {
    }

    public User(String firstName, String lastName, Integer role, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
        this.email = email;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getUserID() {
        return userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User [userID=" + userID + ", firstName=" + firstName + ", lastName=" + lastName + ", role=" + role
                + ", email=" + email + "]";
    }

}