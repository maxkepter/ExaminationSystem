package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.QuestionOption;
import repository.DeactivatableObjectDao;

public class QuestionOptionDao extends DeactivatableObjectDao<QuestionOption> {

    public QuestionOptionDao(EntityManagerFactory entityManagerFactory, Class<QuestionOption> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }
}
