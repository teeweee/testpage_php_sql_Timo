<?php

// DEFINE VARS, FETCH FROM FORM

$first_name = $_REQUEST['firstName'];
$surname = $_REQUEST['Surname'];

$noquestions = 15  ;

$question_array = [] ; 
for ($i=0; $i < $noquestions ; $i++)  
{ 
   $question_array[] = $_REQUEST['quest'.($i + 1)];
  //  echo $question_array[$i] ;
} 

// FILL ANSWERS INTO VARIABLES

// all answers are yes.
$answer_array = [] ;
for ($i=0; $i < $noquestions ; $i++) 
{
   $answer_array[] = "yes";
  // echo $answer_array[$i] ;
}

// OR: define individual answers for every question, if desired
//$answer_array = ["yes", "no","yes"]

// CALCULATE GRADE

$score_array = []; // put score from each question in an array as an intermediate result. uses more memory though.
$score_cum = 0 ; // cumulative score
for ($i=0; $i < $noquestions ; $i++)  
{ 
 if ($question_array[$i] === $answer_array[$i]) 
 {
    $score_array[] = 1 ;
    $score_cum++ ;
 } else {
    $score_array[] = 0 ;
 }
} 
//echo implode(",",$score_array) ;
$grade = round($score_cum / $noquestions * 10) ;
echo "Grade:.'$grade'.<br>" ;

// CONNECT TO DB

$servername = 'localhost';
$username = 'root';
$password = '';
$dbname = 'testpage';

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// SEND TO DB


$sql = "INSERT INTO participant VALUES (DEFAULT, '$first_name', '$surname', '$grade')";

if ($conn->query($sql) === TRUE) {
    echo 'Grade submitted successfully';
} else {
    echo "Error: " . $sql . '<br>' . $conn->error;
}


// MAKE SURE THE TEST CAN ONLY BE SUBMITTED ONCE

// i setup the database, so Name, Surname need to be unique pairs : ALTER TABLE participant ADD UNIQUE index(Name, Surname) ;
// drawback: 2 participants with the same name could not both participate.



$conn->close();

// header('Location: ' . $_SERVER['HTTP_REFERER']);


