package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.LogStatus;
import repository.DeactivatableObjectDao;

public class LogStatusDao extends DeactivatableObjectDao<LogStatus> {

    public LogStatusDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void create(LogStatus object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<LogStatus> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public LogStatus findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<LogStatus> findAll() {
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
    public void disable(LogStatus object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'disable'");
    }

    @Override
    public void enable(LogStatus object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'enable'");
    }

    @Override
    public void isDisable(LogStatus object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'isDisable'");
    }

    @Override
    public void update(int id, LogStatus object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

}
