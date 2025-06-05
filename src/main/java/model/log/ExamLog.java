package model.log;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import model.exam.student.StudentExam;

@Entity
@Table(name = "ExamLog")
public class ExamLog {
    @Id
    private int examLogId;

    @Column(nullable = false)
    private LocalDateTime time;

    @Column(nullable = false, length = 255)
    private String information;

    @ManyToOne
    @JoinColumn(name = "studentExamID", nullable = false)
    private StudentExam studentExam;

}