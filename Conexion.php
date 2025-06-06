<?php
    class Conexion{
        private $dsn;
        private $username;
        private $password;
        private $conn;
    
        public function __construct(){
            $this->dsn = "mysql:host=localhost;dbname=emc";
            $this->username = "root";
            $this->password = "";
        }
      
        
        public function iniciar(){
             return new PDO($this->dsn, $this->username, $this->password);
           
        }
    
        public function terminar(){
            $conn = NULL;
        }
    }
    ?>