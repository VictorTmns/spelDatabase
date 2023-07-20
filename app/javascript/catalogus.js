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


    document.getElementsByClassName("catalogus")[0].innerHTML = "";

    if (response[0] == true) {
        displayGames(response);
    } else {
        displayError();
    }
}

function displayGames(response) {
    console.log(response[1].length);

    let pageInfo = "";
    for (let i = 0; i < response[1].length; i++) {
        let currentGame = response[1][i];

        let cardInfo = `
        <div class="spel-previeuw">
        <h2>${currentGame.spelnaam}</h2>
        <br>
        <p>${currentGame.beschrijving}</p>
        <br>
        <div class="tags">
        `
        
        if(currentGame.spelTagList != null)
        {
            for (let j = 0; j < currentGame.spelTagList.length; j++) {
                const currentTag = currentGame.spelTagList[j];
                
                cardInfo += `<div class="tag"><p>${currentTag}</p></div>`;
            }
        }


        cardInfo += `
        </div>
        </div>`;


        pageInfo += cardInfo;
    }

    document.getElementsByClassName("catalogus")[0].innerHTML = pageInfo;
}

function displayError() {
    
}