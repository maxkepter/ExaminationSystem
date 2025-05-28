package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.user.User;
import repository.DeleteableObjectDao;
import repository.UpdatableDao;

public class UserDao extends DeleteableObjectDao<User>
        implements UpdatableDao<User> {

    public UserDao(EntityManagerFactory entityManagerFactory, Class<User> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void update(User object) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        User userUpdate = (User) object;

        entityManager.getTransaction().begin();

        entityManager.merge(userUpdate);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void updatePartial(int id, Map<String, Object> fields) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        User user = entityManager.find(User.class, id);

        entityManager.getTransaction().begin();

        if (fields.containsKey(User.USER_FIRSTNAME)) {
            user.setFirstName((String) fields.get(User.USER_FIRSTNAME));
        }
        if (fields.containsKey(User.USER_LASTNAME)) {
            user.setLastName((String) fields.get(User.USER_LASTNAME));
        }
        if (fields.containsKey(User.USER_ROLE)) {
            user.setRole((Integer) fields.get(User.USER_ROLE));
        }
        if (fields.containsKey(User.USER_EMAIL)) {
            user.setEmail((String) fields.get(User.USER_EMAIL));
        }
        entityManager.merge(user);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
