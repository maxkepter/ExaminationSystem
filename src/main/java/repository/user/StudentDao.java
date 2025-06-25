package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;
import model.user.Student;
import repository.DeleteableObjectDao;

public class StudentDao extends DeleteableObjectDao<Student> {

    public StudentDao(EntityManagerFactory entityManagerFactory, Class<Student> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public StudentDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Student.class);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void update(Student object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

    public Student findStudentByCode(String studentCode) {

        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            TypedQuery<Student> query = em.createQuery(
                    "SELECT s FROM Student s WHERE s.studentCode = :code ORDER BY s.userID DESC", Student.class);
            query.setParameter("code", studentCode);
            return query.setMaxResults(1).getResultStream().findFirst().orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Student findById(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public boolean exists(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

}
