document.addEventListener("DOMContentLoaded", () => {
    const chatToggle = document.getElementById("chat-toggle");
    const chatBox = document.getElementById("chatbox");
    const sendBtn = document.getElementById("send-btn");
    const input = document.getElementById("user-input");
    const messages = document.getElementById("chat-messages");

    // Mở khung chat khi bấm icon
    chatToggle.addEventListener("click", () => {
        chatBox.classList.toggle("open");
    });

    // Bấm nút gửi
    sendBtn.addEventListener("click", sendMessage);

    // Nhấn Enter để gửi
    input.addEventListener("keydown", (e) => {
        if (e.key === "Enter")
            sendMessage();
    });

    // Biến system prompt (phân tách rõ)
//    const systemPrompt = `You are a chatbot assistant for an educational 
//website and you need to reply in Vietnamese. If the user wants to perform 
//an action that requires login, such as viewing their profile or exam results, 
//reply: "You need to log in to continue. Click here: 
//<a href='http://localhost:8080/ExaminationSystem/login.jsp'>Login</a>.
//If the user has successfully logged in and wants to check their exam 
//results, guide them to navigate to the "View Scores" page."`;

const systemPrompt = loggedInUser
    ? `You are a Vietnamese chatbot assistant. The user "${loggedInUser}" 
has successfully logged in. If they want to view their scores, suggest 
navigating to the My profile and click Exam history page.In case, user 
ask to take they to view exam, give they an link 
<a href="http://localhost:8080/ExaminationSystem/ExamHistory">
View exam history</a>.If not, reply like normal.Even if user asking 
in English, reply in Vietnamese.In case user want a answer in English 
then you reply in English.`
    : `You are a Vietnamese chatbot assistant. The user is not logged 
in. If they want to view their scores, suggest logging in first. Ask 
them if they want to login, give they a link 
<a href="http://localhost:8080/ExaminationSystem/login.jsp">Login</a>. 
If not just reply like normal`;

    // Hàm gửi tin nhắn
    async function sendMessage() {
        const text = input.value.trim();
        if (!text)
            return;

        messages.innerHTML += `<div class="message user"><strong>Bạn:</strong> ${text}</div>`;

        try {
            const response = await fetch("chat", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    contents: [
                        {
                            role: "user",
                            parts: [{text: systemPrompt}]
                        },
                        {
                            role: "user",
                            parts: [{text}]
                        }
                    ]
                })
            });

            const data = await response.json();
            const parts = data.candidates?.[0]?.content?.parts;
            const reply = parts?.[0]?.text?.trim() || "Không có phản hồi.";

            messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> ${reply}</div>`;
            messages.scrollTop = messages.scrollHeight;

        } catch (error) {
            messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> Lỗi kết nối server.</div>`;
            console.error("Lỗi gửi tin nhắn:", error);
        }

        input.value = "";
    }
});
