package repository.exam;

import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import model.exam.QuestionOption;
import repository.DeactivatableObjectDao;

public class QuestionOptionDao extends DeactivatableObjectDao<QuestionOption> {

    public QuestionOptionDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void disable(QuestionOption object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'disable'");
    }

    @Override
    public void enable(QuestionOption object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'enable'");
    }

    @Override
    public void isDisable(QuestionOption object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'isDisable'");
    }

    @Override
    public void update(int id, QuestionOption object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void create(QuestionOption object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<QuestionOption> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public QuestionOption findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<QuestionOption> findAll() {
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

}
