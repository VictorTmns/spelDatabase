function InitSearchbar() {
    let request = new XMLHttpRequest();
    
    request.open("POST", `php/catalogusLoad.php`);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.addEventListener("load", Search);
    request.send();

    let searchbar = document.querySelector("#searchbar");
    searchbar.addEventListener("change", Search);
}

function Search(changeEvent) {
    changeEvent.preventDefault();
    let request = new XMLHttpRequest();

    let searchbar = document.querySelector("#searchbar");

    let searchTerm = searchbar.value;

    searchTerm = searchTerm.toLowerCase();

    //console.log(searchTerm);
    
    request.open("POST", `php/catalogusLoad.php`);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.addEventListener("load", spelenFetched);
    request.send(`searchTerm=${searchTerm}`);
}

function spelenFetched(loadEvent) {
    let response = loadEvent.currentTarget.response;
    response = JSON.parse(response);
    console.log(response);

    if (response[0] != false) {
        displayGames();
    } else {
        displayError();
    }
}

function displayGames() {

}

function displayError() {
    
}