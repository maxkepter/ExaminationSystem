package model.exam.student;

import java.util.List;

public class QuestionWithOptions {
    private int questionId;
    private String content;
    private int difficulty;
    private List<Option> options;

    public QuestionWithOptions(int questionId, String content, int difficulty, List<Option> options) {
        this.questionId = questionId;
        this.content = content;
        this.difficulty = difficulty;
        this.options = options;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

}
