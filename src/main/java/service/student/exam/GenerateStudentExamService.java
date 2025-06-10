package service.student.exam;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.exam.Exam;
import model.exam.Question;
import model.exam.student.QuestionWithOptions;
import model.exam.student.StudentExam;
import model.user.Student;

public class GenerateStudentExamService {
    public StudentExam generateExam(List<Question> questions, Student student, Exam exam) {
        // convert entity to object
        List<QuestionWithOptions> questionWithOptions = QuestionWithOptions.convertFromEntities(questions);

        Map<Integer, Set<Integer>> studentChoices = new HashMap<>();
        StudentExam studentExam = new StudentExam(StudentExam.EXAM_DOING, 0, LocalDateTime.now(), LocalDateTime.now(),
                questionWithOptions, studentChoices, exam, student);
        return studentExam;
    }
}
