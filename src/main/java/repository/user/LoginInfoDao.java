package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import model.user.LoginInfo;
import repository.DeleteableObjectDao;

public class LoginInfoDao extends DeleteableObjectDao<LoginInfo> {
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
        entityManager.getTransaction().begin();

        entityManager.merge(object);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public LoginInfo findWithUser(int userId) {
        LoginInfo loginInfo = null;

        try (EntityManager entityManager = this.entityManagerFactory.createEntityManager()) {
            Query query = entityManager.createQuery("SELECT info FROM LoginInfo info WHERE info.user.userID = :userId");
            query.setParameter("userId", userId);
            loginInfo = (LoginInfo) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return loginInfo;

    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePartial'");
    }

}
