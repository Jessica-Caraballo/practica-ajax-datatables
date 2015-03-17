<?php

/* Informacion de la base de datos */
include("mysql.php" );

/* Funcion para recoger errores */
function fatal_error($sErrorMessage = '') {
    header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error');
    die($sErrorMessage);
}

/* Conexion MYSQL */
if (!$gaSql['link'] = mysql_pconnect($gaSql['server'], $gaSql['user'], $gaSql['password'])) {
    fatal_error('Could not open connection to server');
}
/* Comprueba si se conecto a la base de datos */
if (!mysql_select_db($gaSql['db'], $gaSql['link'])) {
    fatal_error('Could not select database ');
}
/* Cambia el modo a UTF-8 */
mysql_query('SET names utf8');

/* Prepara la sentencia para buscar las clinicas */
$sQuery = "select id_clinica, nombre from clinicas order by nombre";
/* Lanza la consulta */
$rResult = mysql_query($sQuery, $gaSql['link']) or fatal_error('MySQL Error: ' . mysql_errno());

$resultado = array();
/* Recorre el resultado para devolver un array con la id y el nombre de las clinicas */
while ($fila = mysql_fetch_array($rResult)) {
    $resultado[] = array(
      'id_clinica' => $fila['id_clinica'],
      'nombre' => $fila['nombre']
   );
}
/* Devolvemos la representacion como cadena en json del array */
echo json_encode($resultado);
?>
