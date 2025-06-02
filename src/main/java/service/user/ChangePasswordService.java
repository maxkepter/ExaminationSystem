package service.user;

import exception.login.AuthenticationException;
import factory.EntityManagerFactoryProvider;
import model.user.LoginInfo;
import repository.user.LoginInfoDao;
import utils.HashInfo;
import utils.Validate;

public class ChangePasswordService {
    public void changePassword(int userId, String oldPassword, String newPassword)
            throws IllegalArgumentException, AuthenticationException {
        // Validate inputs
        if (userId <= 0 || !Validate.validateString(oldPassword) || !Validate.validateString(newPassword)) {
            throw new IllegalArgumentException("Invalid input data");
        }

        LoginInfoDao loginInfoDao = new LoginInfoDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                LoginInfo.class);

        // Find user by ID
        LoginInfo loginInfo = loginInfoDao.findById(userId);
        if (loginInfo == null) {
            // If user is not found, throw an IllegalArgumentException
            throw new IllegalArgumentException("User not found");
        }
        // Check if old password matches
        if (!LoginInfo.checkPassword(loginInfo, oldPassword)) {
            // If old password does not match, throw an AuthenticationException
            throw new AuthenticationException("Old password is incorrect");
        }

        // Update password
        loginInfo.setPassword(HashInfo.hash(newPassword));
        loginInfoDao.update(loginInfo);

    }
}
