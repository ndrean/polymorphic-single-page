import { fetchWithToken } from "./fetchWithToken";

const $ = (tag) => document.getElementById(tag);

const deleteGenre = $("genre_to_delete");

if (deleteGenre) {
  $("formDeleteGenre").addEventListener("submit", async (e) => {
    e.preventDefault();
    const id = $("hiddenId").value;
    try {
      const response = await fetchWithToken("/APIdestroy/" + id, {
        method: "DELETE",
      });
      const msg = await response.json();
      console.log("deleted", msg);
    } catch {
      (err) => console.log(err);
    }
    $("genre_" + id).remove();
    $("formDeleteGenre").reset();
  });
}
