package model.exam.student;

import java.util.ArrayList;
import java.util.List;

import model.exam.QuestionOption;

public class Option {
    private int optionId;
    private String content;
    private boolean isCorrect;

    public Option(int optionId, String content, boolean isCorrect) {
        this.optionId = optionId;
        this.content = content;
        this.isCorrect = isCorrect;
    }

    public Option() {
    }

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public static Option convertFromEntity(QuestionOption option) {
        return new Option(option.getOptionId(), option.getOptionContent(), option.getIsCorrect());
    }

    public static List<Option> convertFromEntities(List<QuestionOption> options) {
        return options.stream().map(o -> convertFromEntity(o)).toList();
    }

    public static List<Option> randomOption(List<Option> options) {
        List<Option> cloneOptions = new ArrayList<>(options);
        List<Option> tempOptions = new ArrayList<>();
        while (cloneOptions.size() > 0) {
            int randomIndex = (int) (Math.random() * cloneOptions.size());
            Option option = cloneOptions.remove(randomIndex);
            option.setOptionId(tempOptions.size());
            tempOptions.add(option);

        }
        return tempOptions;
    }

    @Override
    public String toString() {
        return "Option [optionId=" + optionId + ", content=" + content + ", isCorrect=" + isCorrect + "]";
    }

}
