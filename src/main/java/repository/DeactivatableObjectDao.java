package repository;

import jakarta.persistence.EntityManagerFactory;

public abstract class DeactivatableObjectDao<E> extends ObjectDao<E> implements DeactivatableDao<E> {

    public DeactivatableObjectDao(EntityManagerFactory entityManagerFactory) {
        super(entityManagerFactory);
    }

}
