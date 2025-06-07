/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam.student;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import model.exam.Exam;
import model.user.Student;

@Entity
@Table(name = "StudentExam")
public class StudentExam {

    @Id
    @Column(nullable = false)
    private int studentExamID;

    @Column(nullable = false)
    private int examStatus = 0;

    @Column(nullable = false)
    private float score;

    @Column(nullable = false)
    private LocalDateTime submitTime;

    @Column(nullable = false)
    private LocalDateTime startTime;

    @Lob
    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    @Convert(converter = ExamDetailConverter.class)
    private List<QuestionWithOptions> examDetail;

    @Lob
    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    @Convert(converter = StudentChoiceConverter.class)
    private Map<Integer, List<Integer>> studentChoice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ExamID", nullable = false)
    private Exam exam;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID", nullable = false)
    private Student student;

}
