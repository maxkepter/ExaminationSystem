package service.admin.management.user;

import factory.DAOFactory;
import model.user.User;
import service.user.UpdateUserInfoService;

public class AdminUpdateUserInfoService extends UpdateUserInfoService {

    public void update(User user, String newFirstName, String newLastName, String newEmail, int role)
            throws IllegalArgumentException {
        if (!User.validateRole(role)) {
            throw new IllegalArgumentException("Invalid role !");
        }

        updateUser(user, newFirstName, newLastName, newEmail, role);

        DAOFactory.getUserDao().update(user);

    }

    protected void updateUser(User user, String newFirstName, String newLastName, String newEmail, int role)
            throws IllegalArgumentException {
        user.setRole(role);
        super.updateUser(user, newFirstName, newLastName, newEmail);
    }

}
