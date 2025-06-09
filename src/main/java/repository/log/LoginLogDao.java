package repository.log;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.log.LoginLog;
import model.user.User;
import repository.ObjectDao;

public class LoginLogDao extends ObjectDao<LoginLog>
        implements LogDao<LoginLog> {

    public static final String FIND_BY_TIME_RANGE = "SELECT l FROM LoginLog l WHERE l.time BETWEEN :startTime AND :endTime";
    public static final String FIND_BY_TIME_RANGE_AND_USER = "SELECT l FROM LoginLog l WHERE l.time BETWEEN :startTime AND :endTime AND l.user = :user";

    public LoginLogDao(EntityManagerFactory entityManagerFactory, Class<LoginLog> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<LoginLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<LoginLog> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

    @Override
    public List<LoginLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    @Override
    public List<LoginLog> findByTimeRange(LocalDateTime startTime, LocalDateTime endTime) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        List<LoginLog> logs = null;
        try {
            logs = entityManager.createQuery(FIND_BY_TIME_RANGE, LoginLog.class)
                    .setParameter("startTime", startTime)
                    .setParameter("endTime", endTime)
                    .getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.getTransaction().commit();
            entityManager.close();
        }

        return logs;
    }

    @Override
    public List<LoginLog> findByTimeRange(User user, LocalDateTime startTime, LocalDateTime endTime) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        List<LoginLog> logs = null;
        try {
            logs = entityManager.createQuery(FIND_BY_TIME_RANGE_AND_USER, LoginLog.class)
                    .setParameter("startTime", startTime)
                    .setParameter("endTime", endTime)
                    .setParameter("user", user)
                    .getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            entityManager.getTransaction().commit();
            entityManager.close();
        }

        return logs;
    }

}
