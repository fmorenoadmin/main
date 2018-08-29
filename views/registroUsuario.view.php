<?php 
require 'views/header.php';
?>

<body>
	<header>
		<h1 class="display-4 text-center">Registro</h1>
	</header>

	<main class="row justify-content-center">
		<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" class="col-md-6">
			<div class="form-group">
				<label for="inputNombre">Nombre:</label>
				<input type="text" class="form-control" name="nombre" id="inputNombre" placeholder="Nombre">
			</div>

			<div class="form-group">
				<label for="inputApellido">Apellido:</label>
				<input type="text" class="form-control" name="apellido" id="inputApellido" placeholder="Apellido">
			</div>

			<div class="form-group">
				<label for="inputEmail">Email:</label>
				<input type="email" class="form-control" name="email" id="inputEmail" placeholder="Email">
			</div>

			<div class="form-group">
				<label for="inputTarjeta">Tarjeta:</label>
				<input type="text" class="form-control" name="tarjeta" id="inputTarjeta" placeholder="Tarjeta">
			</div>

			<div class="form-group">
				<label for="inputContrasena">Contraseña:</label>
				<input type="password" class="form-control" name="contrasena" id="inputContrasena" placeholder="Contraseña">
			</div>

			<input type="submit" class="btn btn-primary btn-block mx-auto d-block">
		</form>
	</main>
</body>
</html>