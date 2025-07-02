package repository.user;

import java.util.List;
import java.util.Map;

import factory.LogStatusFactory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;
import model.user.User;
import repository.DeleteableObjectDao;

public class UserDao extends DeleteableObjectDao<User> {

    public UserDao(EntityManagerFactory entityManagerFactory, Class<User> entityClass) {
        super(entityManagerFactory, entityClass);
    }

    public UserDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory, User.class);
    }

    public void update(User object) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        User userUpdate = (User) object;

        entityManager.getTransaction().begin();

        entityManager.merge(userUpdate);

        entityManager.getTransaction().commit();
        entityManager.close();
    }

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
    public void delete(int id) {
        // TODO Auto-generated method stub
        super.delete(id);
    }

    @Override
    public void deleteAll() {
        // TODO Auto-generated method stub
        super.deleteAll();
    }

    @Override
    public void deleteMany(List<Integer> ids) {
        // TODO Auto-generated method stub
        super.deleteMany(ids);
    }

    public List<User> findAllActive() {
        List<User> users = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            TypedQuery<User> query = entityManager.createQuery(
                    "SELECT u FROM User u JOIN LoginInfo info ON u.userID = info.user.userID WHERE info.status = :status",
                    entityClass);
            query.setParameter("status", LogStatusFactory.getAccountActive());
            users = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;

    }
}
