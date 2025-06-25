package repository.log;

import jakarta.persistence.EntityManagerFactory;
import model.log.LogStatus;
import repository.DeactivatableObjectDao;

public class LogStatusDao extends DeactivatableObjectDao<LogStatus> {

    public LogStatusDao(EntityManagerFactory entityManagerFactory, Class<LogStatus> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public LogStatusDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, LogStatus.class);
        // TODO Auto-generated constructor stub
    }

    @Override
    public LogStatus findById(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public boolean exists(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

}
