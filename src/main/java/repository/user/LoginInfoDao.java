package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import model.user.LoginInfo;
import repository.ObjectDao;
import repository.UpdatableDao;

public class LoginInfoDao extends ObjectDao<LoginInfo> implements UpdatableDao<LoginInfo> {
    public LoginInfoDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, LoginInfo.class);
    }

    private final String FIND_BY_USERNAME_QUERY = "select info from LoginInfo info where info.userName=:userName";

    public LoginInfo findByUserName(String userName) {
        LoginInfo loginInfo = null;
        EntityManager entityManager = this.entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createQuery(FIND_BY_USERNAME_QUERY);
            query.setParameter("userName", userName.trim());
            loginInfo = (LoginInfo) query.getSingleResult();
            entityManager.getTransaction().commit();
        } catch (NoResultException e) {
            return null; // No result found
        } finally {
            entityManager.close();
        }

        return loginInfo;
    }

    @Override
    public void update(LoginInfo object) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        LoginInfo loginInfoUpdate = (LoginInfo) object;

        entityManager.getTransaction().begin();

        entityManager.merge(loginInfoUpdate);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

    @Override
    public LoginInfo findById(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

}
