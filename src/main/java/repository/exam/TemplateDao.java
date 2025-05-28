package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Template;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class TemplateDao extends DeactivatableObjectDao<Template> implements SearchableDao<Template> {

    public TemplateDao(EntityManagerFactory entityManagerFactory, Class<Template> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Template> findPage(int pageIndex, int pageSize) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findPage'");
    }

    @Override
    public List<Template> findByField(String fieldName, Object value) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByField'");
    }

}
