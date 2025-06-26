package service.user;

import factory.DAOFactory;
import model.user.User;
import utils.Validate;

public class UpdateUserInfoService {
    public void update(User user, String newFirstName, String newLastName, String newEmail)
            throws IllegalArgumentException {
        updateUser(user, newFirstName, newLastName, newEmail);

        // Update user in the database

        DAOFactory.getUserDao().update(user);
    }

    protected void updateUser(User user, String newFirstName, String newLastName, String newEmail)
            throws IllegalArgumentException {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (!Validate.validateString(newEmail) || !Validate.validateString(newFirstName)
                || !Validate.validateString(newLastName)) {
            throw new IllegalArgumentException("Invalid input data");
        }

        // Set new values
        user.setFirstName(newFirstName);
        user.setLastName(newLastName);
        user.setEmail(newEmail);
    }

}
