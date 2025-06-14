package repository.log;

import java.time.LocalDateTime;
import java.util.List;

import model.user.User;
import repository.CreatableDao;
import repository.ReadableDao;
import repository.SearchableDao;

public interface LogDao<E> extends ReadableDao<E>, CreatableDao<E>, SearchableDao<E> {
    // find within a specific time range
    List<E> findByTimeRange(LocalDateTime startTime, LocalDateTime endTime);

    // find within a specific time range by user
    List<E> findByTimeRange(User user, LocalDateTime startTime, LocalDateTime endTime);

}
