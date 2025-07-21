package repository.exam.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import factory.DAOFactory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.RollbackException;
import jakarta.persistence.TypedQuery;
import java.util.LinkedHashMap;
import model.exam.student.StudentExam;
import model.user.User;
import repository.ObjectDao;
import repository.UpdatableDao;

public class StudentExamDao extends ObjectDao<StudentExam>
        implements UpdatableDao<StudentExam> {

    public StudentExamDao(EntityManagerFactory entityManagerFactory, Class<StudentExam> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public StudentExamDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, StudentExam.class);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void update(StudentExam object) throws IllegalStateException, RollbackException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(object);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

    @Override
    public List<StudentExam> findByField(Map<String, Object> fieldValues) {
        if (fieldValues == null || fieldValues.isEmpty()) {
            return findAll();
        }

        StringBuilder queryBuilder = new StringBuilder("SELECT e FROM " + entityClass.getSimpleName() + " e WHERE ");
        for (String field : StudentExam.ATTRIBUTE_NAME) {
            if (fieldValues.containsKey(field)) {
                queryBuilder.append("e." + field + " = :" + field + " AND ");
            }
        }
        queryBuilder.setLength(queryBuilder.length() - 5); // remove last ' AND '

        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            TypedQuery<StudentExam> query = entityManager.createQuery(queryBuilder.toString(), entityClass);
            for (String field : StudentExam.ATTRIBUTE_NAME) {
                if (fieldValues.containsKey(field)) {
                    query.setParameter(field, fieldValues.get(field));
                }
            }
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error when querying StudentExam", e);
        }
    }

    // Get doing exam
    public StudentExam getDoingExam(User user, int examId) {

        Map<String, Object> fieldValues = new HashMap<>();
        fieldValues.put(StudentExam.STUDENT, DAOFactory.getExamDao().findById(user.getUserID()));
        fieldValues.put(StudentExam.EXAM, DAOFactory.getExamDao().findById(examId));

        return getDoingExam(fieldValues);
    }

    public StudentExam getDoingExam(User user) {

        Map<String, Object> fieldValues = new HashMap<>();
        fieldValues.put(StudentExam.STUDENT, DAOFactory.getStudentDao().findById(user.getUserID()));

        return getDoingExam(fieldValues);
    }

    private StudentExam getDoingExam(Map<String, Object> fieldValues) {
        fieldValues.put(StudentExam.EXAM_STATUS, StudentExam.EXAM_DOING);

        List<StudentExam> exams = findByField(fieldValues);
        return exams.isEmpty() ? null : exams.get(0);
    }

    public StudentExam findWithStudent(int id) {
        StudentExam studentExam = null;
        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            TypedQuery<StudentExam> query = em.createQuery(
                    "SELECT se FROM StudentExam se "
                            + "JOIN FETCH se.student "
                            + "JOIN FETCH se.exam "
                            + "WHERE se.id = :id",
                    StudentExam.class);
            query.setParameter("id", id);
            studentExam = query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentExam;
    }

    public List<StudentExam> findByProperty(String propertyName, Object value) {
        List<StudentExam> list = null;
        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e WHERE e." + propertyName + " = :value";
            list = em.createQuery(jpql, entityClass).setParameter("value", value).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public StudentExam findById(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public boolean exists(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    public int countStatus(int examId, int status) {
        String jpql = "SELECT COUNT(se) FROM StudentExam se WHERE se.examStatus = :status AND se.exam.id = :examId";
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            Long count = entityManager.createQuery(jpql, Long.class)
                    .setParameter("status", status)
                    .setParameter("examId", examId)
                    .getSingleResult();
            return count != null ? count.intValue() : 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int countByExam(int examId) {
        String jpql = "SELECT COUNT(se) FROM StudentExam se WHERE se.exam.id = :examId";
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            Long count = entityManager.createQuery(jpql, Long.class)
                    .setParameter("examId", examId)
                    .getSingleResult();
            return count != null ? count.intValue() : 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public Map<Float, Long> countScoreByExam(int examId) {
        String jpql = "SELECT se.score, COUNT(se) "
                + "FROM StudentExam se "
                + "WHERE se.exam.id = :examId "
                + "GROUP BY se.score "
                + "ORDER BY se.score ASC";
        Map<Float, Long> scoreCountMap = new LinkedHashMap<>();
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            List<Object[]> rows = entityManager.createQuery(jpql, Object[].class)
                    .setParameter("examId", examId)
                    .getResultList();

            for (Object[] row : rows) {
                Number scoreNumber = (Number) row[0];
                Float score = scoreNumber.floatValue(); // an toàn
                Long count = (Long) row[1];
                scoreCountMap.put(score, count);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return scoreCountMap;

    }

    public Map<User, Float> getScoresByExam(int examId) {
        String jpql = "SELECT se.student, avg(se.score) "
                + "FROM StudentExam se "
                + "WHERE se.exam.id = :examId"
                + "group by se.student";
        Map<User, Float> scoresMap = new HashMap<>();
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            List<Object[]> results = entityManager.createQuery(jpql, Object[].class)
                    .setParameter("examId", examId)
                    .getResultList();
            for (Object[] result : results) {
                User student = (User) result[0];
                Number scoreNumber = (Number) result[1];
                Float score = scoreNumber.floatValue();
                scoresMap.put(student, score);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return scoresMap;
    }
}
