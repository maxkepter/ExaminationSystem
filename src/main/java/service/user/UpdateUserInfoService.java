package service.user;

import factory.DAOFactory;
import model.user.User;
import utils.Validate;

public class UpdateUserInfoService {
    public void update(int userid, String newFirstName, String newLastName, String newEmail)
            throws IllegalArgumentException {

        User user = updateUser(userid, newFirstName, newLastName, newEmail);

        // Update user in the database

        DAOFactory.getUserDao().update(user);
    }

    protected User updateUser(int userid, String newFirstName, String newLastName, String newEmail)
            throws IllegalArgumentException {
        // Validate user ID

        if (userid <= 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }

        User user = DAOFactory.getUserDao().findById(userid);

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
        return user;
    }

}
