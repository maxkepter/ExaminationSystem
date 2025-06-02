package repository.log;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.log.ExamLog;
import model.user.User;
import repository.ObjectDao;

public class ExamLogDao extends ObjectDao<ExamLog>
        implements LogDao<ExamLog> {

    public ExamLogDao(EntityManagerFactory entityManagerFactory, Class<ExamLog> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<ExamLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<ExamLog> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    @Override
    public List<ExamLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public List<ExamLog> findByTimeRange(LocalDateTime startTime, LocalDateTime endTime) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByTimeRange'");
    }

    @Override
    public List<ExamLog> findByTimeRange(User user, LocalDateTime startTime, LocalDateTime endTime) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByTimeRange'");
    }

}
