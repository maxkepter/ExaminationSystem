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
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            entityManager.getTransaction().begin();
            entityManager.persist(object);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void createMany(List<E> objects) {

        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            entityManager.getTransaction().begin();
            for (E object : objects) {
                entityManager.persist(object);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public E findById(int id) {
        E object = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            object = entityManager.find(entityClass, id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return object;
    }

    @Override
    public List<E> findAll() {
        List<E> objects = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            objects = entityManager.createQuery("SELECT e FROM " + entityClass.getSimpleName() + " e", entityClass)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return objects;
    }

    @Override
    public long count() {
        long count = 0;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            entityManager.getTransaction().begin();
            count = entityManager
                    .createQuery("SELECT COUNT(e) FROM " + entityClass.getSimpleName() + " e", Long.class)
                    .getSingleResult();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public boolean exists(int id) {
        boolean exists = false;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            entityManager.getTransaction().begin();
            exists = entityManager.find(entityClass, id) != null;
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
        }

        return exists;
    }
}
