package service.user;

import factory.EntityManagerFactoryProvider;
import model.user.Student;
import repository.user.StudentDao;

public class GenerateUserCodeService {
    public String generateStudentCode(String firstName, String lastName) {
        if (firstName == null || lastName == null) {
            throw new IllegalArgumentException("First name and last name cannot be null");
        }
        String fullName = (firstName + " " + lastName).trim();
        String[] parts = fullName.split("\\s+");
        if (parts.length == 0) {
            return "";
        }

        StringBuilder code = new StringBuilder();
        // Lấy từ cuối (họ hoặc tên chính) làm gốc
        String mainName = parts[parts.length - 1];
        code.append(mainName);

        // Lấy chữ cái đầu tiên của các phần còn lại (trừ phần cuối)
        for (int i = 0; i < parts.length - 1; i++) {
            if (!parts[i].isEmpty()) {
                code.append(Character.toUpperCase(parts[i].charAt(0)));
            }
        }

        String codeStr = code.toString();

        StudentDao studentDao = new StudentDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Student.class);

        int suffix = 1;
        while (studentDao.findStudentByCode(code.toString()) != null) {
            code.setLength(0); // Xóa nội dung cũ
            code.append(codeStr).append(suffix);
            suffix++;
        }

        return code.toString();
    }

    public static void main(String[] args) {
        System.out.println(new GenerateUserCodeService().generateStudentCode("Nguyen", "Van Anh"));
    }
}
