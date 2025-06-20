package model.exam.student;

import jakarta.json.bind.annotation.JsonbProperty;

public class StudentChoice {
    @JsonbProperty("questionId")
    private int questionId;
    @JsonbProperty("optionId")
    private int optionId;
    @JsonbProperty("isChecked")
    private int isChecked;

    public StudentChoice() {
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public boolean isChecked() {
        return isChecked == 1;
    }

    public void setIsChecked(int isChecked) {
        this.isChecked = isChecked;
    }

    @Override
    public String toString() {
        return "StudentChoice [questionId=" + questionId + ", optionId=" + optionId + ", isChecked=" + isChecked()
                + "]";
    }

}
