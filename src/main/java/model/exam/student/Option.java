package model.exam.student;

public class Option {
    private int optionId;
    private String content;
    private boolean isCorrect;

    public Option(int optionId, String content, boolean isCorrect) {
        this.optionId = optionId;
        this.content = content;
        this.isCorrect = isCorrect;
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

}
