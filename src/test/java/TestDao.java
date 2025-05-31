
import factory.EntityManagerFactoryProvider;
import model.user.User;
import repository.user.UserDao;
import utils.HashInfo;

public class TestDao {
    public static void main(String[] args) {
        String str = "TestString";
        System.out.println(str);
        str = HashInfo.hash(str);
        System.out.println(str);

        UserDao userDao = new UserDao(EntityManagerFactoryProvider.getEntityManagerFactory(), User.class);
        User user = new User("TestUser", "TestUser", 1, "Test");
        userDao.create(user);
        System.out.println(user.getUserID());

    }
}
