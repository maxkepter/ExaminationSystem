function updateTheme() {
  const hour = new Date().getHours();
  let themeName;
  if (hour >= 6 && hour < 12) {
    themeName = "morning";
  } else if (hour >= 12 && hour < 18) {
    themeName = "afternoon";
  } else {
    themeName = "night";
  }

  document.body.classList.remove("morning", "afternoon", "night");
  document.body.classList.add(themeName);
}

updateTheme();
setInterval(updateTheme, 1000);
