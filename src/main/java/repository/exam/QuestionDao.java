package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Question;
import repository.DeactivatableObjectDao;
import repository.FullOptionDAO;
import repository.SearchableDao;

public class QuestionDao extends FullOptionDAO<Question>{
    
    public QuestionDao(EntityManagerFactory entityManagerFactory, Class<Question> entityClass) {
        super(entityManagerFactory, entityClass);
    }
}
