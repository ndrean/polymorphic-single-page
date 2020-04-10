const $ = (tag) => document.querySelector(tag);

const target = $("#display-genres");
if (target) {
  target.addEventListener("click", () => {
    $("#genre_to_delete").value = document.activeElement.dataset.name;
    $("#hiddenId").value = document.activeElement.getAttribute("tabindex");
  });
}

// https://css-tricks.com/snippets/javascript/loop-queryselectorall-matches/
