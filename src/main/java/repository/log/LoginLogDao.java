package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.LoginLog;
import repository.ObjectDao;

public class LoginLogDao extends ObjectDao<LoginLog>
        implements LogDao<LoginLog> {

    public LoginLogDao(EntityManagerFactory entityManagerFactory, Class<LoginLog> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
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
    public List<LoginLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

}
