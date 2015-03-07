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
                    "targets": [ 4, 5 ],
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
               'data': 'nombre_clinica',
                  'render': function(data) {
                    return '<li>' + data + '</li> <br/>';
                  }
           }, {
               'data': 'id_doctor',
               'render': function(data) {
                  return '<a class="btn btn-info editarbtn" href=http://localhost/practica-ajax-datatables/app/editar_doctor.php?id_doctor=' + data + '>Editar</a>';
               }
           }, {
               'data': 'id_doctor',   
                 'render': function(data) {
                     return '<a class="btn btn-danger borrarbtn" href=http://localhost/php/borrar.php?id_doctor=' + data + '>Borrar</a>';
                  }
           }]
       });

   /*
    * Accion Editar
    */
   /*Creamos la función que muestre el formulario cuando hagamos click*/
         /*ojo, es necesario hacerlo con el método ON. Tanto por rendimiento como porque puede haber elementos (botones) que todavía no existan en el document.ready*/
  $('#miTabla').on('click', '.editarbtn', function(e) {
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
   $('#miTabla').on('click', '.borrarbtn', function(e) {
       e.preventDefault();
       var nRow = $(this).parents('tr')[0];
       var aData = miTabla.row(nRow).data();
       var idClinica = aData.idClinica;


       $.ajax({
           /*en principio el type para api restful sería delete pero no lo recogeríamos en $_REQUEST, así que queda como POST*/
           type: 'POST',
           dataType: 'json',
           url: 'php/borrar_clinica.php',
           //estos son los datos que queremos actualizar, en json:
           data: {
               id_clinica: idClinica
           },
           error: function(xhr, status, error) {
               //mostraríamos alguna ventana de alerta con el error
               alert("Ha entrado en error");
           },
           success: function(data) {
               //obtenemos el mensaje del servidor, es un array!!!
               //var mensaje = (data["mensaje"]) //o data[0], en función del tipo de array!!
               //actualizamos datatables:
               /*para volver a pedir vía ajax los datos de la tabla*/
               miTabla.fnDraw();
           },
           complete: {
               //si queremos hacer algo al terminar la petición ajax
           }
       });
   });

  $('#close').click(function(e) {
    $('#miTabla').fadeIn(100);
     $('#formulario').fadeOut(100);

  });
        
 $('#enviar').click(function(e) {
     /*e.preventDefault();
     idClinica = $('#idClinica').val();
     nombre = $('#nombre').val();
     localidad = $('#localidad').val();
     provincia = $('#provincia').val();
     direccion = $('#direccion').val();
     cif = $('#cif').val();
     cp = $('#cp').val();
     id_tarifa = $('#id_tarifa').val();

     $.ajax({
         type: 'POST',
         dataType: 'json',
         url: 'php/modificar_clinica.php',
         //lo más cómodo sería mandar los datos mediante 
         //var data = $( "form" ).serialize();
         //pero como el php tiene otros nombres de variables, lo dejo así
         //estos son los datos que queremos actualizar, en json:
         data: {
             id_clinica: idClinica,
             nombre: nombre,
             localidad: localidad,
             provincia: provincia,
             direccion: direccion,
             cp: cp,
             id_tarifa: id_tarifa,
             cif: cif
         },
         error: function(xhr, status, error) {
             //mostraríamos alguna ventana de alerta con el error
         },
         success: function(data) {
            var $mitabla =  $("#miTabla").dataTable( { bRetrieve : true } );
            $mitabla.fnDraw();
         },
         complete: {
             //si queremos hacer algo al terminar la petición ajax
         }
     });*/

     $('#miTabla').fadeIn(100);
     $('#formulario').fadeOut(100);

 });

  $('#cargar_clinicas').on('shown.bs.modal', function() {
    $('#cargar_clinicas').load("php/cargar_clinicas.php");
    $('#nombre').val('');
    $('#nColegiado').val('');
    $('#selectClinicas').val('');
});
});