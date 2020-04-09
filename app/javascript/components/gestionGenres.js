const $ = (tag) => document.querySelector(tag);

const target = $("#display-genres");
if (target) {
  target.addEventListener("click", () => {
    // console.log(document.activeElement);

    $("#genre_to_delete").value = document.activeElement.dataset.name;
    $("#hiddenId").value = document.activeElement.getAttribute("tabindex");
  });
}

// document.addEventListener("click", () => {
//   console.log(document.activeElement);
// });

// https://css-tricks.com/snippets/javascript/loop-queryselectorall-matches/
