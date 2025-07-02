package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Major;
import repository.FullOptionDAO;

public class MajorDao extends FullOptionDAO<Major> {

    public MajorDao(EntityManagerFactory entityManagerFactory, Class<Major> entityClass) {
        super(entityManagerFactory, entityClass);
    }

}
