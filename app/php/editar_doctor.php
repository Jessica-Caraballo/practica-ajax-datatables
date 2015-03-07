
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
 */
$id_doctor = $_POST["editar_id_doctor"];
$nombre = $_POST["editar_nombre_doctor"];
$numcolegiado = $_POST["editar_numcolegiado"];
$id_clinica = $_POST["id_clinica"];
$nombre_clinica = $_POST["editar_nombre_clinica"];



if($clinicas){
  $query = "DELETE FROM clinica_doctor WHERE id_doctor=" . $id_doctor;
  $query_res = mysql_query($query);
}
for ($i=0;$i<count($clinicas);$i++)
{
  $queryCD = "INSERT INTO clinica_doctor (id_doctor,id_clinica) VALUES(
    ". $id_doctor . ",
    " . $clinicas[$i] . ")" ;
  $query_res = mysql_query($queryCD);
} 
/* Consulta UPDATE */
$query = "UPDATE doctores SET 
nombre = '" . $nombre . "', 
numcolegiado = '" . $numcolegiado . "'
WHERE id_doctor = " . $id_doctor;

$query_res = mysql_query($query);

if (!$query_res) {
  $mensaje  = 'Error al editar el doctor: ' .mysql_error() ."\n";
  $estado = mysql_errno();
}
else
{
  $mensaje = "Doctor editado correctamente";
  $estado = 0;
}
$resultado = array();
$resultado[] = array(
  'mensaje' => $mensaje,
  'estado' => $estado
  );
echo json_encode($resultado);
?>