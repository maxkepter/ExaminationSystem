document.addEventListener("DOMContentLoaded", () => {
  const chatToggle = document.getElementById("chat-toggle");
  const chatBox = document.getElementById("chatbox");
  const chatClose = document.getElementById("chat-close");
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
    if (e.key === "Enter") sendMessage();
  });

  // Hàm gửi tin nhắn
  async function sendMessage() {
    const input = document.getElementById("user-input");
    const messages = document.getElementById("chat-messages"); // CHỈ lấy phần chứa message
    const text = input.value.trim();
    if (!text) return;

    messages.innerHTML += `<div class="message user"><strong>Bạn:</strong> ${text}</div>`;

    try {
      console.log({
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "phogpt-4b-chat",
          messages: [{ role: "user", content: text }],
        }),
      });
      const res = await fetch("http://127.0.0.1:1234/v1/chat/completions", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "phogpt-4b-chat",
          messages: [{ role: "user", content: text }],
        }),
      });

      const data = await res.json();
      const reply = data.choices?.[0]?.message?.content || "Không có phản hồi.";
      messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> ${reply}</div>`;
      messages.scrollTop = messages.scrollHeight;
    } catch (err) {
      messages.innerHTML += `<div class="message bot"><strong>Bot:</strong> Lỗi kết nối API.</div>`;
    }

    input.value = "";
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const unwanted = document.querySelector(".chat-container");
  if (unwanted) unwanted.remove();
});
