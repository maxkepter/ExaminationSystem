package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

public abstract class DeactivatableObjectDao<E> extends ObjectDao<E> {

    private final String DISABLE_ENTITY = "update e from" + entityClass.getSimpleName()
            + " e set e.isDisable = :isDisable where e.id = :id";
    private final String FIND_DISABLE_ENTITY_BY_ID = "select e from" + entityClass.getSimpleName()
            + " e where e.id = :id and e.isDisable = :isDisable  ";

    public DeactivatableObjectDao(EntityManagerFactory entityManagerFactory, Class<E> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    public void update(int id, E object) {
        // disable old entity
        disable(id);
        // create new entity
        create(object);
    }

    public void disable(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Query query = entityManager.createNamedQuery(DISABLE_ENTITY);
        query.setParameter("id", id).setParameter("isDisable", true);
        query.executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public void enable(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Query query = entityManager.createNamedQuery(DISABLE_ENTITY);
        query.setParameter("id", id).setParameter("isDisable", false);
        query.executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public boolean isDisable(int id) {
        E entity = null;
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        Query query = entityManager.createNamedQuery(FIND_DISABLE_ENTITY_BY_ID);
        query.setParameter("id", id).setParameter("isDisable", true);
        entity = (E) query.getSingleResult();

        entityManager.getTransaction().commit();
        entityManager.close();

        return entity != null;
    }

}
