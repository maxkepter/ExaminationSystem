package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;
import model.user.LoginInfo;
import repository.ObjectDao;
import repository.UpdatableDao;

public class LoginInfoDao extends ObjectDao<LoginInfo> implements UpdatableDao<LoginInfo> {
    public LoginInfoDao(EntityManagerFactory entityManagerFactory, Class<LoginInfo> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    private final String FIND_BY_USERNAME_QUERY = "select info from LoginInfo info where info.UserName=:UserName";

    private EntityManagerFactory entityManagerFactory;

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

}
