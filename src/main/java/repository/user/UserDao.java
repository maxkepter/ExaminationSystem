package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.user.User;
import repository.CreatableDao;
import repository.DeletableDao;
import repository.ReadableDao;
import repository.UpdatableDao;

public class UserDao implements CreatableDao<User>, DeletableDao, ReadableDao<User>, UpdatableDao<User> {

    // query string
    private final String FIND_ALL_QUERY = "SELECT users FROM User users";
    private final String COUNT_QUERY = "select count(users) from User users";

    private EntityManagerFactory entityManagerFactory;

    public UserDao(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
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

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public User findById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        User user = null;

        entityManager.getTransaction().begin();

        user = entityManager.find(User.class, id);

        entityManager.getTransaction().commit();
        entityManager.close();

        return user;
    }

    @Override
    public List<User> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<User> users = null;

        entityManager.getTransaction().begin();

        users = entityManager.createQuery(FIND_ALL_QUERY, User.class).getResultList();

        entityManager.getTransaction().commit();
        entityManager.close();
        return users;

    }

    @Override
    public long count() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        long count = 0;

        entityManager.getTransaction().begin();

        count = (long) entityManager.createQuery(COUNT_QUERY).getSingleResult();

        entityManager.getTransaction().commit();
        entityManager.close();

        return count;
    }

    @Override
    public boolean exists(int id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'exists'");
    }

    @Override
    public void delete(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void deleteMany(List<Integer> ids) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteMany'");
    }

    @Override
    public void deleteAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteAll'");
    }

    @Override
    public void create(User object) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.persist(object);
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public void createMany(List<User> objects) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createMany'");
    }

}
