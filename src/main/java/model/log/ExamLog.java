/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.log;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import model.exam.ExamInstance;
import model.user.Student;

@Entity
public class ExamLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer logId;

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime time;

    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private Student student;

    @ManyToOne
    @JoinColumn(name = "examInstanceId", nullable = false)
    private ExamInstance examInstance;

    @ManyToOne
    @JoinColumn(name = "statusId", nullable = false)
    private LogStatus status;
}