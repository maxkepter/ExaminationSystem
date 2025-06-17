import service.student.exam.DoExamService;

public class TestJson {
    public static void main(String[] args) {
        String jsonBody = "{\r\n" + //
                "    \"studentExamId\": \"1022\",\r\n" + //
                "    \"answers\": [\r\n" + //
                "        {\r\n" + //
                "            \"questionId\": \"0\",\r\n" + //
                "            \"optionId\": \"0\",\r\n" + //
                "            \"isChecked\": 1\r\n" + //
                "        },\r\n" + //
                "        {\r\n" + //
                "            \"questionId\": \"0\",\r\n" + //
                "            \"optionId\": \"1\",\r\n" + //
                "            \"isChecked\": 1\r\n" + //
                "        },\r\n" + //
                "        {\r\n" + //
                "            \"questionId\": \"0\",\r\n" + //
                "            \"optionId\": \"2\",\r\n" + //
                "            \"isChecked\": 1\r\n" + //
                "        },\r\n" + //
                "        {\r\n" + //
                "            \"questionId\": \"0\",\r\n" + //
                "            \"optionId\": \"3\",\r\n" + //
                "            \"isChecked\": 1\r\n" + //
                "        }\r\n" + //
                "    ]\r\n" + //
                "}";

        DoExamService doExamService = new DoExamService();
        doExamService.convertJsonToExamChoice(jsonBody);
    }
}
