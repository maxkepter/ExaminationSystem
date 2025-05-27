package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.Template;
import repository.DeactivatableObjectDao;
import repository.SearchableDao;

public class TemplateDao extends DeactivatableObjectDao<Template> implements SearchableDao<Template> {

    public TemplateDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void disable(Template object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'disable'");
    }

    @Override
    public void enable(Template object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'enable'");
    }

    @Override
    public void isDisable(Template object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'isDisable'");
    }

    @Override
    public void update(int id, Template object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public Template findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<Template> findAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    @Override
    public long count() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'count'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public void create(Template object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<Template> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
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
