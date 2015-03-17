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

/* Recojo las variables que recibo por post en otras variables para su posterior uso */
$id = $_POST["idDoctor"];
$nombre = $_POST["nombre"];
$numcolegiado = $_POST["numcolegiado"];
$clinicas = $_POST["id_clinica"];

/* 
  Si recibio alguna clinica, borra todos los registros 
  de doctores en la tabla que relaciona doctores y clinicas 
*/
if($clinicas){
  $query = "delete from clinica_doctor where id_doctor=" . $id;
  $query_res = mysql_query($query);
}

/* 
  Recorre todas las clinicas insertando las nuevas clinicas con
  el doctor seleccionado
*/
for ($i=0;$i<count($clinicas);$i++){
  $consulta_clinicas = "insert into clinica_doctor (id_doctor,id_clinica) values( 
    ". $id . ", 
    " . $clinicas[$i] . ")" ;
  $query_res = mysql_query($consulta_clinicas);
} 

/* Actualiza la tabla doctores con los datos insertados */
$query = "update doctores set 
            nombre = '" . $nombre . "', 
            numcolegiado = '" . $numcolegiado . "' 
            WHERE id_doctor = '" . $id."'";

/* Recoje el error correspondiente si lo hubo */
$query_res = mysql_query($query);

/* Comprueba el error y prepara el mensaje */
if (!$query_res) {
    $mensaje  = 'Error en la consulta: ' . mysql_error() ;
    $estado = mysql_errno();
}else{
   /*Si no hay error*/
    $mensaje = "Doctor editado correctamente";
    $estado = 0;
}
/* Declaramos y guardamos en un array el mensaje y estado de la consulta */
$resultado = array();
$resultado[] = array(
    'mensaje' => $mensaje,
    'estado' => $estado
  );
/* Devolvemos la representacion como cadena en json del array */
echo json_encode($resultado);
?>
