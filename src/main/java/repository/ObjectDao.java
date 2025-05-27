package repository;

import jakarta.persistence.EntityManagerFactory;

public abstract class ObjectDao<E> implements CreatableDao<E>, ReadableDao<E> {
    protected EntityManagerFactory entityManagerFactory;

    public ObjectDao(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }
}
