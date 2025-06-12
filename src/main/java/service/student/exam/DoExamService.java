package service.student.exam;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import factory.DAOFactory;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import model.exam.student.ExamChoice;
import model.exam.student.StudentChoice;
import model.exam.student.StudentExam;
import service.log.ExamLogService;
import utils.Validate;

public class DoExamService {
    private ExamLogService examLogService = new ExamLogService();

    public void convertJson(String jsonBody) throws IllegalArgumentException {
        if (!Validate.validateString(jsonBody)) {
            throw new IllegalArgumentException("Invalid input !");
        }

        // convert json to object
        Jsonb json = JsonbBuilder.create();
        ExamChoice examChoice = json.fromJson(jsonBody, ExamChoice.class);

        StudentExam studentExam = DAOFactory.STUDENT_EXAM_DAO.findById(examChoice.getStudentExamId());

        if (studentExam == null) {
            throw new IllegalArgumentException("Student exam not found !");
        }

        saveStudentChoice(examChoice.getStudentChoices(), studentExam.getStudentChoice(), studentExam);

        DAOFactory.STUDENT_EXAM_DAO.update(studentExam);

    }

    public void saveStudentChoice(List<StudentChoice> choices, Map<Integer, Set<Integer>> studenChoice,
            StudentExam studentExam) {

        for (StudentChoice choice : choices) {
            System.out.println(choice);
            examLogService.examActionLog(studentExam, choice);
            if (!choice.isChecked()) {
                removeChoice(studenChoice, choice.getQuestionId(), choice.getOptionId());
            } else {
                addChoice(studenChoice, choice.getQuestionId(), choice.getOptionId());
            }
        }
        studentExam.setStudentChoice(studenChoice);
    }

    private void removeChoice(Map<Integer, Set<Integer>> studenChoice, int questionNo, int optionNo) {
        if (studenChoice.containsKey(questionNo)) {
            Set<Integer> choice = studenChoice.get(questionNo);
            if (choice.contains(optionNo)) {
                choice.remove(optionNo);
            }
        }
    }

    private void addChoice(Map<Integer, Set<Integer>> studenChoice, int questionNo, int optionNo) {
        if (!studenChoice.containsKey(questionNo)) {
            Set<Integer> choices = new HashSet<>();
            choices.add(optionNo);
            studenChoice.put(questionNo, choices);
        } else {
            studenChoice.get(questionNo).add(optionNo);
        }
    }

}
