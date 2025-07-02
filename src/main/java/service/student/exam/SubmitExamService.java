package service.student.exam;

import java.util.Map;
import java.util.Set;

import factory.DAOFactory;
import model.exam.student.StudentExam;
import service.log.ExamLogService;

public class SubmitExamService {

        /**
         * Submits the exam for a student by ID and choices.
         *
         * @param studentChoice    A map where keys are question IDs and values are sets
         *                         of option IDs chosen by the student.
         * @param studentExamIdstr The ID of the student exam to submit as a string.
         * @return The updated StudentExam object after submission.
         * @throws NumberFormatException    if the student exam ID cannot be parsed as
         *                                  an integer.
         * @throws IllegalArgumentException if the student exam ID is invalid or if the
         *                                  student choice is null or empty.
         * @throws ArithmeticException      if the score calculation results in a
         *                                  negative value.
         */
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

        /**
         * Submits the exam for a student by ID. Typically used to force submit an exam
         *
         * @param studentExamId The ID of the student exam to submit.
         * @return The updated StudentExam object after submission.
         * @throws IllegalArgumentException if the student exam ID is invalid or if the
         *                                  student exam is not found.
         * @throws ArithmeticException      if the score calculation results in a
         *                                  negative value.
         */
        public StudentExam submitExam(int studentExamId) {
                // Retrieve the StudentExam object from the database using the studentExamId
                StudentExam studentExam = DAOFactory.getStudentExamDao().findById(studentExamId);
                if (studentExam == null) {
                        throw new IllegalArgumentException("Student exam not found for ID: " + studentExamId);
                }

                // Update the the studentExam object with the provided choices and status
                studentExam.submitExam();

                studentExam.setExamStatus(StudentExam.EXAM_SUSPENDED);

                // Check if the score is negative after calculation
                if (studentExam.getScore() < 0) {
                        throw new ArithmeticException("Score calculation resulted in a negative value.");
                }
                // Save the updated StudentExam object back to the database
                DAOFactory.getStudentExamDao().update(studentExam);

                ExamLogService examLogService = new ExamLogService();
                examLogService.createLog(studentExam, ExamLogService.FORCE_SUBMIT_EXAM);

                return studentExam;
        }
}
