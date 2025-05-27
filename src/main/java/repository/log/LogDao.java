package repository.log;

import repository.CreatableDao;
import repository.PageableDao;
import repository.ReadableDao;
import repository.SearchableDao;

public interface LogDao<E> extends ReadableDao<E>, CreatableDao<E>, SearchableDao<E>, PageableDao<E> {

}
