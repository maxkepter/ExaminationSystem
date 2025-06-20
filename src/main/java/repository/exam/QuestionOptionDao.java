package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.exam.QuestionOption;
import repository.DeactivatableObjectDao;

public class QuestionOptionDao extends DeactivatableObjectDao<QuestionOption> {
    private final String FIND_BY_QUESTION = "select e from " + entityClass.getSimpleName()
            + "where e.questionId = :questionId";

    public QuestionOptionDao(EntityManagerFactory entityManagerFactory, Class<QuestionOption> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public List<QuestionOption> getOptionsByQuestionId(int questionId) {
        String jpql = "SELECT o FROM QuestionOption o  WHERE o.question.questionId = :questionId";
        List<QuestionOption> options = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            options = entityManager.createQuery(jpql, QuestionOption.class)
                    .setParameter("questionId", questionId)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return options;
    }

}
