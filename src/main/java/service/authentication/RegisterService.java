package service.authentication;

import exception.register.UserNameDuplicatedException;
import factory.DAOFactory;
import factory.EntityManagerFactoryProvider;
import factory.LogStatusFactory;
import model.user.LoginInfo;
import model.user.Student;
import model.user.User;
import repository.user.StudentDao;
import service.log.LogService;
import service.log.LoginLogService;
import service.user.GenerateUserCodeService;
import utils.HashInfo;
import utils.Validate;

public class RegisterService {
    public User register(String userName, String password, User user)
            throws IllegalArgumentException, UserNameDuplicatedException {
        LogService logService = new LoginLogService();
        // Validate the input parameters
        if (!Validate.validateString(userName) || !Validate.validateString(password)) {
            throw new IllegalArgumentException("Username or password cannot be blank !");
        }

        // Validate the user object
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null !");
        }

        // Check if the username already exists
        if (DAOFactory.LOGIN_INFO_DAO.findByUserName(userName) != null) {
            throw new UserNameDuplicatedException();
        }

        // Create and save a new LoginInfo object
        // Password should be hashed before saving
        LoginInfo loginInfo = new LoginInfo(
                user.getUserID(),
                user,
                userName,
                HashInfo.hash(password),
                LogStatusFactory.ACCOUNT_ACTIVE);
        DAOFactory.LOGIN_INFO_DAO.create(loginInfo);

        // Log the registration success

        logService.createUserLog(user, LogStatusFactory.REGISTRATION_SUCCESS);

        createStudent(user);

        return user;
    }

    private void createStudent(User user) {
        GenerateUserCodeService generateUserCodeService = new GenerateUserCodeService();
        String studentCode = generateUserCodeService.generateStudentCode(user.getFirstName(), user.getLastName());
        StudentDao studentDao = new StudentDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Student.class);

        studentDao.create(new Student(user.getUserID(), studentCode));
    }
}
