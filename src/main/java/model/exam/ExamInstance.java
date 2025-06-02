/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class ExamInstance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer examInstanceId;

    @Column(nullable = false, unique = true)
    private String examCode;

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime examDate;

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime deadline;

    @ManyToOne
    @JoinColumn(name = "examID", nullable = false)
    private Exam exam;

    public Integer getExamInstanceId() {
        return examInstanceId;
    }

    public void setExamInstanceId(Integer examInstanceId) {
        this.examInstanceId = examInstanceId;
    }

    public String getExamCode() {
        return examCode;
    }

    public void setExamCode(String examCode) {
        this.examCode = examCode;
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

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }
    
}