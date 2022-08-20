<?php
session_start();
//een php sessie starten

require_once("php/secrets.php");
// ophalen credentials

$conn = new mysqli($servername, $username, $password, $dbname);

if (isset($_POST["button"])) {
    $naam = $_POST["naam"];
    $voornaam = $_POST["voornaam"];
    $totem = $_POST["totem"];
    $vereniging = $_POST["vereniging"];

    $findUser = "
    SELECT * FROM autheurs
    WHERE autheurs.voornaam='$voornaam' AND autheurs.achternaam='$naam' AND autheurs.totem='$totem' AND autheurs.vereniging='$vereniging';
    ";

    if ($stmtFindUser = mysqli_prepare($dbconn, $qryFindUser)) { //Testen of de autheur al bestaat
        mysqli_stmt_execute($stmtFindUser);
        mysqli_stmt_bind_result($stmtFindUser, $autheurID);
        mysqli_stmt_fetch($stmtFindUser);
    }

    if ($klantID != null) {
        //Redirect naar spel toevoegen met huidige autheur
    } else {
        //autheur toevoegen aan systeem en daarmee een spel toevoegen
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Verzameling van alle spelen op één website">
    <meta name="keywords" content="Spel, Spelen, Databse, Scouts">
    <meta name="author" content="Simon De Clerck en Victor Taeijmans">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/nav_footer.css">
    <link rel="stylesheet" href="style/style.css">
    <title>Spel Database</title>
</head>
<body>
    <?php include("includes/nav.inc.php"); ?>
    <main>
    <div class="index-container">

        <h1>Autheur</h1>
        <br>
        <p>Voor je spelen kunt toevoegen aan de database hebben we eerst een autheur nodig. Je kiest zelf of je naam, totem, eenheid vermeld worden als autheur op de spelpagina.</p>
        <br>
        <br>
        <div class="toevoegen-container">
            <form name="autheur_toevoegen" method="post" action="">

            <p class="label">Vooraam</p>
            <input type="text" class="form-control" name="voornaam" id="voornaam">

            <p class="label">Naam</p>
            <input type="text" class="form-control" name="naam" id="naam">

            <p class="label">Totem ❓<span class="tooltip">Onze scouts gebruikt totems als een alternatieve naam. Heb je geen totem? Laat dit veld dan leeg.</span></p>
            <input type="text" class="form-control" name="totem" id="totem">

            <p class="label">Vereniging ❓<span class="tooltip">Scouts of jeugdbeweging waar jij bij zit.</span></p>
            <input type="text" class="form-control" name="vereniging" id="vereniging">
            <br>
            <input class="button" type="submit" class="btn btn-secondary" name="button" value="Toevoegen">
            </form>
        </div>
    </div>
    </main>
    <?php include("includes/footer.inc.php"); ?>
</body>
</html>