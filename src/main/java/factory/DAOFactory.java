package factory;

import jakarta.persistence.EntityManagerFactory;
import repository.exam.ExamDao;
import repository.exam.QuestionDao;
import repository.exam.SubjectDao;
import repository.exam.student.StudentExamDao;
import repository.log.ExamLogDao;
import repository.log.LogStatusDao;
import repository.user.LoginInfoDao;
import repository.user.StudentDao;
import repository.user.UserDao;

public class DAOFactory {
    private static final EntityManagerFactory emf = EntityManagerFactoryProvider.getEntityManagerFactory();

    private static UserDao userDao;
    private static StudentDao studentDao;
    private static StudentExamDao studentExamDao;
    private static ExamDao examDao;
    private static QuestionDao questionDao;
    private static LoginInfoDao loginInfoDao;
    private static ExamLogDao examLogDao;
    private static LogStatusDao logStatusDao;
    private static SubjectDao subjectDao;

    public static UserDao getUserDao() {
        if (userDao == null) {
            userDao = new UserDao(emf);
        }
        return userDao;
    }

    public static StudentDao getStudentDao() {
        if (studentDao == null) {
            studentDao = new StudentDao(emf);
        }
        return studentDao;
    }

    public static StudentExamDao getStudentExamDao() {
        if (studentExamDao == null) {
            studentExamDao = new StudentExamDao(emf);
        }
        return studentExamDao;
    }

    public static ExamDao getExamDao() {
        if (examDao == null) {
            examDao = new ExamDao(emf);
        }
        return examDao;
    }

    public static QuestionDao getQuestionDao() {
        if (questionDao == null) {
            questionDao = new QuestionDao(emf);
        }
        return questionDao;
    }

    public static LoginInfoDao getLoginInfoDao() {
        if (loginInfoDao == null) {
            loginInfoDao = new LoginInfoDao(emf);
        }
        return loginInfoDao;
    }

    public static ExamLogDao getExamLogDao() {
        if (examLogDao == null) {
            examLogDao = new ExamLogDao(emf);
        }
        return examLogDao;
    }

    public static LogStatusDao getLogStatusDao() {
        if (logStatusDao == null) {
            logStatusDao = new LogStatusDao(emf);
        }
        return logStatusDao;
    }

    public static SubjectDao getSubjectDao() {
        if (subjectDao == null) {
            subjectDao = new SubjectDao(emf);
        }
        return subjectDao;
    }

}
