package repository;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public abstract class ObjectDao<E> implements CreatableDao<E>, ReadableDao<E> {
    protected EntityManagerFactory entityManagerFactory;
    protected final Class<E> entityClass;

    public ObjectDao(EntityManagerFactory entityManagerFactory, Class<E> entityClass) {
        this.entityClass = entityClass;
        this.entityManagerFactory = entityManagerFactory;
    }

    @Override
    public void create(E object) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(object);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void createMany(List<E> objects) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        for (E object : objects) {
            entityManager.persist(object);
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public E findById(Object id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        E object = entityManager.find(entityClass, id);
        entityManager.getTransaction().commit();
        entityManager.close();
        return object;
    }

    @Override
    public List<E> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        List<E> objects = entityManager.createQuery("SELECT e FROM " + entityClass.getSimpleName() + " e", entityClass)
                .getResultList();
        entityManager.getTransaction().commit();
        entityManager.close();
        return objects;
    }

    @Override
    public long count() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        long count = entityManager.createQuery("SELECT COUNT(e) FROM " + entityClass.getSimpleName() + " e", Long.class)
                .getSingleResult();
        entityManager.getTransaction().commit();
        entityManager.close();
        return count;
    }

    @Override
    public boolean exists(Object id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        boolean exists = entityManager.find(entityClass, id) != null;
        entityManager.getTransaction().commit();
        entityManager.close();
        return exists;
    }
}
