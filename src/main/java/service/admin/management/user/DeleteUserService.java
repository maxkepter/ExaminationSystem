package service.admin.management.user;

import factory.DAOFactory;
import factory.LogStatusFactory;
import model.user.LoginInfo;
import repository.user.LoginInfoDao;

public class DeleteUserService {

    public void delete(int userId) throws IllegalArgumentException {

        LoginInfoDao loginInfoDao = DAOFactory.getLoginInfoDao();
        LoginInfo loginInfo = loginInfoDao.findWithUser(userId);
        if (loginInfo == null) {
            throw new IllegalArgumentException("Not found user with ID: " + userId);
        }
        // set status to deactive
        loginInfoDao.delete(userId);
    }

}
