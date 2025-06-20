package model.exam;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "QuestionExam")
@IdClass(QuestionExam.class)
public class QuestionExam {
    @Id
    private int examID;

    @Id
    private int questionId;

    @ManyToOne
    @JoinColumn(name = "examID", insertable = false, updatable = false)
    private Exam exam;

    @ManyToOne
    @JoinColumn(name = "questionId", insertable = false, updatable = false)
    private Question question;

    // Getters and Setters
}
