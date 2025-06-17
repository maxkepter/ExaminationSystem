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
        try (EntityManager entityManager = entityManagerFactory.createEntityManager();) {
            entityManager.getTransaction().begin();
            for (int i = 0; i < ids.size(); i += batchSize) {
                List<Integer> batch = ids.subList(i, Math.min(i + batchSize, ids.size()));
                entityManager.createQuery(DELETE_MANY_BY_ID)
                        .setParameter("ids", batch)
                        .executeUpdate();
            }

            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteAll() {
    }

}
