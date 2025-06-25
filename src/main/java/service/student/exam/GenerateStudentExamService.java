package service.student.exam;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import exception.user.exam.ExamOverException;
import factory.DAOFactory;
import model.exam.Exam;
import model.exam.Question;
import model.exam.student.QuestionWithOptions;
import model.exam.student.StudentExam;
import model.user.Student;
import model.user.User;

public class GenerateStudentExamService {
        public StudentExam generateExam(User user, int examId) throws IllegalArgumentException, ExamOverException {
                // Validate the input parameters
                if (user == null || user.getUserID() <= 0) {
                        throw new IllegalArgumentException("Invalid user information provided.");
                }

                // Check if the user is a student
                Student student = DAOFactory.getStudentDao().findById(user.getUserID());
                if (student == null) {
                        throw new IllegalArgumentException("Student not found for user ID: " + user.getUserID());
                }

                Exam exam = DAOFactory.getExamDao().findById(examId);

                if (exam == null) {
                        throw new IllegalArgumentException("Exam not found for ID: " + examId);
                }

                if (exam.isEnd()) {
                        throw new ExamOverException();
                }

                // convert entity to object
                List<QuestionWithOptions> questionWithOptions = generateQuestionWithOptions(exam);
                QuestionWithOptions.randomQuestion(questionWithOptions);

                Map<Integer, Set<Integer>> studentChoices = new HashMap<>();
                StudentExam studentExam = new StudentExam(StudentExam.EXAM_DOING, 0, LocalDateTime.now(),
                                LocalDateTime.now(),
                                questionWithOptions, studentChoices, exam, student);

                DAOFactory.getStudentExamDao().create(studentExam);
                return studentExam;
        }

        private List<QuestionWithOptions> generateQuestionWithOptions(Exam exam) {
                List<Question> questions = DAOFactory.getQuestionDao().findAll();
                List<QuestionWithOptions> options = QuestionWithOptions.convertFromEntities(questions);
                return options.subList(0, 5);
        }

}
