package service.log;

import java.time.LocalDateTime;

import factory.EntityManagerFactoryProvider;
import model.exam.student.StudentExam;
import model.log.ExamLog;
import repository.log.ExamLogDao;

public class ExamLogService {

    public static final String START_EXAM = "Start exam";
    public static final String SUBMIT_EXAM = "Submit exam";
    public static final String DISCONNECT_EXAM = "Disconnect exam";
    public static final String SUSPENDED_EXAM = "Exam is suspended";

    public void createLog(StudentExam studentExam, String infomation) {
        ExamLogDao examLogDao = new ExamLogDao(EntityManagerFactoryProvider.getEntityManagerFactory(), ExamLog.class);
        ExamLog examLog = new ExamLog(LocalDateTime.now(), infomation, studentExam);
        examLogDao.create(examLog);
    }

    public void examActionLog(StudentExam studentExam, int questionNo, int optionNo) {
        String examAction = "Choose option " + optionNo + " in question " + questionNo;
        createLog(studentExam, examAction);
    }

}
