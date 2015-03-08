 'use strict';
   $(document).ready(function() {
       var miTabla = $('#miTabla').DataTable({
            //Ocultamos columnas
            "columnDefs": [
                {
                    "targets": [ 0 ],
                    "visible": false,
                    "searchable":  false
                },
                {
                    "targets": [ 4 , 5 ],
                    "orderable": false
                }
            ],
           'processing': true,
           'serverSide': true,
           'ajax': 'php/cargar_vdoctor.php',
           'language': {
               'sProcessing': 'Procesando...',
               'sLengthMenu': 'Mostrar _MENU_ registros',
               'sZeroRecords': 'No se encontraron resultados',
               'sEmptyTable': 'Ningún dato disponible en esta tabla',
               'sInfo': 'Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros',
               'sInfoEmpty': 'Mostrando registros del 0 al 0 de un total de 0 registros',
               'sInfoFiltered': '(filtrado de un total de _MAX_ registros)',
               'sInfoPostFix': '',
               'sSearch': 'Buscar:',
               'sUrl': '',
               'sInfoThousands': ',',
               'sLoadingRecords': 'Cargando...',
               'oPaginate': {
                   'sFirst': 'Primero',
                   'sLast': 'Último',
                   'sNext': 'Siguiente',
                   'sPrevious': 'Anterior'
               },
               'oAria': {
                   'sSortAscending': ': Activar para ordenar la columna de manera ascendente',
                   'sSortDescending': ': Activar para ordenar la columna de manera descendente'
               }
           },
           'columns': [{
               'data': 'id_doctor'
           },{
               'data': 'nombre_doctor'
           }, {
               'data': 'numcolegiado'
           }, {
               'data': 'clinicas',
                  'render': function(data) {
                    return '<li>' + data + '</li> <br/>';
                  }
           }, {
               'data': 'id_doctor',
               'render': function(data) {
                  return '<a class="btn btn-info editarboton" href=http://localhost/practica-ajax-datatables/app/editar_doctor.php?id_doctor=' + data + '>Editar</a>';
               }
           }, {
               'data': 'id_doctor',   
                 'render': function(data) {
                     /*return '<a class="btn btn-danger borrarboton" data-toggle="modal" data-target="#vmodal_borrar" href=http://localhost/php/borrar_doctor.php?id_doctor=' + data + '>Borrar</a>';*/
                    return '<a class="btn btn-danger borrarboton" data-toggle="modal" data-target="#vmodal_borrar" href=http://localhost/practica-ajax-datatables/app/php/borrar_doctor.php?id_doctor=' + data + '>Borrar</a>';
                  }
           }]
       });

   /*
    * Accion Editar
    */
   /*Función que muestre el formulario cuando hagamos click*/
         /*ojo, es necesario hacerlo con el método ON. Tanto por rendimiento como porque puede haber elementos (botones) que todavía no existan en el document.ready*/
  $('#miTabla').on('click', '.editarboton', function(e) {
      e.preventDefault();
      $('#tabla').fadeOut(100);
      $('#editar_doctor_formulario').fadeIn(100);
      var nRow = $(this).parents('tr')[0];
      var aData = miTabla.row(nRow).data();
      $('#editar_nombre_doctor').val(aData.nombre_doctor);
      $('#editar_numcolegiado').val(aData.numcolegiado);
      $('#editar_nombre_clinica').val(aData.nombre_clinica);
      cargarClinicas();
      var str = aData.id_clinica;
      str = str.split(",");
      $('#editar_nombre_clinica').val(str);
  });

  /*Cargo clinicas para el select de editar doctor*/
  function cargarClinicas() {
     $.ajax({
       type: 'POST',
       dataType: 'json',
       url: 'php/listar_clinicas.php',
       async: false,
       error: function(xhr, status, error) {
      },
      success: function(data) {
       $('#nombre_clinica, #editar_nombre_clinica').empty();
       $.each(data, function() {
         $('#nombre_clinica, #editar_nombre_clinica').append(
           $('<option ></option>').val(this.id_clinica).html(this.nombre_clinica)
           );
       });
     }
    });
  }

    /*
    * Accion Borrar
    */
/*Saca ventana Modal para confirmar*/
  $('#miTabla').on('click', '.borrarboton', function(e) {
   e.preventDefault();
   var nRow = $(this).parents('tr')[0];
   var aData = miTabla.row(nRow).data();
   var id_doctor = aData.id_doctor;
   var nombre_doctor = aData.nombre_doctor;
   $('#nombre').val(nombre_doctor);
   alert(id_doctor); 
   
  });

  /*Ventana Modal Borrar*/
  $('#vmodal_borrar').on('click','#siBorrar',function(e){  
      $.ajax({
        type: 'POST',
        dataType: 'json',
        url: '../php/borrar_doctor.php',   
        /*Aqui da el fallo - Not defined*/ 
        data: id_doctor,
         error: function(xhr, status, error) {
          $.growl.error({ title: "ERROR", message: "No se ha podido borrar" });
        },
        success: function(data) {
              var $mitabla =  $("#miTabla").dataTable( { bRetrieve : true } );
              $mitabla.fnDraw();
              $.growl.notice({ title: "OK", message: "Borrado corecto" });
            }
      });
  $('#tabla').fadeIn(100);
  });

  /*Cargo clinicas*/
  function cargarClinicas() {
     $.ajax({
       type: 'POST',
       dataType: 'json',
       url: 'php/listar_clinicas.php',
       async: false,
          error: function(xhr, status, error) {
          //Alerta con error
          },
          success: function(data) {
           $('#clinicas_n,#clinicas_e').empty();
             $.each(data, function() {
               $('#clinicas_n,#clinicas_e').append(
                 $('<option ></option>').val(this.idClinica).html(this.nombre)
                 );
             });
         }
    });
  }

  
        
 

  
});