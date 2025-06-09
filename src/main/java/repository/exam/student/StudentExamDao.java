package repository.exam.student;

import jakarta.persistence.EntityManagerFactory;
import model.exam.student.StudentExam;
import repository.ObjectDao;

public class StudentExamDao extends ObjectDao<StudentExam> {

    public StudentExamDao(EntityManagerFactory entityManagerFactory, Class<StudentExam> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
