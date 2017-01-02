<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pagina Principal</title>

    <!-- Bootstrap Core CSS -->
    <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./assets/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="./assets/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Inicio</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="navbar-brand" href="#">Sobre el proyecto</a>
                    </li>
                    <li>
                        <a class="navbar-brand" href="index.html">Volver</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
<div class="container">
  <h1>REGISTRARSE</h1>
  <!-- Formulario -->
  <form enctype="multipart/form-data" method="post" action="./enviar.php" accept-charset="UTF-8">
    <!-- Hidden -->
    <input type="hidden" name="enviado" value="1">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Crear cuenta :</h3>
      </div>
      <div class="panel-body">
        <!-- Texto -->
<!-- De acuerdo a SGC_USUARIO-->
        <div class="form-group">
          <b>Nombre y Apellido :</b>
          <input type="text" class="form-control" name="nombre" placeholder="Ingrese su nombre y apellido">
        </div>

        <div class="form-group">
          <b>Correo :</b>
          <input type="text" class="form-control" name="correo" placeholder="Ingrese sucorreo">
        </div>
        
    <div class="form-group">
          <b>Tipo :</b>
          <input type="text" class="form-control" name="nombreusuario" placeholder="Ingrese su tipo de usuario">
        </div>
         
    <div class="form-group">
	<b>Password:</b>
          <input type="password" class="form-control" name="contrasena" placeholder="Ingrese su contraseña">
    </div>
      


      <div class="panel-footer">
        <div class="text-right">
          <a href="./" class="btn btn-primary">
            <i class="glyphicon glyphicon-repeat"></i>
            Reiniciar
          </a>
          <!-- Button submit -->
          
          <button type="submit" class="btn btn-success">
            Enviar
            <i class="glyphicon glyphicon-menu-right"></i>
          </button>
        
        </div>
      </div>
    </div>
  </form>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Metodologia de Analisis &copy; Informatica UV 2016</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    

    <!-- Bootstrap Core JavaScript -->
   

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script

</body>

</html>
