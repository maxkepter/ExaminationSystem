package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Subject;
import repository.DeactivatableObjectDao;
import repository.FullOptionDAO;
import repository.SearchableDao;

public class SubjectDao extends FullOptionDAO<Subject>{
    
    public SubjectDao(EntityManagerFactory entityManagerFactory, Class<Subject> entityClass) {
        super(entityManagerFactory, entityClass);
    }
    
}
