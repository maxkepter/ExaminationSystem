package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.BanLog;
import repository.ObjectDao;

public class BanLogDao extends ObjectDao<BanLog>
        implements LogDao<BanLog> {

    public BanLogDao(EntityManagerFactory entityManagerFactory, Class<BanLog> entityClass) {
        super(entityManagerFactory, entityClass);
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
    public List<BanLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

}
