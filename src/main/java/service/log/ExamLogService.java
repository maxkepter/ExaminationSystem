package service.log;

import java.time.LocalDateTime;

import factory.DAOFactory;
import model.exam.student.StudentChoice;
import model.exam.student.StudentExam;
import model.log.ExamLog;
import repository.log.ExamLogDao;

public class ExamLogService {

    public static final String START_EXAM = "Start exam";
    public static final String SUBMIT_EXAM = "Submit exam";
    public static final String DISCONNECT_EXAM = "Disconnect exam";
    public static final String SUSPENDED_EXAM = "Exam is suspended";
    public static final String RELOAD_EXAM = "Reload exam !";

    public void createLog(StudentExam studentExam, String infomation) {
        ExamLogDao examLogDao = DAOFactory.getExamLogDao();
        ExamLog examLog = new ExamLog(LocalDateTime.now(), infomation, studentExam);
        examLogDao.create(examLog);
    }

    public void createLog(int studentExamId, String information) {
        StudentExam studentExam = DAOFactory.getStudentExamDao().findById(studentExamId);
        if (information.equals(StudentExam.EXAM_STATUS_INFO[StudentExam.EXAM_SUSPENDED])) {
            studentExam.setExamStatus(StudentExam.EXAM_SUSPENDED);
            DAOFactory.getStudentExamDao().update(studentExam);
        }
        createLog(studentExam, information);
    }

    public void examActionLog(StudentExam studentExam, StudentChoice studentChoice) {
        String examAction = (studentChoice.isChecked() ? "Choice"
                : "Remove") + " option " + studentChoice.getOptionId() + " in question "
                + studentChoice.getQuestionId();
        System.out.println(examAction);
        createLog(studentExam, examAction);
    }

}
