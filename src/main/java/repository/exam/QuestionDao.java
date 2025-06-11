package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Question;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class QuestionDao extends DeactivatableObjectDao<Question> implements SearchableDao<Question> {

    public QuestionDao(EntityManagerFactory entityManagerFactory, Class<Question> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public QuestionDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Question.class);
    }

    @Override
    public List<Question> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Question> findByField(Map<String, Object> fieldValues) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
