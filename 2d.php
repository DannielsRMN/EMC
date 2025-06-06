<?php
    require_once "conexion.php";
    $conexion = new Conexion();
    try{
        $conn = $conexion->iniciar();
        $sql = "SELECT * FROM cliente";
        $vercliente = $conn->query($sql);
        foreach($vercliente as $verclientes){
            echo $verclientes."<br>";
        }
        $conn = $conexion->terminar();
    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>