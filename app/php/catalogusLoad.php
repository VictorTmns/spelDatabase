<?php
session_start();


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



require_once("secrets.php");

$conn = new mysqli($servername, $username, $password, $dbname);

$response = array();

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



$searchTerm = $_POST['searchTerm'];

$getMatchingGames = "
SELECT spelen.spelID, spelen.spelnaam, spelen.beschrijving
FROM spelen
WHERE spelen.spelnaam RLIKE '$searchTerm'
";


if ($searchTerm == ""){
    $getMatchingGames = "
    SELECT spelen.spelID, spelen.spelnaam, spelen.beschrijving
    FROM spelen
    ";
}


$matchingGames = $conn->query($getMatchingGames);


if ($matchingGames->num_rows == 0) {
    $response["succes"] = false;
    $response["error"] = "sorry, dit spelletje staat nog niet in onze database";
    die(json_encode($response));
}
else
{
    $response[] = true;
    
    if ($result  = $conn -> query($getMatchingGames)) {

        $matchingGames = array();
        
        while ($row = $result -> fetch_row()) {


            $variableName["spelID"]= $row[0];
            $variableName["spelnaam"]= $row[1];
            $variableName["beschrijving"]= $row[2];

            
            //echo $row[0];
            $getSpelTags = "
            SELECT spelTags.tag
            FROM spelTags
            WHERE spelTags.spelID = '$row[0]';
            ";

            $spelTags = $conn->query($getSpelTags);
            
            // $spelTags = $spelTags->fetch_assoc();

            // echo $spelTags;

            if ($result2 = $conn -> query($getSpelTags)) {
                while ($row2 = $result2 -> fetch_row()) {
        
                    $spelTagList[]= $row2[0];

                }
            mysqli_free_result($result2);
            };
        
            $variableName['spelTagList'] = $spelTagList;



            $matchingGames[] = $variableName;
        }
        mysqli_free_result($result);

        $response[] = $matchingGames;
    }

    die(json_encode($response));
};