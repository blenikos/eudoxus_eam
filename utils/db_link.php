<?php
    
    class DBLink
    {
        public $DataBase;
        
        private $name,$password;
        
        public 
        
        function __construct()
        {
            $this->name="std10179";
            $this->password="SE43es";
        }
        
        function DBLinking()
        {
            $DB = mysqli_connect("pubsrv1.di.uoa.gr",$this->name,$this->password,"std10179db");
            if(!$DB)
            {
                printf("Connect failed: %s\n",mysqli_connect_error());
            }
            else
            {
                $this->DataBase = $DB;
                mysqli_query($DB,"set names utf8");
                return true;
            }
        }
        
        function DBclose_link()
        {
            mysqli_close($this->DataBase);
        }
    }
    
?>
