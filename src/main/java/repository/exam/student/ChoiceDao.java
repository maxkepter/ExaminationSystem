package repository.exam.student;

import jakarta.persistence.EntityManagerFactory;
import model.exam.student.Choice;
import repository.DeactivatableObjectDao;

public class ChoiceDao extends DeactivatableObjectDao<Choice> {

    public ChoiceDao(EntityManagerFactory entityManagerFactory, Class<Choice> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
