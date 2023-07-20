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
    

    document.getElementById("titel").innerHTML = response.naam;

    
    let tags = "";
    for (let i = 0; i < response.spelTagList.length; i++) {
        let tag = response.spelTagList[i];
        let tagtItem = `
            <li class="tag">
                ${tag}
            </li>`;
            tags = tags + tagtItem;

    }
    document.getElementById("tags").innerHTML = tags;


    document.getElementById("beschrijving").innerHTML = response.beschrijving;


    if (response.foto !== null) {
        document.getElementById("spelFoto").innerHTML = `<img class="spel-img" src="images/spelImages/${response.foto}">`
    }


    let spelTeksten = "<h1>Speluitleg</h1>";
    for (let i = 0; i < response.spelUitlegTeksten.length; i++) {
        let spelTekst = response.spelUitlegTeksten[i];
        let spelTekstItem = "<li>";

        if (spelTekst.titel !== null) {
            spelTekstItem = spelTekstItem + "<h2>" + spelTekst.titel + "</h2>";
        }

        if (spelTekst.foto !== null) {
            spelTekstItem = spelTekstItem + `<div class="text-image-binder">`;
        }

        spelTekstItem = spelTekstItem + `<p>` + spelTekst.inhoud + `</p>`;
        
        if (spelTekst.foto !== null) {
            spelTekstItem = spelTekstItem + `<img class="spelImage" src="images/spelImages/` + spelTekst.foto + `"></img></div>`;
        }

        spelTeksten = spelTeksten + spelTekstItem + "</li><br>";
    }

    if (response.autheur.allowCredits !== "0") {
        document.getElementById("autheur").innerHTML = `<p> ${response.autheur.voornaam} (${response.autheur.totem})</p>`
    }

    document.getElementById("spelUitleg").innerHTML = spelTeksten;

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

