package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Difficulty;
import repository.DeactivatableObjectDao;

public class DifficultyDao extends DeactivatableObjectDao<Difficulty> {

    public DifficultyDao(EntityManagerFactory entityManagerFactory, Class<Difficulty> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
