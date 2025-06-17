/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.exam;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Question")
public class Question {
    @Id
    private int questionId;

    @Lob
    @Column(nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String questionContent;

    @Column(nullable = false)
    private boolean isDisable;

    @Column(nullable = false)
    private int difficulty;

    @ManyToOne
    @JoinColumn(name = "chapterID", nullable = false)
    private Chapter chapter;

    @OneToMany(mappedBy = "question")
    private List<QuestionOption> options;

    public Question() {
    }

    public Question(String questionContent, boolean isDisable, int difficulty, Chapter chapter) {
        this.questionContent = questionContent;
        this.isDisable = isDisable;
        this.difficulty = difficulty;
        this.chapter = chapter;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public boolean isDisable() {
        return isDisable;
    }

    public void setDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public List<QuestionOption> getOptions() {
        return options;
    }
}