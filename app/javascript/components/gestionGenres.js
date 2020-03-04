document.addEventListener('click', () => {
    console.log(document.activeElement.id); //.nextElementSibling);
});

// if (genresList.length>0) {    
//     const selectedGenre = document.getElementById("author_books_attributes_0_genre_id");
//     // if (document.activeElement.id == document.getElementById("author_books_attributes_0_title").id) {
//         console.log(document.activeElement);
//         selectedGenre.value = "0";
//         genresList.forEach((genre) => {
//             genre.addEventListener('click', () => {
//                 selectedGenre.value = genre.value;
//                 console.log(genre.value);
//                 genresList.forEach((g) => {
//                     console.log(g.value, g.checked);
//                     if (g.checked) {
//                         g.nextElementSibling.classList.add('active');
                        
//                     } else {
//                         g.nextElementSibling.classList.remove('active')
//                     }
//                 })
//             })
//         })
//     }) 
// }


// https://css-tricks.com/snippets/javascript/loop-queryselectorall-matches/
