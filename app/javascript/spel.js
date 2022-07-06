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

function gameFetched() {

}