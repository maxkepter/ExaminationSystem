package service.student.exam;

import factory.DAOFactory;
import model.exam.student.StudentExam;

public class ViewStudentExamService {
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

    public StudentExam getExam(int studentExamId) throws IllegalArgumentException {
        StudentExam studentExam = DAOFactory.getStudentExamDao().findWithStudent(studentExamId);

        if (studentExam == null) {
            throw new IllegalArgumentException("Student exam not found");
        }

        return studentExam;
    }

}
