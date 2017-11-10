<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/scriptValidacion.js"></script>
        <script src="alertify/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estiloLogIn.css">
        <link rel="stylesheet" href="css/fonts.css"/>
        <link rel="stylesheet" href="alertify/css/alertify.css"/>
        <title>Inicio</title>
    </head>
    <body>
        <div id="InicioSesion">
            <form class="login" action="InicioSesion" method="post" >
                <h1 class="login-title">Portal</h1>
                <input name="usuario" type="text" class="login-input" placeholder="Usuario"  onpaste="alertify.error('No se puede pegar'); return false">
                <input name="password" type="password" class="login-input" placeholder="Contraseña" onpaste="alertify.error('No se puede pegar'); return false" >
                <input type="submit" value="Iniciar Sesión" class="login-button">

            </form>   
        </div>
        
        
    </body>
</html>
