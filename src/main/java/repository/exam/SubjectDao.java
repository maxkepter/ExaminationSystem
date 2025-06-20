package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Subject;
import repository.DeactivatableObjectDao;

public class SubjectDao
        extends DeactivatableObjectDao<Subject> {

    public SubjectDao(EntityManagerFactory entityManagerFactory, Class<Subject> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
