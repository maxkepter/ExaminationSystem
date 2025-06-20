package repository;

public interface DeactivatableDao<E> {
    public void disable(E object);

    public void enable(E object);

    public void isDisable(E object);

    public void update(int id, E object);
}
