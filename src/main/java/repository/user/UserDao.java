package repository.user;

import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.user.User;
import repository.DeleteableObjectDao;

public class UserDao extends DeleteableObjectDao<User> {

    public UserDao(EntityManagerFactory entityManagerFactory, Class<User> entityClass) {
        super(entityManagerFactory, entityClass);
    }

    public UserDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, User.class);
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
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public User findById(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public boolean exists(Object id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

}
