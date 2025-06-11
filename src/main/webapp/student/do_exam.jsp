<%-- 
    Document   : do_exam
    Created on : Jun 10, 2025, 9:59:54 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do Exam</title>
    </head>
    <body>

        <div class="header" ><img
                src="https://s14.gifyu.com/images/bxI4U.gif"
                alt="Di chuột để vào toàn màn hình"
                />
        </div>
        <div class="side-bar">
            <h2>Question </h2>
            <c:forEach var="question" items="${examDetail}" varStatus="qustionNo" >
                <a href="#question-${question.questionId}">${qustionNo.index+1}</a>            
            </c:forEach>       
        </div>
        <div class="content">
            <form action="submitexam" method="post">
                <input type="hidden" name="sizeQuestion" value="${questionSize}">
                <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}"> 
                <div class="content">
                    <c:forEach var="question" items="${examDetail}" varStatus="qustionNo">
                        <div class="question" id="question-${question.questionId}">
                            <p><strong>${qustionNo.index+1}. ${question.content}</strong></p>

                            <c:forEach var="opt" items="${question.options}">
                                <div class="option">
                                    <label>
                                        <input type="checkbox" 
                                               name="answers[${question.questionId}]" 
                                               value="${opt.optionId}" />
                                        ${opt.content}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>                
                    </c:forEach>            
                </div>

                <div style="margin-top: 20px;">
                    <button type="submit">Submit</button>
                </div>
            </form>

            <!--làm một hàm lưu những thay đổi khi chọn đáp án, cứ mỗi 5s thì sẽ gửi về servler bằng ajax-->

        </div>
    </body>
</html>
