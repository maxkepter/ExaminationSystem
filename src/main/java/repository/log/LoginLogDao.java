package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.LoginLog;
import repository.ObjectDao;

public class LoginLogDao extends ObjectDao<LoginLog>
        implements LogDao<LoginLog> {

    public LoginLogDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<LoginLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public List<LoginLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<LoginLog> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    @Override
    public void create(LoginLog object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<LoginLog> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public LoginLog findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<LoginLog> findAll() {
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
