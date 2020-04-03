const maDiv = document.getElementById("hideMe");

if (maDiv) {
  const hideBtn = document.getElementById("hideBtn");
  hideBtn.addEventListener("click", () => {
    // maDiv.classList.toggle("not-active");
    maDiv.toggleAttribute("hidden");
  });
}
