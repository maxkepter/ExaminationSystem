package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.BanLog;
import repository.ObjectDao;

public class BanLogDao extends ObjectDao<BanLog>
        implements LogDao<BanLog> {

    public BanLogDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<BanLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<BanLog> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    @Override
    public void create(BanLog object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<BanLog> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public BanLog findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<BanLog> findAll() {
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

    @Override
    public List<BanLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

}
