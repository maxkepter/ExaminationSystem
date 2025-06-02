package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Major;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class MajorDao extends DeactivatableObjectDao<Major>
        implements SearchableDao<Major> {

    public MajorDao(EntityManagerFactory entityManagerFactory, Class<Major> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Major> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Major> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
