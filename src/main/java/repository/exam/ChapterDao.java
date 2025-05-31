package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Chapter;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class ChapterDao extends DeactivatableObjectDao<Chapter> implements SearchableDao<Chapter> {

    public ChapterDao(EntityManagerFactory entityManagerFactory, Class<Chapter> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Chapter> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Chapter> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
