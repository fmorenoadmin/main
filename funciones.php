<?php  

function conexion($dbname, $usuario, $contrasena){
	try {
		$conexion = new PDO("mysql:host=localhost;dbname=$dbname", "$usuario", "$contrasena");
		return $conexion;
	} catch (PDOException $e) {
		return false;
	}
}

function limpiarDatos($datos){
	$datos = trim($datos);
	$datos = stripslashes($datos);
	$datos = htmlspecialchars($datos);
	return $datos;
}

function comprobarSession(){
	if (!isset($_SESSION['admin'])) {
		header('Location: ' .  RUTA);
	}
}

?>