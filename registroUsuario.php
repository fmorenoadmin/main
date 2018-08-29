<?php 
require 'funciones.php';

$conexion = conexion('tiendash1', 'root', '');

if (!$conexion) {
	die();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$nombre = limpiarDatos($_POST['nombre']);
	$apellido = limpiarDatos($_POST['apellido']);
	$email = limpiarDatos($_POST['email']);
	$tarjeta = limpiarDatos($_POST['tarjeta']);
	$contrasena = limpiarDatos($_POST['contrasena']);

/*	$statement = $conexion->prepare('
		INSERT INTO usuarios (nombre, apellido, email, tarjeta, contrasena)
		VALUES (:nombre, :apellido, :email, :tarjeta, :contrasena)
		');

	$statement->execute(array(
	':nombre' => $_POST['nombre'],	
	':apellido' => $_POST['apellido'],
	':email' => $_POST['email'],
	':tarjeta' => $_POST['tarjeta'],
	':contrasena' => $_POST['contrasena']
	));*/

	$sql = ("INSERT INTO usuarios (id, nombre, apellido, email, tarjeta, contrasena)
		VALUES (null, :nombre, :apellido, :email, :tarjeta, :contrasena)");
	$query = $conexion->prepare($sql);

	$result = $query->execute([
		'nombre' => $_POST['nombre'],	
		'apellido' => $_POST['apellido'],
		'email' => $_POST['email'],
		'tarjeta' => $_POST['tarjeta'],
		'contrasena' => $_POST['contrasena']
	]);

  //   $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //   $stmt = $conexion->prepare("
  //   	INSERT INTO usuarios (id, nombre, apellido, email, tarjeta, contrasena)
		// VALUES (null, :nombre, :apellido, :email, :tarjeta, :contrasena)");
  //   $stmt->bindParam(':nombre', $nombre);
  //   $stmt->bindParam(':apellido', $apellido);
  //   $stmt->bindParam(':email', $email);
  //   $stmt->bindParam(':tarjeta', $tarjeta);
  //   $stmt->bindParam(':contrasena', $contrasena);
  //   $stmt->execute();

	header('Location: index.php');
}

require 'views/registroUsuario.view.php';




?>