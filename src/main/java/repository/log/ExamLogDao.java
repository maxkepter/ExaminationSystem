package repository.log;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.ExamLog;
import repository.ObjectDao;

public class ExamLogDao extends ObjectDao<ExamLog>
        implements LogDao<ExamLog> {

    public ExamLogDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<ExamLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public List<ExamLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<ExamLog> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    @Override
    public void create(ExamLog object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<ExamLog> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public ExamLog findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<ExamLog> findAll() {
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
