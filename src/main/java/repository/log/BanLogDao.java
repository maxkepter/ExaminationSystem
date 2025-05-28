package repository.log;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.log.BanLog;
import model.user.User;
import repository.ObjectDao;

public class BanLogDao extends ObjectDao<BanLog>
        implements LogDao<BanLog> {

    private static final String FIND_BY_FIELD = "SELECT b FROM BanLog b WHERE b.%s = :value";

    public BanLogDao(EntityManagerFactory entityManagerFactory, Class<BanLog> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<BanLog> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<BanLog> findByField(String fieldName, Object value) {
        String query = String.format(FIND_BY_FIELD, fieldName);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        List<BanLog> results = entityManager.createQuery(query, BanLog.class)
                .setParameter("value", value)
                .getResultList();

        entityManager.getTransaction().commit();
        entityManager.close();
        return results;

    }

    @Override
    public List<BanLog> findPageSorted(int pageIndex, int pageSize, String sortBy, boolean asc) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPageSorted'");
    }

    public boolean isBanned(User user) {
        List<BanLog> logs = findByField("user", user);
        if (logs.isEmpty()) {
            return false;
        }
        BanLog lastLog = logs.get(logs.size() - 1);
        return lastLog.getEndTime() == null || lastLog.getEndTime().isAfter(java.time.LocalDateTime.now());
    }

}
