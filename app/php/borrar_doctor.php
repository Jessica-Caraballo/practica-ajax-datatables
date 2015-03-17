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

/* Si recibio la id_doctor */
if (isset($_REQUEST['id_doctor'])) {
    /* Si la recibio vacia devuelve esta vacia*/
    if (empty($_REQUEST['id_doctor'])) {
        return "El parámetro id_doctor viene vacio!";
    }
    /* Si no esta vacia la inicializa */
    $id_doctor = $_REQUEST['id_doctor'];
}

/* Prepara la sentencia para borrar el doctor y la lanza */
$query = "delete from doctores where id_doctor=" . $id_doctor;
$query_res = mysql_query($query);

/* Si la consulta dio error devolvemos un mensaje con el error y el numero del estado */
if (!$query_res) {
    if (mysql_errno() == 1451) {
        $mensaje = " Error, no se pudo borrar la clinica, tiene doctores asignados";
        $estado = mysql_errno();
    } else {
        $mensaje = ' Error numero: ' . mysql_error() . "\n";
        $estado = mysql_errno();
    }
} else {
    $mensaje = " Exito, borrado correcto";
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
