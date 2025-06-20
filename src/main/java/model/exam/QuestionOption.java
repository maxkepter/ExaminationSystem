/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "QuestionOption")
public class QuestionOption {
    @Id
    private int optionId;

    @Column(nullable = false)
    private boolean isCorrect;

    @Lob
    @Column(nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String optionContent;

    @ManyToOne
    @JoinColumn(name = "questionId", nullable = false)
    private Question question;

    public QuestionOption() {
    }

    public QuestionOption(boolean isCorrect, String optionContent, Question question) {
        this.isCorrect = isCorrect;
        this.optionContent = optionContent;
        this.question = question;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public String getOptionContent() {
        return optionContent;
    }

    public void setOptionContent(String optionContent) {
        this.optionContent = optionContent;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

}