package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Major;
import repository.DeactivatableObjectDao;

public class MajorDao extends DeactivatableObjectDao<Major> {

    public MajorDao(EntityManagerFactory entityManagerFactory, Class<Major> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
