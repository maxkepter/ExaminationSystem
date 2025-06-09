package repository.log;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;
import model.log.BanLog;
import model.user.User;
import repository.ObjectDao;

public class BanLogDao extends ObjectDao<BanLog>
        implements LogDao<BanLog> {

    private String FIND_BY_FIELD = "SELECT b FROM BanLog b WHERE ";

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
    // This method is used to find BanLog entries based on a specific field and its
    // value
    public List<BanLog> findByField(Map<String, Object> fieldValues) {
        if (fieldValues == null || fieldValues.isEmpty()) {
            throw new IllegalArgumentException("Field values cannot be null or empty");
        }

        StringBuilder queryBuilder = new StringBuilder(FIND_BY_FIELD);

        for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
            String fieldName = entry.getKey();
            Object value = entry.getValue();
            if (value == null) {
                throw new IllegalArgumentException("Value for field " + fieldName + " cannot be null");
            }
            queryBuilder.append("b.").append(fieldName).append(" = :").append(fieldName).append(" AND ");
        }

        // Remove the last " AND "
        queryBuilder.setLength(queryBuilder.length() - 5);

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Query query = entityManager.createQuery(queryBuilder.toString(), BanLog.class);

        for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
            String fieldName = entry.getKey();
            Object value = entry.getValue();
            query.setParameter(fieldName, value);
        }

        @SuppressWarnings("unchecked")
        List<BanLog> results = (List<BanLog>) query.getResultList();

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
        Map<String, Object> fieldValues = Map.of("user", user);
        List<BanLog> logs = findByField(fieldValues);
        if (logs.isEmpty()) {
            return false;
        }
        BanLog lastLog = logs.get(logs.size() - 1);
        return lastLog.getEndTime() == null || lastLog.getEndTime().isAfter(java.time.LocalDateTime.now());
    }

    @Override
    public List<BanLog> findByTimeRange(LocalDateTime startTime, LocalDateTime endTime) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByTimeRange'");
    }

    @Override
    public List<BanLog> findByTimeRange(User user, LocalDateTime startTime, LocalDateTime endTime) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByTimeRange'");
    }

}
