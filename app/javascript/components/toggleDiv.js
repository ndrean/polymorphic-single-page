const maDiv = document.getElementById('hideMe');

if (maDiv) {
    const hideBtn = document.getElementById('hideBtn')
    hideBtn.addEventListener('click', (e) => {
        maDiv.classList.toggle('not-active')
    })
}
