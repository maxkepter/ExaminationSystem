package service.admin.management.user;

import exception.login.AuthenticationException;
import model.user.LoginInfo;
import service.user.ChangePasswordService;
import utils.HashInfo;

public class AdminChangePasswordService extends ChangePasswordService {

    @Override
    public void changePassword(int userId, String oldPassword, String newPassword)
            throws IllegalArgumentException, AuthenticationException {
        LoginInfo loginInfo = valiateLoginInfo(userId, oldPassword, newPassword);

        // Update password
        loginInfo.setPassword(HashInfo.hash(newPassword));
        loginInfoDao.update(loginInfo);
    }

}
