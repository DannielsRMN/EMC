<?php
    require_once "conexion.php";
    $conexion = new Conexion();
    try{
        $conn = $conexion->iniciar();
        $sql = "INSERT INTO cliente(dni,nombre,direccion) VALUES ('87654321','daniel','esperanza 145')";
        $cliente = $conn->exec($sql);
        if($cliente > 0){
            echo "cliente registrado";
        }
        $conn = $conexion->terminar();
    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>