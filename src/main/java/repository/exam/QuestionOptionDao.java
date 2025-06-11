package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.exam.Question;
import model.exam.QuestionOption;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class QuestionOptionDao extends DeactivatableObjectDao<QuestionOption> implements SearchableDao<QuestionOption> {
    private final String FIND_BY_QUESTION = "select e from " + entityClass.getSimpleName()
            + "where e.questionId = :questionId";

    public QuestionOptionDao(EntityManagerFactory entityManagerFactory, Class<QuestionOption> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<QuestionOption> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<QuestionOption> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
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
