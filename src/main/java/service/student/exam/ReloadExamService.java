package service.student.exam;

import exception.user.exam.ExamOverException;
import factory.DAOFactory;
import model.exam.student.StudentExam;
import model.user.User;
import service.log.ExamLogService;

public class ReloadExamService {
    public StudentExam reloadExam(User user, int examId) throws ExamOverException {
        StudentExam studentExam = DAOFactory.STUDENT_EXAM_DAO.getDoingExam(user, examId);
        if (studentExam == null) {
            return studentExam;
        }
        // load exam
        studentExam = DAOFactory.STUDENT_EXAM_DAO.findWithExam(studentExam.getStudentExamID());

        // Về bài thi bị sú thì khi bị đánh sú thì nó sẽ set thành submit nên sẽ không
        // cần kiểm tra ở đây.
        // Thôi kiểm tra cho chắc gộp nó vào kết thúc :v

        // If exam is end submit exam
        if (studentExam.getExam().isEnd() || studentExam.getExamStatus() == StudentExam.EXAM_SUSPENDED) {
            SubmitExamService submitExamService = new SubmitExamService();
            submitExamService.submitExam(studentExam.getStudentChoice(),
                    Integer.toString(studentExam.getStudentExamID()));
            throw new ExamOverException();
        }

        ExamLogService examLogService = new ExamLogService();

        examLogService.createLog(studentExam, ExamLogService.RELOAD_EXAM);

        return studentExam;

    }
}
