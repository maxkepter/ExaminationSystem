document.addEventListener("DOMContentLoaded", () => {
    const chatToggle = document.getElementById("chat-toggle");
    const chatBox = document.getElementById("chatbox");
//  const chatClose = document.getElementById("chat-close");
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

    // Hàm gửi tin nhắn
    // Hàm gửi tin nhắn
async function sendMessage() {
    const text = input.value.trim();
    if (!text) return;

    messages.innerHTML += `<div class="message user"><strong>Bạn:</strong> ${text}</div>`;

    try {
        const res = await fetch("chat", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                contents: [
                    {
                        role: "user",
                        parts: [
                            {
                                text: `Bạn là trợ lý chatbot cho một trang web giáo dục. Nếu người dùng muốn thực hiện hành động cần đăng nhập như kiểm tra đơn hàng, xem hồ sơ, kết quả thi,... hãy trả lời: "Bạn cần đăng nhập để tiếp tục. Nhấn vào đây: <a href='http://localhost:8080/ExaminationSystem/login.jsp'>Đăng nhập</a>."`
                            }
                        ]
                    },
                    {
                        role: "user",
                        parts: [{ text: text }]
                    }
                ]
            })
        });

        const data = await res.json();
        console.log("Phản hồi từ server:", data);
        console.log("Phản hồi text từ Gemini:", data.candidates?.[0]?.content?.parts?.[0]?.text);


        const parts = data.candidates?.[0]?.content?.parts;
        const reply = parts?.[0]?.text?.trim() || "Không có phản hồi.";

        messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> ${reply}</div>`;
        messages.scrollTop = messages.scrollHeight;
    } catch (err) {
        messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> Lỗi kết nối server.</div>`;
    }

    input.value = "";
}
});