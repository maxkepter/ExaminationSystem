package filter;

import model.user.User;

public class RoleFilter {
    public static boolean isAdmin(User user) {
        if (user == null || user.getRole() == null) {
            return false;
        }
        return user.getRole() != User.USER_ROLE_ADMIN;
    }
}
