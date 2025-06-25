/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import model.user.User;
import service.exam.ExamCodeGenerator;

@Entity
@Table(name = "Exam")
public class Exam {
    public static final String EXAM_ID = "examID";
    public static final String EXAM_DURATION = "duration";
    public static final String EXAM_CODE = "examCode";
    public static final String EXAM_NAME = "examName";

    

    
    
    @Id
    private int examID;

    @Column(nullable = false)
    private int duration;

    @Column(nullable = false)
    private LocalDateTime examDate;

    @Column(nullable = false)
    private LocalDateTime deadline;

    @Column(nullable = false, unique = true, length = 50)
    private String examCode;

    @Column(nullable = false, length = 100)
    private String examName;

    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user;
    
    public Exam() {
    }

    public Exam(int examID, int duration, String examName, User user) {
        this.examID = examID;
        this.duration = duration;
        this.examName = examName;
        this.user = user;
        this.examDate = LocalDateTime.now();
        this.deadline = this.examDate.plusDays(7);
        this.examCode = ExamCodeGenerator.getExamCode();
    }
    
    // Getters and Setters

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public LocalDateTime getExamDate() {
        return examDate;
    }

    public void setExamDate(LocalDateTime examDate) {
        this.examDate = examDate;
    }

    public LocalDateTime getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }

    public String getExamCode() {
        return examCode;
    }

    public void setExamCode(String examCode) {
        this.examCode = examCode;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    

    public boolean isEnd() {
        return this.deadline.isBefore(LocalDate.now());
    }

}