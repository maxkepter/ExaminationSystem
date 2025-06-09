package repository;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public abstract class DeleteableObjectDao<E> extends ObjectDao<E> implements DeletableDao {

    private final String DELETE_BY_ID = "DELETE FROM " + entityClass.getSimpleName() + " e WHERE e.id = :id";
    private final String DELETE_MANY_BY_ID = "DELETE FROM " + entityClass.getSimpleName() + " e WHERE e.id IN :ids";

    public DeleteableObjectDao(EntityManagerFactory entityManagerFactory, Class<E> entityClass) {
        super(entityManagerFactory, entityClass);
        // TODO Auto-generated constructor stub
    }

    @Override
    public void deleteById(Object id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        entityManager.createQuery(DELETE_BY_ID)
                .setParameter("id", id)
                .executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
