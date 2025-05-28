package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.user.Student;
import repository.DeleteableObjectDao;
import repository.PageableDao;
import repository.UpdatableDao;

public class StudentDao extends DeleteableObjectDao<Student>
        implements UpdatableDao<Student>,
        PageableDao<Student> {

    public StudentDao(EntityManagerFactory entityManagerFactory, Class<Student> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Student> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Student> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public void update(Student object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

}
