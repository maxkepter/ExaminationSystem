package service.student.exam;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import factory.DAOFactory;
import model.exam.Exam;
import model.exam.Question;
import model.exam.student.QuestionWithOptions;
import model.exam.student.StudentExam;
import model.user.Student;
import model.user.User;

import utils.Validate;

public class GenerateStudentExamService {
    public StudentExam generateExam(User user, String examIdStr) throws IllegalArgumentException {
        // Validate the input parameters
        if (user == null || user.getUserID() <= 0) {
            throw new IllegalArgumentException("Invalid user information provided.");
        }
        if (!Validate.validateInteger(examIdStr)) {
            throw new IllegalArgumentException("Invalid exam information provided.");
        }

        int examId = Integer.parseInt(examIdStr);

        // Check if the user is a student
        Student student = DAOFactory.STUDENT_DAO.findById(user.getUserID());
        if (student == null) {
            throw new IllegalArgumentException("Student not found for user ID: " + user.getUserID());
        }

        Exam exam = DAOFactory.EXAM_DAO.findById(examId);

        // convert entity to object
        List<QuestionWithOptions> questionWithOptions = generateQuestionWithOptions(exam);
        QuestionWithOptions.randomQuestion(questionWithOptions);

        Map<Integer, Set<Integer>> studentChoices = new HashMap<>();
        StudentExam studentExam = new StudentExam(StudentExam.EXAM_DOING, 0, LocalDateTime.now(), LocalDateTime.now(),
                questionWithOptions, studentChoices, exam, student);

        DAOFactory.STUDENT_EXAM_DAO.create(studentExam);
        return studentExam;
    }

    private List<QuestionWithOptions> generateQuestionWithOptions(Exam exam) {
        List<Question> questions = DAOFactory.QUESTION_DAO.findAll();
        List<QuestionWithOptions> options = QuestionWithOptions.convertFromEntities(questions);
        return options.subList(0, 5);
    }

}
