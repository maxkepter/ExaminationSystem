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
var count = 0;

function handleTabOut(message) {
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
  var url =
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

function autoSubmit() {
  const form = document.querySelector("form");
  if (form) {
    form.submit();
  }
}
