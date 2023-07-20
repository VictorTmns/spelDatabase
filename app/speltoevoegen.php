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

        <h1>Spel Toevoegen</h1>
        <br>
        <p>Op deze pagina kun je rechstreeks spelen aan de database toevoegen. Let op: Gemaakte spelen worden automatisch toegevoegd zonder goedkeuring.</p>
        <br>
        <div class="spel-toevoegen-container">
            <form name="spel_toevoegen" method="post" action="">

            <label for="spelnaam">Spelnaam</label>
            <input type="text" class="form-control" name="spelnaam" id="spelnaam">

            <label for="spelbeschrijving">Spelbeschrijving</label>
            <input type="text" class="form-control" name="spelbeschrijving" id="spelbeschrijving">

            </form>
        </div>
    </div>
    </main>
    <?php include("includes/footer.inc.php"); ?>
</body>
</html>