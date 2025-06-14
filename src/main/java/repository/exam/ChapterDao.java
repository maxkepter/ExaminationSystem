package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Chapter;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class ChapterDao extends DeactivatableObjectDao<Chapter> implements SearchableDao<Chapter> {

    public ChapterDao(EntityManagerFactory entityManagerFactory, Class<Chapter> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

}
