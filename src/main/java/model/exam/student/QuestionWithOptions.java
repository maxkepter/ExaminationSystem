package model.exam.student;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import model.exam.Question;

public class QuestionWithOptions {
    private int questionId;
    private String content;
    private List<Option> options;

    public QuestionWithOptions(String content, List<Option> options) {
        this.content = content;
        this.options = Option.randomOption(options);
    }

    public int getQuestionId() {
        return questionId;
    }

    public QuestionWithOptions(int questionId, String content, List<Option> options, List<Integer> correctId) {
        this.questionId = questionId;
        this.content = content;
        this.options = options;
    }

    public List<Integer> getCorrectId() {
        return options.stream()
                .filter(Option::isCorrect)
                .map(Option::getOptionId)
                .collect(Collectors.toList());
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

    public QuestionWithOptions() {
    }

    public static List<QuestionWithOptions> convertFromEntities(List<Question> questions) {
        List<QuestionWithOptions> questionWithOptions = new ArrayList<>();
        for (Question question : questions) {
            questionWithOptions.add(convertFromEntity(question));
        }

        return questionWithOptions;
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

    @Override
    public String toString() {
        return "QuestionWithOptions [questionId=" + questionId + ", content=" + content + ", options=" + options + "]";
    }

}
