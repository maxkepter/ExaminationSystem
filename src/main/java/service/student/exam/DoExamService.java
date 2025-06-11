package service.student.exam;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import factory.EntityManagerFactoryProvider;
import model.exam.student.StudentExam;
import repository.exam.student.StudentExamDao;
import service.log.ExamLogService;

public class DoExamService {
    private StudentExamDao studentExamDao = new StudentExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
            StudentExam.class);

    public void saveStudentChoice(int questionNo, int optionNo, StudentExam studentExam, boolean isRemoveChoice) {

        Map<Integer, Set<Integer>> studenChoice = studentExam.getStudentChoice();
        if (isRemoveChoice) {
            removeChoice(studenChoice, questionNo, optionNo);
        } else {
            addChoice(studenChoice, questionNo, optionNo);
        }

        studentExamDao.update(studentExam);

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
