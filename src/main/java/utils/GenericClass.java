package utils;

public class GenericClass<E> {
    private Class<E> entityClass;

    public GenericClass(Class<E> entityClass) {
        this.entityClass = entityClass;
    }

    public Class<E> getEntityClass() {
        return entityClass;
    }
}
