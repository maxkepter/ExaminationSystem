document.addEventListener("DOMContentLoaded", function () {
  const studentExamId = document.getElementById("studentExamId").value;
  let changeBatch = [];
  const checkboxs = document.querySelectorAll(".answer-checkbox");

  checkboxs.forEach((checkbox) => {
    checkbox.addEventListener("change", () => {
      const questionId = checkbox.dataset.questionId;
      const optionId = checkbox.dataset.optionId;
      const isChecked = checkbox.checked ? 1 : 0;

      changeBatch.push({
        questionId: questionId,
        optionId: optionId,
        isChecked: isChecked,
      });
    });
  });

  function sendBatch() {
    if (changeBatch.length === 0) {
      return;
    }

    const payload = {
      studentExamId: studentExamId,
      answers: changeBatch,
    };

    const request = new XMLHttpRequest();
    request.open("POST", "ExamLog", true);
    request.setRequestHeader("Content-Type", "application/json");

    request.onreadystatechange = () => {
      if (request.readyState === XMLHttpRequest.DONE) {
        if (request.status === 200) {
          console.log("Send success");
          console.log(payload);
          changeBatch = [];
        } else {
          console.error("Send batch fail");
        }
      }
    };
    request.send(JSON.stringify(payload));
  }
  //send after 10s
  setInterval(sendBatch, 1000 * 10);
});
