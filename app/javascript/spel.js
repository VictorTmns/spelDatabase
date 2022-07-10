function LoadGameContent() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const spelID = urlParams.get('spelID');
    console.log(spelID);

    let request = new XMLHttpRequest();

    request.open("POST", `php/spelLoad.php`);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.addEventListener("load", gameFetched);
    request.send(`spelID=${spelID}`);
}

function gameFetched(loadEvent) {
    let response = loadEvent.currentTarget.response;
    response = JSON.parse(response);
    console.log(response);

    if (response.fetchSucces == true) {
        displayContent(response);
    } else {
        displayError(response);
    }
}

function displayContent(response) {
    
}

function displayError(response) {
    let error = `
    <div id="errorDisplay">
    <p>error:</p>
    <p id="error">${response.error}</p>
    </div>
    `;
    document.getElementsByClassName("spel-content")[0].innerHTML = error;
}

