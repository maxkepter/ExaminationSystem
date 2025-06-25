package repository;

import java.util.List;
import java.util.Map;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;

public abstract class ObjectDao<E> implements CreatableDao<E>, ReadableDao<E>, SearchableDao<E> {
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

    @Override
    public List<E> findByField(Map<String, Object> fieldValues) throws IllegalArgumentException {
        if (fieldValues == null || fieldValues.isEmpty()) {
            return findAll();
        }

        StringBuilder queryBuilder = new StringBuilder("SELECT b FROM " + entityClass.getSimpleName() + " b WHERE ");

        for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
            String fieldName = entry.getKey();
            Object value = entry.getValue();
            if (value == null) {
                throw new IllegalArgumentException("Value for field " + fieldName + " cannot be null");
            }
            queryBuilder.append("b.").append(fieldName).append(" = :").append(fieldName).append(" AND ");
        }

        // Remove the last AND
        queryBuilder.setLength(queryBuilder.length() - 5);
        List<E> result = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            TypedQuery<E> query = entityManager.createQuery(queryBuilder.toString(), entityClass);

            for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
                String fieldName = entry.getKey();
                Object value = entry.getValue();
                query.setParameter(fieldName, value);
            }

            result = query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error when querying", e);
        }

        return result;
    }

    @Override
    public List<E> findPage(Map<String, Object> fieldValues, int pageIndex, int pageSize)
            throws IllegalArgumentException {

        if (fieldValues == null || fieldValues.isEmpty()) {
            return findAll();
        }

        StringBuilder queryBuilder = new StringBuilder("SELECT b FROM " + entityClass.getSimpleName() + " b WHERE ");

        for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
            String fieldName = entry.getKey();
            Object value = entry.getValue();
            if (value == null) {
                throw new IllegalArgumentException("Value for field " + fieldName + " cannot be null");
            }
            queryBuilder.append("b.").append(fieldName).append(" = :").append(fieldName).append(" AND ");
        }

        // Remove the last AND
        queryBuilder.setLength(queryBuilder.length() - 5);
        List<E> result = null;
        try (EntityManager entityManager = entityManagerFactory.createEntityManager()) {
            TypedQuery<E> query = entityManager.createQuery(queryBuilder.toString(), entityClass);

            for (Map.Entry<String, Object> entry : fieldValues.entrySet()) {
                String fieldName = entry.getKey();
                Object value = entry.getValue();
                query.setParameter(fieldName, value);
            }
            query.setFirstResult(pageSize * pageIndex);
            query.setMaxResults(pageSize);

            result = query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error when querying", e);
        }

        return result;
    }

}
