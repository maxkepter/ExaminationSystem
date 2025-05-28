package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import repository.DeleteableObjectDao;
import repository.PageableDao;
import repository.UpdatableDao;

public class Teacher extends DeleteableObjectDao<Teacher>
        implements UpdatableDao<Teacher>,
        PageableDao<Teacher> {

    public Teacher(EntityManagerFactory entityManagerFactory, Class<Teacher> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Teacher> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Teacher> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public void update(Teacher object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

}
