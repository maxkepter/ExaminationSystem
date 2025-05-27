package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;
import model.user.LoginInfo;
import repository.CreatableDao;
import repository.ReadableDao;
import repository.UpdatableDao;

public class LoginInfoDao implements ReadableDao<LoginInfo>, UpdatableDao<LoginInfo>, CreatableDao<LoginInfo> {
    private final String FIND_BY_USERNAME_QUERY = "select info from LoginInfo info where info.UserName=:UserName";

    private EntityManagerFactory entityManagerFactory;

    public LoginInfoDao(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }

    @Override
    public void create(LoginInfo object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'create'");
    }

    @Override
    public void createMany(List<LoginInfo> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

    @Override
    public void update(LoginInfo object) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

    @Override
    public LoginInfo findById(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public List<LoginInfo> findAll() {
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

    public LoginInfo findByUserName(String userName) {
        LoginInfo loginInfo = null;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Query query = entityManager.createQuery(FIND_BY_USERNAME_QUERY);
        query.setParameter("UserName", userName);
        loginInfo = (LoginInfo) query.getSingleResult();

        entityManager.getTransaction().commit();
        entityManager.close();

        return loginInfo;
    }

}
