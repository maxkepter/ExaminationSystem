/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam.student;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import model.exam.ExamInstance;
import model.user.Student;

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

    @Column(columnDefinition = "FLOAT")
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

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        StudentExamId that = (StudentExamId) o;
        return Objects.equals(userID, that.userID) &&
                Objects.equals(examInstanceId, that.examInstanceId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userID, examInstanceId);
    }

}