/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam.student;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import model.exam.QuestionOption;

@Entity
public class Choice {
    @EmbeddedId
    private ChoiceId id;

    @ManyToOne
    @MapsId("optionId")
    @JoinColumn(name = "optionId")
    private QuestionOption option;

    @ManyToOne
    @MapsId("questionInExamId")
    @JoinColumn(name = "questionInExamId")
    private QuestionInExam questionInExam;
}

@Embeddable
class ChoiceId implements Serializable {
    private Integer optionId;
    private Integer questionInExamId;

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        ChoiceId that = (ChoiceId) o;
        return Objects.equals(optionId, that.optionId) &&
                Objects.equals(questionInExamId, that.questionInExamId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(optionId, questionInExamId);
    }

}