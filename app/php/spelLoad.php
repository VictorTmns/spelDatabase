<?php
session_start();
//een php sessie starten

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
//error display


require_once("secrets.php");
// ophalen credentials

$conn = new mysqli($servername, $username, $password, $dbname);

$response = array();
// een lege array aanmaken waar we onze opgehaalde data in kunnen schrijven,
// we behandelen deze als een object want we krijgen maximaal 1 spel terug
$response["fetchSucces"] = true;
// we zetten het succes van deze fetch op true als er ergens een error gebeurt wordt deze false
$error = array();
// een array waar we errors kunnen schrijven


if ($conn == false) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, onze poging om connectie te maken met de database is geweigerd";
    die(json_encode($error));
}
// error bericht voor als er een fout is met onze database credentials

if ($conn->connect_error) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, we kunnen geen connectie maken met de database";
    die(json_encode($error));
}
// error bericht voor als er een fout is met de database

$spelID = $_POST["spelID"];

if ($spelID == "") {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, geef een spelID in om een spel weer te geven";


    die(json_encode($error));
}
// error bericht voor als het spelID niet wordt meegegeven


$getSpelDetails = "
SELECT spelen.spelID, spelen.spelnaam, spelen.beschrijving, spelen.autheurID, spelen.fotoFileName, spelen.goedgekeurd
FROM spelen
WHERE spelen.spelID = '$spelID';
";
// de sql-query die we gebruiken om de tafel spelen op te vragen waar het spelID
// overeenkomt met het gevraagde spelID

$spelDetails = $conn->query($getSpelDetails);
// uitvoeren van de sql-query


if ($spelDetails->num_rows == 0) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, dit spelID staat niet in onze database";

    die(json_encode($error));
} else {
    $spelDetails = $spelDetails->fetch_assoc();

    if($spelDetails["goedgekeurd"] == 1) {
        
        $response["ID"]= $spelDetails["spelID"];
        $response["naam"]= $spelDetails["spelnaam"];
        $response["beschrijving"]= $spelDetails["beschrijving"];
        $response["foto"]= $spelDetails["fotoFileName"];
    } else {
        $error["fetchSucces"] = false;
        $error["error"] = "sorry, dit spel is nog niet goedkeurd";    

        die(json_encode($error));
    }
};
// We checken of het resultaat van de query content heeft (is er een gematcht spelID)
// als dit niet is sturen we een error bericht terug met uitleg
// anders halen we de data op met de 'fetch_assoc()' functie
// we zetten de opgehaalde data dan in het response object



$getSpelTags = "
SELECT spelTags.tag
FROM spelTags
WHERE spelTags.spelID = '$spelID';
";

$spelTags = $conn->query($getSpelTags);

if ($spelTags->num_rows == 0) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, we konden de tags van dit spel niet krijgen";

    die(json_encode($error));
} else {

    if ($result = $conn -> query($getSpelTags)) {
        while ($row = $result -> fetch_row()) {

            $spelTagList[]= $row[0];
        }
    mysqli_free_result($result);
    };

    $response['spelTagList'] = $spelTagList;
};



$getSpeluitlegTeksten = "
SELECT spelUitlegTeksten.tekstID, spelUitlegTeksten.titel, spelUitlegTeksten.inhoud, spelUitlegTeksten.fotoFileName
FROM spelUitlegTeksten
WHERE spelUitlegTeksten.SpelID = '$spelID';
";

$speluitlegTeksten = $conn->query($getSpeluitlegTeksten);


if ($speluitlegTeksten->num_rows == 0) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, dit we konden geen uitleg krijgen voor dit spel";
    die(json_encode($error));
}else {
    $speluitlegTeksten = $speluitlegTeksten->fetch_assoc();

    $a = 0;

    if ($result  = $conn -> query($getSpeluitlegTeksten)) {
        while ($row = $result -> fetch_row()) {
            $uitlegTekst = [];

            $uitlegTekst["tekstID"]= $row[0];
            $uitlegTekst["titel"]= $row[1];
            $uitlegTekst["inhoud"]= $row[2];
            $uitlegTekst["foto"]= $row[3];

            $speluitlegTekstenLijst[]= $uitlegTekst;
            $a = $a +1;
        }
    mysqli_free_result($result);
    }

    $response['spelUitlegTeksten']= $speluitlegTekstenLijst;

};



$getSpelAutheur = "
SELECT autheurs.voornaam, autheurs.totem, autheurs.allowCredits
FROM spelen
INNER JOIN autheurs ON spelen.autheurID = autheurs.autheurID
WHERE spelen.spelID = '$spelID';
";
// de sql-query die we gebruiken om de tafel spelen op te vragen waar het spelID
// overeenkomt met het gevraagde spelID

$spelAutheur = $conn->query($getSpelAutheur);
// uitvoeren van de sql-query


if ($spelAutheur->num_rows == 0) {
    $error["fetchSucces"] = false;
    $error["error"] = "sorry, we konden geen autheur koppelen aan dit spel";

    die(json_encode($error));
} else {
    $spelAutheur = $spelAutheur->fetch_assoc();
    $autheur = array();

    if($spelAutheur["allowCredits"] == 1) {
        $autheur["voornaam"]= $spelAutheur["voornaam"];
        $autheur["totem"]= $spelAutheur["totem"];
        $autheur["allowCredits"]= $spelAutheur["allowCredits"];
    } else {
        $autheur["allowCredits"]= $spelAutheur["allowCredits"];
    }
    // we checken of autheur wilt dat we hem credits geven
    // als dit 1 is dan voegen we de naam en totem toe aan de response
    // indien niet dan geven we enkel de negatieve waarde 'allowCredits' mee

    $response['autheur'] = $autheur;
};


die(json_encode($response));
// we beeindigen het php script en sturen de variable 'response' terug
// in deze variable zit een object met alle informatie over het spel

