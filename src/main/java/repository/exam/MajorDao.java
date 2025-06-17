package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Major;
import repository.DeactivatableObjectDao;
import repository.FullOptionDAO;
import repository.SearchableDao;

public class MajorDao extends FullOptionDAO<Major>{

    public MajorDao(EntityManagerFactory entityManagerFactory, Class<Major> entityClass) {
        super(entityManagerFactory, entityClass);
    }

}
