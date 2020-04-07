import { fetchWithToken } from "./fetchWithToken";

const $ = (tag) => document.getElementById(tag);
const genreInput = $("inputGenre");
if (genreInput) {
  $("formGenre").addEventListener("submit", (e) => {
    e.preventDefault();
    fetchWithToken("/APIgenres", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ genre: { name: genreInput.value } }),
    })
      .then((response) => response.json())
      .then((data) => {
        const lastTag = data[data.length - 1].name;
        $("display-genres").insertAdjacentHTML(
          "beforeend",
          `<p class='radio-label'> ${lastTag} </p>`
        );
        console.log(data);
      });
  });
}
