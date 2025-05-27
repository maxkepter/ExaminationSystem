import java.util.List;

import factory.EntityManagerFactoryProvider;
import model.user.User;
import repository.user.UserDao;

public class TestDao {
    public static void main(String[] args) {
        TestDao dao = new TestDao();
        UserDao userDao = new UserDao(EntityManagerFactoryProvider.getEntityManagerFactory());

        User user = new User("Test", "Test", 1, "Test");
        userDao.create(user);
        // List<User> users = test.findAll();
        // for (User user : users) {
        // System.out.println(user.toString());
        // }

    }

    public void delete(int id) {
        UserDao test = new UserDao(EntityManagerFactoryProvider.getEntityManagerFactory());
        test.delete(id);
    }

    public void update(User user) {
        UserDao test = new UserDao(EntityManagerFactoryProvider.getEntityManagerFactory());
        test.update(user);
    }
}
