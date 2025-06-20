package service.student.exam;

import java.util.Map;
import java.util.Set;

import factory.DAOFactory;
import model.exam.student.StudentExam;
import service.log.ExamLogService;

public class SubmitExamService {
    public StudentExam submitExam(Map<Integer, Set<Integer>> studentChoice, String studentExamIdstr)
            throws NumberFormatException, IllegalArgumentException, ArithmeticException {
        int studentExamId = Integer.parseInt(studentExamIdstr);

        if (studentExamId <= 0) {
            throw new IllegalArgumentException("Invalid student exam ID: " + studentExamId);
        }
        if (studentChoice == null) {
            throw new IllegalArgumentException("Student choice cannot be null or empty.");
        }
        // Retrieve the StudentExam object from the database using the studentExamId
        StudentExam studentExam = DAOFactory.getStudentExamDao().findById(studentExamId);
        if (studentExam == null) {
            throw new IllegalArgumentException("Student exam not found for ID: " + studentExamId);
        }
        // Update the the studentExam object with the provided choices and status

        studentExam.submitExam(studentChoice);

        // Check if the score is negative after calculation
        if (studentExam.getScore() < 0) {
            throw new ArithmeticException("Score calculation resulted in a negative value.");
        }
        // Save the updated StudentExam object back to the database
        DAOFactory.getStudentExamDao().update(studentExam);

        ExamLogService examLogService = new ExamLogService();
        examLogService.createLog(studentExam, ExamLogService.SUBMIT_EXAM);

        return studentExam;
    }
}
