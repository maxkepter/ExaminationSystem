package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.user.Admin;
import repository.DeleteableObjectDao;
import repository.UpdatableDao;

public class AdminDao extends DeleteableObjectDao<Admin>
        implements UpdatableDao<Admin> {

    public AdminDao(EntityManagerFactory entityManagerFactory, Class<Admin> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void update(Admin object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

}
