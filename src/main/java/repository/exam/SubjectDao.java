package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Subject;
import repository.FullOptionDAO;

public class SubjectDao extends FullOptionDAO<Subject> {

    public SubjectDao(EntityManagerFactory entityManagerFactory, Class<Subject> entityClass) {
        super(entityManagerFactory, entityClass);
    }

    public SubjectDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Subject.class);
    }
}
