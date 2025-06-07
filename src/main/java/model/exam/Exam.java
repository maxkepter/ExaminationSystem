/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import model.user.User;

@Entity
@Table(name = "Exam")
public class Exam {
    @Id
    private int examID;

    @Column(nullable = false)
    private int duration;

    @Column(nullable = false)
    private LocalDateTime examDate;

    @Column(nullable = false)
    private LocalDate deadline;

    @Column(nullable = false, unique = true, length = 50)
    private String examCode;

    @Column(nullable = false, length = 100)
    private String examName;

    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user;

    // Getters and Setters
}