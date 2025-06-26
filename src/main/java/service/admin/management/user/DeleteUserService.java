package service.admin.management.user;

import factory.DAOFactory;
import repository.user.UserDao;

public class DeleteUserService {

    public void delete(int userId) throws IllegalArgumentException {

        UserDao userDao = DAOFactory.getUserDao();

        if (!userDao.exists(userId)) {
            throw new IllegalArgumentException("Not found user with ID: " + userId);
        }

        userDao.delete(userId);

    }

}
