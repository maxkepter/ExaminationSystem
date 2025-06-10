package repository.exam.student;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.RollbackException;
import model.exam.student.StudentExam;
import repository.ObjectDao;
import repository.UpdatableDao;

public class StudentExamDao extends ObjectDao<StudentExam> implements UpdatableDao<StudentExam> {

    public StudentExamDao(EntityManagerFactory entityManagerFactory, Class<StudentExam> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void update(StudentExam object) throws IllegalStateException, RollbackException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(object);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

}
