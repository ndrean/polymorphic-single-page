const inputToCopy = document.getElementById("to-copy");

const clip = () => {
  const copyButton = document.getElementById("copy-btn");

  /* version with Clipboard API */
  if (navigator.clipboard) {
    copyButton.addEventListener("click", async () => {
      const someText = document.getElementById("to-copy").value;

      await navigator.clipboard.writeText(someText);

      const target = document.getElementById("clipboard");

      target.textContent = await navigator.clipboard.readText();

      inputToCopy.value = "";
    });
  } else {
    /* version avec document.execCommand  si clipboard API not supported*/
    copyButton.addEventListener("click", () => {
      inputToCopy.select();
      document.execCommand("copy");
      const target = document.getElementById("ajax-form");
      //target.document.execCommand('paste')
      navigator.clipboard.readText().then((text) => {
        target.textContent = text;
        inputToCopy.value = ""; // reset the input
      });
    });
  }
};

if (inputToCopy) {
  clip();
}
