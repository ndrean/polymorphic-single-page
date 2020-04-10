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
      if (response.ok) {
        $("genre_" + id).remove();
        $("formDeleteGenre").reset();
      }
    } catch {
      (err) => console.log("impossible", err);
    }
  });
}
