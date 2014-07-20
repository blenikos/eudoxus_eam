<?php

include 'utils/db_link.php';
include 'utils/user_utils.php';

Global $Linker;

$Linker= new DBLink();                 
$success = $Linker->DBLinking();
if($success == false) printf("CONNECTION ERROR!!! NO DATABASE AVAILABLE!!!");
else printf("CONNECTION SUCCESSFULL!!!");

$USER = new User();

//$USER->register("blenikos","abcd17","Students","std179@di.gr");

$USER->login("blenikos","pass");

echo($USER->get_user("Username"));
echo($USER->get_user("Password"));
echo($USER->get_user("email"));
echo("      ");
echo($USER->get_student_info("Name"));
echo($USER->get_student_info("Surname"));
echo($USER->get_student_info("Department"));


$USER->update_profile("std10179@di.uoa.gr","pass");

echo($USER->get_user("Username"));
echo($USER->get_user("Password"));
echo($USER->get_user("email"));
echo("      ");
echo($USER->get_student_info("Name"));
echo($USER->get_student_info("Surname"));
echo($USER->get_student_info("Department"));

$USER->update_student(111521000179,"Nikos","Mpletsis","6970478400",8,"Tmhma Plhroforikhs kai Thlepikoinwniwn");

echo($USER->get_user("Username"));
echo($USER->get_user("Password"));
echo($USER->get_user("email"));
echo("      ");
echo($USER->get_student_info("Name"));
echo($USER->get_student_info("Surname"));
echo($USER->get_student_info("Department"));

echo("\n");
printf("USER CREATION SUCCESSFULL!!!");

//printf($USER->get_user_type());

?>