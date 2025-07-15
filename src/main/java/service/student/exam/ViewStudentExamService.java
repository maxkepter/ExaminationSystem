package service.student.exam;

import factory.DAOFactory;
import model.exam.student.StudentExam;

public class ViewStudentExamService {

    /**
     * Retrieves a student exam by user ID and student exam ID.
     *
     * @param userId        The ID of the user requesting the exam.
     * @param studentExamId The ID of the student exam to retrieve.
     * @return The StudentExam object corresponding to the provided IDs.
     * @throws IllegalArgumentException if the student exam is not found or if the
     *                                  user ID does not match the student exam's
     *                                  student ID.
     */
    public StudentExam getExam(int userId, int studentExamId) throws IllegalArgumentException {
        StudentExam studentExam = DAOFactory.getStudentExamDao().findWithStudent(studentExamId);

        if (studentExam == null) {
            throw new IllegalArgumentException("Student exam not found");
        }
        // check user
        if (studentExam.getStudent().getUserID() != userId) {
            throw new IllegalArgumentException("Invalid user id !");
        }

        return studentExam;
    }

    /**
     * Retrieves a student exam by its ID.
     *
     * @param studentExamId The ID of the student exam to retrieve.
     * @return The StudentExam object corresponding to the provided ID.
     * @throws IllegalArgumentException if the student exam is not found.
     */
    public StudentExam getExam(int studentExamId) throws IllegalArgumentException {
        StudentExam studentExam = DAOFactory.getStudentExamDao().findWithStudent(studentExamId);

        if (studentExam == null) {
            throw new IllegalArgumentException("Student exam not found");
        }

        return studentExam;
    }

}
