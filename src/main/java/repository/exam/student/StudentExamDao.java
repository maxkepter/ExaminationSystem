package repository.exam.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import factory.DAOFactory;
import jakarta.persistence.EntityGraph;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.RollbackException;
import jakarta.persistence.TypedQuery;
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
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            EntityGraph<StudentExam> entityGraph = entityManager.createEntityGraph(entityClass);
            entityGraph.addAttributeNodes(StudentExam.STUDENT);

            Map<String, Object> hints = new HashMap<>();
            hints.put("javax.persistence.fetchgraph", entityGraph);

            studentExam = entityManager.find(entityClass, id, hints);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentExam;
    }

}
