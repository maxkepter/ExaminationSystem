package repository.user;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.user.User;
import repository.DeletableDao;
import repository.ObjectDao;
import repository.UpdatableDao;

public class UserDao extends ObjectDao<User>
        implements DeletableDao, UpdatableDao<User> {

    // query string
    private final String FIND_ALL_QUERY = "SELECT users FROM User users";
    private final String COUNT_QUERY = "select count(users) from User users";
    private final String DELETE_BY_ID = "DELETE FROM User u WHERE u.id = :id";
    private final String DELETE_MANY_BY_ID = "DELETE FROM MyEntity e WHERE e.id IN :ids";

    public UserDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
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
        if (findById(id) == null)
            return false;
        return true;
    }

    @Override
    public void delete(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        entityManager.createQuery(DELETE_BY_ID)
                .setParameter("id", id)
                .executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void deleteMany(List<Integer> ids) {
        final int batchSize = 500;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        for (int i = 0; i < ids.size(); i += batchSize) {
            List<Integer> batch = ids.subList(i, Math.min(i + batchSize, ids.size()));
            entityManager.createQuery(DELETE_MANY_BY_ID)
                    .setParameter("ids", batch)
                    .executeUpdate();
        }

        entityManager.getTransaction().commit();
        entityManager.close();
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
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        for (int i = 0; i < objects.size(); i++) {
            entityManager.persist(objects.get(i));
        }

        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
