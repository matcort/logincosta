<?php

// Función para evitar inyecciones
function Filtro($texto) {
  return htmlspecialchars(trim($texto), ENT_QUOTES);
}



// Variables
$directorio = 'C:/wamp/www/FormularioPHP/assets/';

$enviado = isset($_POST['enviado']) ? (int) $_POST['enviado'] : 0;
$contenido = isset($_POST['contenido']) ? (int) $_POST['contenido'] : 0;


$nombre = isset($_POST['nombre']) ? Filtro($_POST['nombre']) : '';
$nombreusuario = isset($_POST['nombreusuario']) ? Filtro($_POST['nombreusuario']) : '';
$contrasenia = isset($_POST['contrasenia']) ? Filtro($_POST['contrasenia']) : '';
$recontrasenia = isset($_POST['recontrasenia']) ? Filtro($_POST['recontrasenia']) : '';
$aniona = isset($_POST['aniona']) ? Filtro($_POST['aniona']) : '';
$RUT = isset($_POST['RUT']) ? Filtro($_POST['RUT']) : '';
$correo = isset($_POST['correo']) ? Filtro($_POST['correo']) : '';
$sexo = isset($_POST['sexo']) ? Filtro($_POST['sexo']) : '';


$error = '';
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- CSS -->

  <link rel="stylesheet" type="text/css" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
  <span style="padding-top: 10px;"></span>

<?php
// Mostrar contenido
if(is_numeric($_POST['RUT']) == 0){
$error = 'Por favor, ingrese RUT correcto';
}

if($enviado == 1 && $contenido == 1) {
  echo '<pre>';
  print_r($_POST);
  echo '</pre>';
  exit;

} else if(empty($nombre)) {
  $error = 'Por favor, ingrese su nombre.';
} else if(empty($nombreusuario)) {
  $error = 'Por favor, ingrese su RUT.';
} else if(empty($contrasenia)) {
  $error = 'Por favor, ingrese su correo electrónico.';
} else if(empty($recontrasenia)) {
  $error = 'Por favor, ingrese su año de nacimiento.';
} else if(empty($aniona)) {
  $error = 'Por favor, ingrese su region.';
} else if(empty($RUT)) {
  $error = 'Por favor, ingrese su rut.';
} else if(empty($correo)) {
  $error = 'Por favor, seleccione su candidato a alcalde.';
} else if(empty($sexo)) {
  $error = 'Por favor, ingrese su sexo.';
} 
// Vista de error
if(!empty($error)) {
?>
<div class="alert alert-info">
  <i class="glyphicon glyphicon-info-sign"></i>
  <?php echo $error; ?>
</div>
<a href="./" class="btn btn-warning">
  <i class="glyphicon glyphicon-chevron-left"></i>
  Volver
</a>
<?php
// Vista de éxito
} else {
  
?>
  <h3>¡Formulario enviado satisfactoriamente!</h3>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Datos enviados</h3>
    </div>
    <div class="panel-body">
      <p>Bienvenido(a) <b><?php echo $nombre; ?></b>,</p>
      
      <p> Nombre usuario : <b><?php echo $nombreusuario; ?></b></p>
      <p> Contraseña : <b><?php echo $contrasenia; ?></b></p>
      <p> Año de nacimiento : <b><?php echo $aniona; ?></b></p>
      <p> Rut : <b><?php echo $RUT; ?></b></p>
      <p> Tu correo electrónico es <b><?php echo $correo; ?></b></p>
      <p> Tu sexo es: <b><?php echo ($sexo == 'm' ? 'Masculino' : 'Femenino'); ?></b></p>

    </div>
    <div class="panel-footer">
      <div class="text-right">
        <a href="./" class="btn btn-primary">
          <i class="glyphicon glyphicon-chevron-left"></i>
          Volver
        </a>
      </div>
    </div>
  </div>
<?php } ?>
  <!-- Pie de página -->
   <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Metodologia de Analisis &copy; Informatica UV 2016</p>
                </div>
            </div>
        </footer>
</div>
</body>
</html>