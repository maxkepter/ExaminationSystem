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
        <link rel="stylesheet" href="./css/doExam.css">
        <script src="./js/ExamLog.js"></script>
    </head>
    <body>
        <div class="container">
            <!-- Header -->
            <div class="header">
                <div class="exam-title" style="font-family: 'Segoe UI';">🎓 Examination System</div>
                <div class="timer-section">
                    <div id="countdown" data-endtime="${endTimeMillis}">Test</div>
                    <button class="fullscreen-btn" onclick="toggleFullscreen()">📱 Full Size</button>
                </div>
            </div>
            <div class="sidebar">
                <h2>Question </h2>
                <div class="stats">
                    <span>Đã làm: <strong id="answered-count">0</strong></span>
                    <span>Còn lại: <strong id="remaining-count">${questionSize}</strong></span>
                </div>
                <div class="progress-bar">
                    <div class="progress-fill" id="progress-fill"></div>
                </div>
                <div class="question-nav" id="question-nav">
                    <c:forEach var="question" items="${examDetail}" varStatus="qustionNo" >
                        <a href="#question-${question.questionId}">${qustionNo.index+1}</a>            
                    </c:forEach>  
                </div>
            </div>
            <div class="content">
                <form id="exam-form" action="submitexam" method="post">
                    <input type="hidden" name="sizeQuestion" value="${questionSize}">
                    <input type="hidden" name="studentExamId" id="studentExamId" value="${studentExam.studentExamID}"> 
                    <div class="content">
                        <c:forEach var="question" items="${examDetail}" varStatus="qustionNo">
                            <div class="question" id="question-${question.questionId}">
                                <p><strong>${qustionNo.index+1}. ${question.content}</strong></p>

                                <c:forEach var="opt" items="${question.options}">
                                    <div class="option">
                                        <label>
                                            <input type="checkbox" 
                                                   name="answers[${question.questionId}]" 
                                                   value="${opt.optionId}" 
                                                   data-question-id="${question.questionId}" 
                                                   data-option-id="${opt.optionId}" 
                                                   class="answer-checkbox" 
                                                   <c:if test="${studentChoice[question.questionId] != null 
                                                                 and studentChoice[question.questionId].contains(opt.optionId)}">checked</c:if>
                                                         />
                                            ${opt.content}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>                
                        </c:forEach>            
                    </div>

                    <div class="submit-section">
                        <button type="submit" class="submit-btn" id="sunmit-button"> Submit</button>
                    </div>
                </form>

                <!--làm một hàm lưu những thay đổi khi chọn đáp án, cứ mỗi 5s thì sẽ gửi về servler bằng ajax-->

            </div>
        </div>
        <script>
            /* ----------------- CỜ THEO DÕI ----------------- */
            var endTracking = false;

            /* ----------------- Controll Exam ----------------- */

            function fetchMessage() {

                const url = `${pageContext.request.contextPath}/ControllStudentExam?studentExamId=${studentExam.studentExamID}`;
                        const xhr = new XMLHttpRequest();
                        xhr.open("GET", url, true);                      

                        xhr.onreadystatechange = () => {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                try {
                                    const resp = JSON.parse(xhr.responseText);

                                    const msg = resp.message || '(Không có thông điệp)';
                                    const rawUrl = resp.url;
                                    const url = (rawUrl && rawUrl !== "null") ? rawUrl : null;
                                    
                                    if (url === 'force') {
                                        alert(msg);
                                        sendData("Exam suspended");
                                        autoSubmit();
                                    } else if (url) {
                                        alert(msg);
                                        endTracking = true;
                                        window.location.href = url;
                                    } else {
                                        console.warn("Không có URL để chuyển hướng.");
                                    }

                                    console.log('Đã cập nhật:', resp.message);
                                } catch (e) {
                                    console.error('JSON lỗi:', e);
                                }
                            }
                        };
                        xhr.send();
                    }


                    fetchMessage();
                    setInterval(fetchMessage, 3000);

                    /* ----------------- SỰ KIỆN TRÔN TAB ----------------- */
                    document.addEventListener("visibilitychange", function () {
                        if (document.hidden) {
                            console.log("Student just left tab");
                            handleTabOut("Student just left tab");
                        }
                    });

                    // window.addEventListener("blur", function () {
                    //   console.log("Lost focus on window");
                    //   handleTabOut("Student just left tab");
                    // });

                    const studentExamId = document.getElementById("studentExamId").value;
                    let count = 0;

                    function handleTabOut(message) {
                        if (endTracking)
                            return;                   // Đã ngừng theo dõi

                        if (count < 4) {
                            sendData(message);
                            count++;
                            alert("You just left tab " + count + " time(s). System has logged.");
                        } else if (count === 4) {
                            count++;
                            alert("Exam suspended !");
                            sendData("Exam suspended");
                            autoSubmit();
                        } else {
                            alert("Exam suspended !");
                        }
                    }

                    function sendData(message) {
                        const url =
                                "ExamTracking?message=" +
                                encodeURIComponent(message) +
                                "&studentExamId=" +
                                studentExamId;

                        const request = new XMLHttpRequest();
                        request.open("GET", url, true);
                        request.onreadystatechange = () => {
                            if (request.readyState === XMLHttpRequest.DONE) {
                                if (request.status === 200) {
                                    console.log("Log sent successfully");
                                } else {
                                    console.error("Send log failed");
                                }
                            }
                        };
                        request.send();
                    }

                    /* ----------------- ĐỒNG HỒ ĐẾM NGƯỢC ----------------- */
                    const countdownElement = document.getElementById("countdown");
                    const endTimeMillis = parseInt(countdownElement.dataset.endtime);

                    function updateCountdown() {
                        const now = Date.now();
                        const diff = endTimeMillis - now;

                        if (diff <= 0) {
                            countdownElement.textContent = "Hết giờ";
                            autoSubmit();
                            clearInterval(timer);
                            return;
                        }

                        const minutes = Math.floor(diff / 60000);
                        const seconds = Math.floor((diff / 1000) % 60);

                        countdownElement.textContent =
                                Math.max(0, minutes) + " : " + Math.max(0, seconds);
                    }

                    updateCountdown();
                    const timer = setInterval(updateCountdown, 1000);

                    /* ----------------- SUBMIT TỰ ĐỘNG ----------------- */
                    function autoSubmit() {
                        endTracking = true;                        // Ngừng theo dõi
                        document.getElementById("exam-form").submit();
                    }

                    /* ----------------- KHỞI TẠO TRANG ----------------- */
                    document.addEventListener("DOMContentLoaded", () => {
                        initializeExam();
                        updateProgress();

                        /* ---- NGƯỜI DÙNG ẤN NÚT SUBMIT ---- */
                        document.getElementById("exam-form").addEventListener("submit", () => {
                            endTracking = true;                    // Ngừng theo dõi trước khi submit
                            console.log("Tracking ended by user submit.");
                        });

                        /* ---- LẮNG NGHE CHECKBOX ---- */
                        document.querySelectorAll(".answer-checkbox").forEach((checkbox) => {
                            checkbox.addEventListener("change", function () {
                                handleAnswerChange(this);
                                updateProgress();
                            });
                        });
                    });

                    /* ----------------- XỬ LÝ GIAO DIỆN ----------------- */
                    function initializeExam() {
                        const total = document.querySelectorAll(".question").length;
                        document.getElementById("remaining-count").textContent = total;
                        markCurrentQuestion();
                    }

                    function handleAnswerChange(checkbox) {
                        const qId = checkbox.dataset.questionId;
                        const option = checkbox.closest(".option");

                        if (checkbox.checked) {
                            document
                                    .querySelectorAll(`input[data-question-id="${qId}"]`)
                                    .forEach((cb) => {
                                        if (cb !== checkbox) {
                                            cb.checked = false;
                                            cb.closest(".option").classList.remove("selected");
                                        }
                                    });
                            option.classList.add("selected");
                        } else {
                            option.classList.remove("selected");
                        }
                    }

                    function updateProgress() {
                        const total = document.querySelectorAll(".question").length;
                        const answered = getAnsweredQuestionsCount();

                        document.getElementById("answered-count").textContent = answered;
                        document.getElementById("remaining-count").textContent =
                                total - answered;

                        document.getElementById("progress-fill").style.width =
                                (answered / total) * 100 + "%";

                        updateQuestionNavigation();
                    }

                    function getAnsweredQuestionsCount() {
                        const set = new Set();
                        document
                                .querySelectorAll(".answer-checkbox:checked")
                                .forEach((cb) => set.add(cb.dataset.questionId));
                        return set.size;
                    }

                    function updateQuestionNavigation() {
                        document.querySelectorAll(".question-nav a").forEach((link) => {
                            const qId = link.dataset.question;
                            const hasAns = document.querySelector(
                                    `input[data-question-id="${qId}"]:checked`
                                    );
                            link.classList.toggle("answered", !!hasAns);
                        });
                    }

                    function markCurrentQuestion() {
                        const questions = document.querySelectorAll(".question");
                        const navLinks = document.querySelectorAll(".question-nav a");

                        const observer = new IntersectionObserver(
                                (entries) => {
                            entries.forEach((entry) => {
                                if (entry.isIntersecting) {
                                    const qId = entry.target.id.replace("question-", "");
                                    navLinks.forEach((l) => l.classList.remove("current"));
                                    const current = document.querySelector(
                                            `a[data-question="${qId}"]`
                                            );
                                    if (current)
                                        current.classList.add("current");
                                }
                            });
                        },
                                {threshold: 0.5}
                        );

                        questions.forEach((q) => observer.observe(q));
                    }

                    /* ----------------- FULLSCREEN ----------------- */
                    function toggleFullscreen() {
                        if (!document.fullscreenElement) {
                            document.documentElement.requestFullscreen().catch((err) =>
                                console.log("Error enabling fullscreen:", err)
                            );
                        } else {
                            document.exitFullscreen();
                        }
                    }

                    /* ----------------- NAVIGATION CUỘN MƯỢT ----------------- */
                    document.querySelectorAll(".question-nav a").forEach((link) => {
                        link.addEventListener("click", (e) => {
                            e.preventDefault();
                            const targetId = link.getAttribute("href");
                            const target = document.querySelector(targetId);
                            if (target)
                                target.scrollIntoView({behavior: "smooth", block: "start"});
                        });
                    });
        </script>

    </body>
</html>