<?php

//include 'db_link.php';
// Creates mapping between db tables and objects
// Every class is a db table with their private data being the db columns

class db_Book
{

    private $id;
    private $title;
    private $type;
    private $cover_image;
    private $authors;
    private $edition;
    private $isbn;
    private $publisher;
    private $webpage;
    private $location;
    private $dimensions;
    private $pages;
    private $abstract;
    private $publish_date;

    function __construct($search_value)
    {
        // Gets book from db and calls set_book

        Global $Linker;
        $query = "SELECT *
                       FROM Books
                       WHERE id = ?";
        $stmt = mysqli_prepare($Linker->DataBase,$query);
        mysqli_stmt_bind_param($stmt,"i",$search_value);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $id,$Publisher,$ISBN,$Title,$Author,$Field_of_Study,$Publish_Date);

        while(mysqli_stmt_fetch($stmt))
            $this->set_book($id,$Title,$Field_of_Study,"",$Author,"",$ISBN,$Publisher,"","","","","","",$Publish_Date);

        mysqli_stmt_close($stmt);

        //$Linker->DBclose_link();
    }


    function set_book($id, $title, $type, $cover_image, $authors, $edition, $isbn,
                      $publisher, $webpage, $location, $cover, $dimensions,
                      $pages, $abstract, $publish_date)
    {
        $this->id = $id;
        $this->title = $title;
        $this->type= $type;
        $this->cover_image = $cover_image;
        $this->authors = $authors;
        $this->edition = $isbn;
        $this->publisher = $publisher;
        $this->webpage = $location;
        $this->cover = $dimensions;
        $this->pages = $pages;
        $this->abstract = $abstract;
        $this->publish_date = $publish_date;
    }

    function get_id(){return $this->id;}
    function get_title(){return $this->title;}
    function get_type(){return $this->type;}
    function get_cover_image(){return $this->cover_image;}
    function get_authors(){return $this->authors;}
    function get_edition(){return $this->edition;}
    function get_isbn(){return $this->edition;}
    function get_publisher(){return $this->publisher;}
    function get_webpage(){return $this->webpage;}
    function get_location(){return $this->location;}
    function get_dimensions(){return $this->dimensions;}
    function get_pages(){return $this->pages;}
    function get_abstract(){return $this->abstract;}
    function get_p_date(){return $this->publish_date;}
}

class db_Publisher
{

    private $id;
    private $name;
    private $telephone;
    private $id_nd;

    function __construct($search_value)
    {
        // Gets publisher from db and calls set_publisher
        Global $Linker;
        $query = "SELECT *
                       FROM Publishers
                       WHERE id = ?";
        $stmt = mysqli_prepare($Linker->DataBase,$query);
        mysqli_stmt_bind_param($stmt,"i",$search_value);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $id, $Name, $Telephone, $id_ND);

        while(mysqli_stmt_fetch($stmt)) $this->set_publisher($id, $Name, $Telephone, $id_ND);

        mysqli_stmt_close($stmt);
    }

    function set_publisher($id, $name, $telephone, $id_nd)
    {
        $this->id = $id;
        $this->name = $name;
        $this->telephone = $telephone;
        $this->id_nd = $id_nd;
    }

    function get_id(){return $this->id;}
    function get_name(){return $this->name;}
    function get_telephone(){return $this->telephone;}
    function get_id_nd(){return $this->id_nd;}
}

class db_Student
{

    private $id;
    private $u_ID;
    private $name;
    private $surname;
    private $telephone;
    private $semester;
    private $d_ID;

    function __construct($search_value)
    {
        // Gets student from db and calls set_student
        Global $Linker;
        $query = "SELECT *
                       FROM Students
                       WHERE id = ?";
        $stmt = mysqli_prepare($Linker->DataBase,$query);
        mysqli_stmt_bind_param($stmt,"i",$search_value);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $id, $u_ID, $Name, $Surname, $Telephone, $Semester, $d_ID);

        while(mysqli_stmt_fetch($stmt)) $this->set_student($id, $u_ID, $Name, $Surname, $Telephone, $Semester, $d_ID);

        mysqli_stmt_close($stmt);

    }

    function set_student($id, $u_ID, $name, $surname, $telephone, $semester, $d_ID)
    {
        $this->id = $id;
        $this->u_ID = $u_ID;
        $this->name = $name;
        $this->surname = $surname;
        $this->telephone = $telephone;
        $this->semester = $semester;
        $this->d_ID = $d_ID;
    }

    function get_id(){return $this->id;}
    function get_u_id(){return $this->u_ID;}
    function get_name(){return $this->name;}
    function get_surname(){return $this->surname;}
    function get_telephone(){return $this->telephone;}
    function get_semester(){return $this->semester;}
    function get_d_id(){return $this->d_ID;}
}

class db_Professor
{

    private $id;
    private $name;
    private $surname;
    private $d_ID;
    private $field;

    function __construct($search_value)
    {
        // Gets professor from db and calls set_professor
        Global $Linker;
        $query = "SELECT *
                       FROM Professors
                       WHERE id = ?";
        $stmt = mysqli_prepare($Linker->DataBase,$query);
        mysqli_stmt_bind_param($stmt,"i",$search_value);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $id, $Name, $Surname, $d_ID, $Field);

        while(mysqli_stmt_fetch($stmt)) $this->set_professor($id, $Name, $Surname, $d_ID, $Field);

        mysqli_stmt_close($stmt);
    }

    function set_professor($id, $name, $surname, $d_ID, $field)
    {
        $this->id = $id;
        $this->name = $name;
        $this->surname = $surname;
        $this->d_ID = $d_ID;
        $this->field = $field;
    }

    function get_id(){return $this->id;}
    function get_name(){return $this->name;}
    function get_surname(){return $this->surname;}
    function get_d_id(){return $this->d_ID;}
    function get_field(){return $this->field;}
}

class db_Note_Dist
{
}

class db_Notes
{
}

class db_Asked
{
}

class db_Books_to_Take
{
}

class db_User
{

    private $id;
    private $username;
    private $password;
    private $email;
    private $user_type;
    private $table_id;

    function __construct($search_value)
    {
        // Gets professor from db and calls set_professor
        Global $Linker;
        $query = "SELECT *
                       FROM Users
                       WHERE id = ?";
        $stmt = mysqli_prepare($Linker->DataBase,$query);
        mysqli_stmt_bind_param($stmt,"i",$search_value);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $id, $Username, $Password, $email, $User_Class, $Table_ID);

        while(mysqli_stmt_fetch($stmt)) $this->set_user($id, $Username, $Password, $email, $User_Class, $Table_ID);

        mysqli_stmt_close($stmt);
    }

    function set_user($id, $username, $password, $email, $user_type, $table_id)
    {
        $this->id = $id;
        $this->username = $username;
        $this->password = $password;
        $this->email = $email;
        $this->user_type = $user_type;
        $this->table_id = $table_id;
    }
    
    function update_info($email, $password)
    {
        $this->password = $password;
        $this->email = $email;
    }

    function get_id(){return $this->id;}
    function get_username(){return $this->username;}
    function get_password(){return $this->password;}
    function get_email(){return $this->email;}
    function get_user_type(){return $this->user_type;}
    function get_table_id(){return $this->table_id;}
}

?>
