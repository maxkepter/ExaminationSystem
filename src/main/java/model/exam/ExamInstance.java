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
}