package repository.exam;

import jakarta.persistence.EntityManager;
import java.util.List;
import jakarta.persistence.EntityManagerFactory;
import model.exam.Question;
import repository.FullOptionDAO;

public class QuestionDao extends FullOptionDAO<Question> {

    public QuestionDao(EntityManagerFactory entityManagerFactory, Class<Question> entityClass) {
        super(entityManagerFactory, entityClass);
    }

    public QuestionDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Question.class);
    }

    @Override
    public List<Question> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        String jpql = "Select u FROM " + entityClass.getSimpleName() + " u ";
        return entityManager.createQuery(jpql, entityClass).getResultList();

    }

    public List<Question> findByProperties(String propertyName1, Object value1, String propertyName2, Object value2) {
        try (EntityManager em = entityManagerFactory.createEntityManager()) {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e " +
                    "WHERE e." + propertyName1 + " = :value1 AND e." + propertyName2 + " = :value2";
            return em.createQuery(jpql, entityClass)
                    .setParameter("value1", value1)
                    .setParameter("value2", value2)
                    .getResultList();
        }
    }
}
