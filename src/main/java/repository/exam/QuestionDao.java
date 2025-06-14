package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Question;
import repository.DeactivatableObjectDao;

public class QuestionDao extends DeactivatableObjectDao<Question> {

    public QuestionDao(EntityManagerFactory entityManagerFactory, Class<Question> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public QuestionDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, Question.class);
    }

}
