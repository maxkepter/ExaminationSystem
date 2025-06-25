package repository.exam;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Chapter;
import repository.FullOptionDAO;

public class ChapterDao extends FullOptionDAO<Chapter> {

    public ChapterDao(EntityManagerFactory entityManagerFactory, Class<Chapter> entityClass) {
        super(entityManagerFactory, entityClass);
    }

}
