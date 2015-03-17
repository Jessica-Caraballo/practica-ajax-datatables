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
$nombre = $_POST["nombreNuevo"];
$numcolegiado = $_POST["numcolegiadoNuevo"];
$clinicas = $_POST["clinicasCrear"];


/* Preparo la consulta para insertar el nuevo doctor con sus valores */
$query = "insert into doctores (nombre,numcolegiado) values( 
             '". $nombre . "', 
            '" . $numcolegiado . "')" ;

/* Lanzamos y guardamos la consulta */
$query_res = mysql_query($query);

/* 
  Si la consulta fue bien guardamos en una cadena la consulta con el parametro numero colegiado
  y guardamos el resultado de lanzar dicha consulta (la id doctor correspondiente)
*/
if($query_res){
  $sql = "select id_doctor
          from doctores
          where numcolegiado='".$numcolegiado."'";
  $res = mysql_query($sql);

  while($row = mysql_fetch_array($res, MYSQL_ASSOC)){
    $id_nuevo=$row['id_doctor'];
  }
}
/* Despues añadiremos por cada clinica en la tabla clinicas y doctores la relacion */
for ($i=0;$i<count($clinicas);$i++){     
  $query_insert = "insert into clinica_doctor (id_doctor,id_clinica) values( 
             ". $id_nuevo . ", 
            " . $clinicas[$i] . ")" ;

  $query_res_insert = mysql_query($query_insert);
} 
/* Si hubo o no error en las consultas o el resultado */
if (!$query_res||!$res||$query_res_insert){
    if (mysql_errno() == 1062) {
        $mensaje = " Error, ya existe ese numero de colegiado";
        $estado = mysql_errno();
    } else {
        $mensaje = ' Error, consulta fallida: ' . mysql_error() . "\n";
        $estado = mysql_errno();
    }
}else{
    $mensaje = " El doctor se ha añadido correctamente";
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
