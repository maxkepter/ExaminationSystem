/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import model.user.User;

@Entity
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer examID;

    @Column(nullable = false)
    private String examName;

    @Column(nullable = false)
    private Integer duration;

    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user;

    public Integer getExamID() {
        return examID;
    }

    public String getExamName() {
        return examName;
    }

    public Integer getDuration() {
        return duration;
    }

    public User getUser() {
        return user;
    }

    public void setExamID(Integer examID) {
        this.examID = examID;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Exam{" + "examID=" + examID + ", examName=" + examName + ", duration=" + duration + ", user=" + user + '}';
    }
    
}