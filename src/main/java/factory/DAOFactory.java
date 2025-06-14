package factory;

import jakarta.persistence.EntityManagerFactory;
import repository.exam.ExamDao;
import repository.exam.QuestionDao;
import repository.exam.student.StudentExamDao;
import repository.log.ExamLogDao;
import repository.user.LoginInfoDao;
import repository.user.StudentDao;
import repository.user.UserDao;

public class DAOFactory {
    private static final EntityManagerFactory emf = EntityManagerFactoryProvider.getEntityManagerFactory();

    public static final UserDao USER_DAO = new UserDao(emf);
    public static final StudentDao STUDENT_DAO = new StudentDao(emf);
    public static final StudentExamDao STUDENT_EXAM_DAO = new StudentExamDao(emf);
    public static final ExamDao EXAM_DAO = new ExamDao(emf);
    public static final QuestionDao QUESTION_DAO = new QuestionDao(emf);
    public static final LoginInfoDao LOGIN_INFO_DAO = new LoginInfoDao(emf);
    public static final ExamLogDao EXAM_LOG_DAO = new ExamLogDao(emf);

}
