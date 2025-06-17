package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.QuestionOption;
import repository.DeactivatableObjectDao;
import repository.FullOptionDAO;

public class QuestionOptionDao extends FullOptionDAO<QuestionOption> {

    public QuestionOptionDao(EntityManagerFactory entityManagerFactory, Class<QuestionOption> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }
}
