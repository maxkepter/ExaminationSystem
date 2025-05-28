package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.user.Admin;
import repository.DeletableDao;
import repository.ObjectDao;
import repository.UpdatableDao;

public class AdminDao extends ObjectDao<Admin>
        implements DeletableDao, UpdatableDao<Admin> {

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

    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    @Override
    public void deleteMany(List<Integer> ids) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteMany'");
    }

    @Override
    public void deleteAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteAll'");
    }

}
