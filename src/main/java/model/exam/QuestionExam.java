package model.exam;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "QuestionExam")
public class QuestionExam {

    @EmbeddedId
    private QuestionExamKey id;

    @ManyToOne
    @JoinColumn(name = "examID", insertable = false, updatable = false)
    private Exam exam;

    @ManyToOne
    @JoinColumn(name = "questionId", insertable = false, updatable = false)
    private Question question;

    public QuestionExam() {}

    public QuestionExam(int examID, int questionId) {
        this.id = new QuestionExamKey(examID, questionId);
    }

    public QuestionExamKey getId() {
        return id;
    }

    public void setId(QuestionExamKey id) {
        this.id = id;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    // ✅ Nested composite key class
    @Embeddable
    public static class QuestionExamKey implements Serializable {
        private int examID;
        private int questionId;

        public QuestionExamKey() {}

        public QuestionExamKey(int examID, int questionId) {
            this.examID = examID;
            this.questionId = questionId;
        }

        public int getExamID() {
            return examID;
        }

        public void setExamID(int examID) {
            this.examID = examID;
        }

        public int getQuestionId() {
            return questionId;
        }

        public void setQuestionId(int questionId) {
            this.questionId = questionId;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof QuestionExamKey)) return false;
            QuestionExamKey that = (QuestionExamKey) o;
            return examID == that.examID && questionId == that.questionId;
        }

        @Override
        public int hashCode() {
            return Objects.hash(examID, questionId);
        }
    }
}
