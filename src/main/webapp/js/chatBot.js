document.addEventListener("DOMContentLoaded", () => {
  // Tạo giao diện chatbot
  const container = document.createElement("div");
  container.className = "chat-container";
  container.innerHTML = `
    <div id="chatbox" style="max-height:300px;overflow-y:auto;border:1px solid #ccc;padding:10px;margin-bottom:10px;background:#fff;"></div>
    <input type="text" id="user-input"  style="width:70%;padding:5px;" />
    <button id="send-btn" style="padding:5px 10px;margin-left:5px;">Gửi</button>
  `;

  document.body.appendChild(container);

  // Gắn sự kiện sau khi phần tử đã được thêm
  document.getElementById("user-input").addEventListener("keydown", (e) => {
    if (e.key === "Enter") sendMessage();
  });

  document.getElementById("send-btn").addEventListener("click", sendMessage);
});

async function sendMessage() {
  const input = document.getElementById("user-input");
  const chatBox = document.getElementById("chatbox");
  const message = input.value.trim();
  if (!message) return;

  // Hiển thị tin nhắn người dùng
  chatBox.innerHTML += `<div><strong>Bạn:</strong> ${message}</div>`;

  try {
    const res = await fetch("http://127.0.0.1:1234/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        model: "gpt-4.0-turbo",
        messages: [{ role: "user", content: message }]
      })
    });

    const data = await res.json();
    const botReply = data.choices?.[0]?.message?.content || "Không có phản hồi.";
    chatBox.innerHTML += `<div><strong>Bot:</strong> ${botReply}</div>`;
    chatBox.scrollTop = chatBox.scrollHeight;
  } catch (err) {
    chatBox.innerHTML += `<div><strong>Bot:</strong> Lỗi kết nối API.</div>`;
    console.error(err);
  }

  input.value = "";
}
