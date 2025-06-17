package repository.exam;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Chapter;
import repository.DeactivatableObjectDao;
import repository.FullOptionDAO;
import repository.SearchableDao;

public class ChapterDao extends FullOptionDAO<Chapter>{
    
    public ChapterDao(EntityManagerFactory entityManagerFactory, Class<Chapter> entityClass) {
        super(entityManagerFactory, entityClass);
    }
    

}
