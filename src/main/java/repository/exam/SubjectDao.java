package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Subject;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class SubjectDao
        extends DeactivatableObjectDao<Subject> implements SearchableDao<Subject> {

    public SubjectDao(EntityManagerFactory entityManagerFactory, Class<Subject> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Subject> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Subject> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
