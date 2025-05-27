package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Chapter;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class ChapterDao extends DeactivatableObjectDao<Chapter> implements SearchableDao<Chapter> {

    public ChapterDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void disable(Chapter object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'disable'");
    }

    @Override
    public void enable(Chapter object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'enable'");
    }

    @Override
    public void isDisable(Chapter object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'isDisable'");
    }

    @Override
    public void update(int id, Chapter object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
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

    @Override
    public void create(Chapter object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<Chapter> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public Chapter findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<Chapter> findAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    @Override
    public long count() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'count'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

}
