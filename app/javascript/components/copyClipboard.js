inputToCopy = document.getElementById("to-copy");
copyButton = document.getElementById("copy-btn");

/* version with Clipboard API */
if (inputToCopy && navigator.clipboard) {
  copyButton.addEventListener("click", () => {
    const val = document.getElementById("to-copy").value;
    navigator.clipboard.writeText(val).then(() => {
      navigator.clipboard.readText().then(text => {
        const target = document.getElementById("clipboard");
        target.textContent = text;
      });
      inputToCopy.value = "";
    });
  });
} else {
  /* version avec document.execCommand  */
  copyButton.addEventListener("click", () => {
    inputToCopy.select();
    document.execCommand("copy");
    const target = document.getElementById("ajax-form");
    //target.document.execCommand('paste')
    navigator.clipboard.readText().then(text => {
      target.textContent = text;
      inputToCopy.value = ""; // reset the input
    });
  });
}
