<?php
 
$table = 'vdoctor';
 

$primaryKey = 'id_doctor';
 

//Nombre BD, nombre JSON
$columns = array(
array( 'db' => 'nombre_doctor', 'dt' => 'nombre_doctor' ),
array( 'db' => 'numcolegiado', 'dt' => 'numcolegiado' ),
array( 'db' => 'id_doctor', 'dt' => 'id_doctor' ),
array( 'db' => 'id_clinica',     'dt' => 'id_clinica' ),
array( 'db' => 'clinicas',     'dt' => 'clinicas' )

);
// SQL server connection information
$sql_details = array(
    'user' => 'root',
    'pass' => 'jessi',
    'db'   => 'datatables',
    'host' => 'localhost'
);

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( 'ssp.class.php' );
 
echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
);