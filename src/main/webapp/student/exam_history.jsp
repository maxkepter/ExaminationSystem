<%-- 
    Document   : user_info
    Created on : May 30, 2025, 8:06:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam History - FPT University</title>
        <link href="css/user_info.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-left">
                <a href="Home" class="logo">🎓 EXAMINATION SYSTEM</a>
                <span class="school-name"></span>
            </div>
            <div class="navbar-right">
                <span><i class="fa fa-user"></i> <strong>${user.firstName} ${user.lastName}</strong></span>
                <img src="https://cmshn.fpt.edu.vn/theme/image.php/trema/core/1697438386/u/f2" 
                     class="userpicture defaultuserpic" 
                     width="35" height="35" 
                     role="presentation" 
                     aria-hidden="true"
                     alt="User Avatar">
            </div>
        </div>

        <!-- Main Content -->
        <div class="content">
            <!-- Sidebar Navigation -->
            <div class="sidebar">
                <a href="UserProfile"><i class="fa fa-user"></i> User Profile</a>
                <a href="ExamHistory" class="active"><i class="fa fa-history"></i> View Exam History</a>
                <a href="ChangePassword"><i class="fa fa-lock"></i> Change Password</a>
                <a href="Logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>

            <!-- Main Content Area -->
            <div class="main-content">
                <div class="form-container">
                    <h1><i class="fa fa-user-edit"></i> Exam history</h1>

                    <!-- Success Message -->
                    <c:if test="${not empty success}">
                        <div class="success">
                            <i class="fa fa-check-circle"></i> ${success}
                        </div>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="error">
                            <i class="fa fa-exclamation-triangle"></i> ${error}
                        </div>
                    </c:if>
                    <div class="content"></div>
                    <c:forEach var="studentExam" items="${studentExams}" varStatus="examNo">
                        <div>
                            <p><strong>${examNo.index + 1}.${studentExam.exam.examName}</strong></p>
                            <p>Score: ${studentExam.score}</p>

                            <p>Start:${studentExam.startTimeFormatted}</p>
                            <p>Submit:${studentExam.submitTimeFormatted}</p>
                            <p>${studentExam.statusInfo}</p>
                            <a href="${pageContext.request.contextPath}/ExamHistory/viewexam?studentExamID=${studentExam.studentExamID}">View exam</a>
                        </div>
                    </c:forEach>
                    <!-- Pagination buttons -->
                    <form action="ExamHistory" method="get">
                        <c:if test="${numPage > 0}">
                            <button type="submit" name="numPage" value="${numPage - 1}">Previous</button>
                        </c:if>

                        <button type="submit" name="numPage" value="${numPage}">${numPage + 1}</button>

                        <c:if test="${numPage < maxNumPage}">
                            <button type="submit" name="numPage" value="${numPage + 1}">Next</button>
                        </c:if>
                    </form>

                    <form action="ExamHistory" method="get"
                          onsubmit="return adjustPageNumber()">
                        <label for="numPage">Page:</label> <input type="number" id="numPage"
                                                                  name="numPage" value="${numPage+1}" min="1"
                                                                  max="${maxNumPage+1}" required />
                        <button type="submit">Go</button>
                    </form>

                    <script>
                        function adjustPageNumber() {
                            const input = document.getElementById('numPage');
                            input.value = parseInt(input.value) - 1;
                            return true
                        }
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>