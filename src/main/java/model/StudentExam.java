/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;

@Entity
public class StudentExam {
    @EmbeddedId
    private StudentExamId id;

    @ManyToOne
    @MapsId("userID")
    @JoinColumn(name = "userID")
    private Student student;

    @ManyToOne
    @MapsId("examInstanceId")
    @JoinColumn(name = "examInstanceId")
    private ExamInstance examInstance;

    @Column(nullable = false)
    private String examStatus;

    @Column(nullable = false)
    private Float score;

    @Column(nullable = false)
    private LocalDateTime startTime;

    @Column(nullable = false)
    private LocalDateTime submitTime;
}

@Embeddable
class StudentExamId implements Serializable {
    private Integer userID;
    private Integer examInstanceId;
}