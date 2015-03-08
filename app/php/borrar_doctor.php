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
//$_REQUEST['id_doctor'] = 1;
if (isset($_REQUEST['id_doctor'])) {
    // param was set in the query string
    if (empty($_REQUEST['id_doctor'])) {
        return "id_doctor se encuentra vacio";
    }
    $id_doctor = $_REQUEST['id_doctor'];
}

/*
 * SQL queries
 * Get data to display
 */
$query = "DELETE FROM doctores WHERE id_doctor=" . $id_doctor;
$query_res = mysql_query($query);

// Comprobar el resultado
if (!$query_res) {
    if (mysql_errno() == 1451) {
        $mensaje = "No se puede borrar el doctor";
        $estado = mysql_errno();
    } else {
        $mensaje = 'Error al borrar doctor, Consulta: ' . mysql_error() . "\n";
        $estado = mysql_errno();
    }
} else {
    $mensaje = "El doctor se ha borrado ";
    $estado = 0;
}
$resultado = array();
$resultado[] = array(
    'mensaje' => $mensaje,
    'estado' => $estado
);
echo json_encode($resultado);
?>
