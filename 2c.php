<?php
    require_once "conexion.php";
    $conexion = new Conexion();
    try{
        $conn = $conexion->iniciar();
        $sql = "INSERT INTO suscrito(fecha,cliente_idcliente) VALUES ('24-05-2025',1)";
        $suscripcion = $conn->exec($sql);
        if($suscripcion > 0){
            echo "suscripcion realizada";
        }
        $conn = $conexion->terminar();
    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>
