package repository.log;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.log.ExamLog;
import model.user.User;
import repository.ObjectDao;

public class ExamLogDao extends ObjectDao<ExamLog>
        implements LogDao<ExamLog> {

    public ExamLogDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, ExamLog.class);
        // TODO Auto-generated constructor stub
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
