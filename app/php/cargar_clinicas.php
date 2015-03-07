<?php
/* Database connection information */
include("mysql.php" );
/*
* Local functions
*/
function fatal_error($sErrorMessage = '') {
header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error');
die($sErrorMessage);
}
/*
* MySQL connection
*/
if (!$gaSql['link'] = mysql_pconnect($gaSql['server'], $gaSql['user'], $gaSql['password'])) {
fatal_error('Could not open connection to server');
}
if (!mysql_select_db($gaSql['db'], $gaSql['link'])) {
fatal_error('Could not select database ');
}
mysql_query('SET names utf8');
/*
* SQL queries
* Get data to display
*/
/* Consulta SELECT */
$sQuery = "SELECT id_clinica, nombre FROM clinicas ORDER BY nombre";
$rResult = mysql_query($sQuery, $gaSql['link']) or fatal_error('MySQL Error: ' . mysql_errno());
$resultado = array();
while ($fila = mysql_fetch_array($rResult)) {
    $resultado[] = array(
      'id_clinica' => $fila['id_clinica'],
      'nombre_clinica' => $fila['nombre_clinica']
   );
}
echo json_encode($resultado);
?>