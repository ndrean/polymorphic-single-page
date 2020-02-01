const msgAddGenre = document.querySelector('label[for="author_books_attributes_0_genre_click_to_add_new_genre"]');
if (msgAddGenre) {
    msgAddGenre.classList.add("badge", "badge-success");
};

const getCheckboxAddMsg = document.getElementById('author_books_attributes_0_genre_click_to_add_new_genre');
if (getCheckboxAddMsg && getCheckboxAddMsg.checked) {
    alert('do you want to add a new genre?')
};