import { fetchWithToken } from "./fetchWithToken";

const $ = (tag) => document.getElementById(tag);
const genreInput = $("inputGenre");
if (genreInput) {
  $("formCreateGenre").addEventListener("submit", async (e) => {
    e.preventDefault();
    const response = await fetchWithToken("/APIgenres", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ genre: { name: genreInput.value } }),
    });
    const data = await response.json();
    console.log("data", data);
    // const display = (d) => {
    // const lastTag = d[d.length - 1].name;
    $("display-genres").insertAdjacentHTML(
      "beforeend",
      ` <p class="radio-label pr-1 genre-tag" tabindex =${data.id} id="genre_${data.id}"
        data-name=${data.name} >
        <span class="pr-2"> ${data.name} </span>
        <span>
            <a data-method='delete' data-remote="true" href="/genres/${data.id}" rel="nofollow"
                data-confirm: "You can delete this tag only if not used">
              <i class= 'fa fa-times-circle'></i> 
            </a>
        </span>
      </p> `
    );
    $("formCreateGenre").reset();
  });
}
