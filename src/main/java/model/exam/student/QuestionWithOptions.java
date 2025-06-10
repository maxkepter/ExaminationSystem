package model.exam.student;

import java.util.ArrayList;
import java.util.List;

import model.exam.Question;

public class QuestionWithOptions {
    private int questionId;
    private String content;
    private List<Option> options;
    private List<Integer> correctId;

    public QuestionWithOptions(String content, List<Option> options) {
        this.content = content;
        this.options = options;
        this.correctId = new ArrayList<>();
        Option.randomOption(options, correctId);
    }

    public int getQuestionId() {
        return questionId;
    }

    public List<Integer> getCorrectId() {
        return correctId;
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

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }

    public static QuestionWithOptions convertFromEntity(Question question) {
        List<Option> options = Option.convertFromEntities(question.getOptions());

        return new QuestionWithOptions(question.getQuestionContent(), options);
    }

    public static List<QuestionWithOptions> convertFromEntities(List<Question> questions) {
        return questions.stream()
                .map(q -> convertFromEntity(q))
                .toList();
    }

    public static void randomQuestion(List<QuestionWithOptions> questions) {
        List<QuestionWithOptions> tempQuestions = new ArrayList<>();
        while (questions.size() > 0) {
            int randomIndex = (int) (Math.random() * questions.size());
            QuestionWithOptions question = questions.remove(randomIndex);
            question.setQuestionId(tempQuestions.size());
            tempQuestions.add(question);
        }
        questions.addAll(tempQuestions);
    }

}
