inputToCopy = document.getElementById('to-copy');
if (inputToCopy) {
    doCopyButton = document.getElementById('do-copy');
    doCopyButton.addEventListener('click', function(e) {
        e.preventDefault();
        inputToCopy.select();
        document.execCommand('copy');
        const target = document.getElementById('ajax-form');
        //target.document.execCommand('paste')
        navigator.clipboard.readText()
            .then(text => {
                console.log(text);
                target.innerText = text;
                inputToCopy.value = "";
            })   
        }
    )
}
