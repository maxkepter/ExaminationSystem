package service.admin.management.user;

import factory.DAOFactory;
import model.user.User;
import service.user.UpdateUserInfoService;

public class AdminUpdateUserInfoService extends UpdateUserInfoService {

    public void update(int userId, String newFirstName, String newLastName, String newEmail, int role)
            throws IllegalArgumentException {
        if (!User.validateRole(role)) {
            throw new IllegalArgumentException("Invalid role !");
        }

        User user = updateUser(userId, newFirstName, newLastName, newEmail, role);

        DAOFactory.getUserDao().update(user);

    }

    protected User updateUser(int userId, String newFirstName, String newLastName, String newEmail, int role)
            throws IllegalArgumentException {
        if (!User.validateRole(role)) {
            throw new IllegalArgumentException("Invalid role !");
        }

        User user = super.updateUser(userId, newFirstName, newLastName, newEmail);
        user.setRole(role);
        return user;
    }

}
