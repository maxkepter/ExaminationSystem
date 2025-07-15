package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebListener;
import java.util.EnumSet;

@WebListener
public class FilterOrderListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();

        /* ➊ Đăng ký RememberLoginFilter TRƯỚC */
        FilterRegistration.Dynamic remember = ctx.addFilter("RememberLoginFilter", RememberLoginFilter.class);
        remember.addMappingForUrlPatterns(
                EnumSet.of(DispatcherType.REQUEST), // loại dispatcher
                false, // false = chèn mapping Ở ĐẦU chuỗi
                "/*" // pattern
        );

        /* ➋ Đăng ký ExamInProgressFilter SAU */
        FilterRegistration.Dynamic exam = ctx.addFilter("ExamInProgressFilter", ExamInProgressFilter.class);
        exam.addMappingForUrlPatterns(
                EnumSet.of(DispatcherType.REQUEST),
                true, // true = chèn mapping Ở CUỐI chuỗi
                "/*");
    }
}
