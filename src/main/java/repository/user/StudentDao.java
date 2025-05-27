package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.user.Student;
import repository.DeletableDao;
import repository.ObjectDao;
import repository.PageableDao;
import repository.UpdatableDao;

public class StudentDao extends ObjectDao<Student>
        implements DeletableDao, UpdatableDao<Student>,
        PageableDao<Student> {

    public StudentDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
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

    @Override
    public Student findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<Student> findAll() {
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

    @Override
    public void create(Student object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<Student> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

}
