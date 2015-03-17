'use strict';

// Metodo especial de validacion para España, con acentos y ñ
$.validator.addMethod("lettersonly", function(value, element) {
    return this.optional(element) || /^[áéíóúÁÉÍÓÚA-Za-zñÑçÇ ]+$/i.test(value);
}, "Por favor, introduzca solo letras");

// Declaracion inicial de variables para posterior utilizacion
var idDoctor;
var nombre;
var numcolegiado;
var id_clinica;

$(document).ready(function() {   
var miTabla = $('#miTabla').DataTable({
  // Modificamos las propiedades de las columnas especiales
  "columnDefs": [
      {     
          "targets": [ 3 ],
          "visible": false,/*No es visible*/
          "searchable":  false
      },
      {
          "targets": [ 4 , 5 ],
          "orderable": false/*No permite ordenar*/
      }
  ],
  'processing': true,
  'serverSide': true,
  'ajax': 'php/cargar_vdoctores_clinicas.php',
  'language': {
    'sProcessing': 'Procesando...',
    'sLengthMenu': 'Mostrar _MENU_ registros',
    'sZeroRecords': 'No se encontraron resultados',
    'sEmptyTable': 'Ningún dato disponible en esta tabla',
    'sInfo': 'Registros del _START_ al _END_ <br/>(total de _TOTAL_ registros)',
    'sInfoEmpty': 'Sin registros',
    'sInfoFiltered': '(filtrado de un total de _MAX_ registros)',
    'sInfoPostFix': '',
    'sSearch': 'Filtrar / Buscar:',
    'sUrl': '',
    'sInfoThousands': ',',
    'sLoadingRecords': 'Cargando datos...',
    'oPaginate': {
       'sFirst': 'Primero',
       'sLast': 'Último',
       'sNext': 'Pag. Siguiente >>',
       'sPrevious': '<< Pag. Anterior '
    },
    'oAria': {
       'sSortAscending': ': Activar para ordenar la columna de manera ascendente',
       'sSortDescending': ': Activar para ordenar la columna de manera descendente'
    }
  },
    'columns': [{
      'data': 'nombre'
    }, {
      'data': 'numcolegiado'
    }, { 
      'data': 'nombreClinica',
        'render': function(data) {
          /*Lista las clinicas del doctor*/
        return '<li>' + data + '</li><br>';
    }
    }, {
      'data': 'idClinica'
  }, {
      'data': 'idDoctor',
      'render': function(data) {
      /*Boton para editar el doctor*/
      return '<a class="btn btn-warning editarbtn" >Editar</a>';   
    }
  },{
      'data': 'idDoctor',
      'render': function(data) {
      /*Boton para borrar el doctor que carga una ventana modal*/
      return '<a class="btn btn-danger borrarbtn" data-toggle="modal" data-target="#modalBorrarDoctor" >Borrar</a>';   
    }
  }]
});

  /* 
    Ocultamos la tabla y mostramos el formulario 
    de edicion para doctores, mostrando los valores del 
    doctor seleccionado (id, nombre, nº colegiado y clinicas)
  */
  $('#miTabla').on('click', '.editarbtn', function(e) {
    e.preventDefault();
    $('#tabla').fadeOut(100);
    $('#formularioEditarDoctor').fadeIn(100);
    var nRow = $(this).parents('tr')[0];
    var aData = miTabla.row(nRow).data();
    $('#idDoctor').val(aData.idDoctor);
    $('#nombre').val(aData.nombre);
    $('#numcolegiado').val(aData.numcolegiado);
    $('#clinicasEditar').val(aData.nombreClinica);
    // Llamamos a la funcion que busca las clinicas y las añade al select
    cargarClinicas();
    // Seleccionamos y separamos las clinicas de la vista
    var listaClinicas = aData.idClinica;
    listaClinicas = listaClinicas.split(",");
    // Añadimos las clinicas del doctor al select como selected
    $('#clinicasEditar').val(listaClinicas);  
  });

  // Boton borrar que carga el doctor que va a ser borrado por la ventana modal 
  $('#miTabla').on('click', '.borrarbtn', function(e) {
    var nRow = $(this).parents('tr')[0];
    var aData = miTabla.row(nRow).data();
    idDoctor = aData.idDoctor;
  });

  /*
    Boton de confirmacion en la ventana modal, realiza la peticion
    ajax para borrar al doctor con la id seleccionada al darle al 
    boton borrar y muestra un growl con el resultado
  */
  $('#modalBorrarDoctor').on('click','#borrarDoctor',function(e){
    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: 'php/borrar_doctor.php',
      data: {
         id_doctor: idDoctor
      },
      error: function(xhr, status, error) {
        // Si da error al borrar
        $.growl({
          icon: "glyphicon glyphicon-remove",
          message: " Error, no se puede borrar el doctor"
        },{
          type: "danger"
        });
      },
      success: function(data) {
        // Si no da error actualizamos datatables
        var $mitabla =  $("#miTabla").dataTable( { bRetrieve : true } );
        // y volvemos a mostrar el resultado
        $mitabla.fnDraw();
        $.growl({
          icon: "glyphicon glyphicon-remove",
          message: " Doctor borrado correctamente"
        },{
          type: "success"
        });
      },
      complete: {
          //Si funciona o no, programariamos que hace
      }
    });
    // Volvemos a mostrar datatables
    $('#tabla').fadeIn(100);
  });

  /*
    Validacion del formulario para editar el doctor siguiendo 
    las indicaciones del ejercicio en github, si los datos son 
    correctos procede a editar el doctor segun los parametros 
    al darle al boton editarbtn.
    Muestra el growl correspondiente segun como valla el ajax
  */
  $('#editarDoctor').validate({
    rules:  
    {
      nombre: {
        required: true,
        lettersonly: true 
      },
      numcolegiado: {
        digits: true
      },
      clinicasEditar:{
        required:true
      }
    },
    submitHandler: function() {
      idDoctor = $('#idDoctor').val();
      nombre = $('#nombre').val();
      numcolegiado = $('#numcolegiado').val();
      id_clinica = $('#clinicasEditar').val();
      $.ajax({
        type: 'POST',
        dataType: 'json',
        url: 'php/editar_doctor.php',
        data: {
           idDoctor: idDoctor,
           nombre: nombre,
           numcolegiado: numcolegiado,
           id_clinica:id_clinica
        },
        error: function(xhr, status, error) {
          /*Error de growl*/
          $.growl({         
            icon: "glyphicon glyphicon-remove",
            message: " Error, no se puede editar el doctor"
          },{
            type: "danger"
          });
        },
        success: function(data) {
          // Si no da error actualizamos datatables
          var $mitabla =  $("#miTabla").dataTable( { bRetrieve : true } );
          // y volvemos a mostrar el resultado
          $mitabla.fnDraw();
          // Si todo fue bien (no dio un error mysql_errno)
          if(data[0].estado==0){
            /*Ok de growl*/
            $.growl({
              icon: "glyphicon glyphicon-ok",
              message: "Doctor editado correctamente"
            },{
              type: "success"
            });
          }else{
            $.growl({                
              icon: "glyphicon glyphicon-remove",
              message: " Error, no se puede editar el doctor"
            },{
              type: "danger"
            });
          }
        },
          complete: {
          }
        });
        /*
           Ocultamos el formulario para editar el doctor
           y volvemos a mostrar datatables
        */
        $('#formularioEditarDoctor').fadeOut(100);
        $('#tabla').fadeIn(100);
      }
  });

  /*
    Validacion del formulario para crear el doctor siguiendo 
    las indicaciones del ejercicio en github, si los datos son 
    correctos procede a crear el doctor segun los parametros 
    al darle al boton editarbtn.
    Muestra el growl correspondiente segun como valla el ajax
  */    
  $('#crearDoctor').validate({
    rules: {
        nombreNuevo: {
          required: true,
          lettersonly: true 
        },
    numcolegiadoNuevo: {
          required: true,
          digits: true
        },
    clinicasCrear:{
          required:true
        }
    },
  submitHandler: function() {
  var nombreNuevo = $('#nombreNuevo').val();
  var numcolegiadoNuevo = $('#numcolegiadoNuevo').val();
  var clinicasCrear = $('#clinicasCrear').val();
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: 'php/nuevo_doctor.php',
    data: {
       nombreNuevo: nombreNuevo,
       numcolegiadoNuevo: numcolegiadoNuevo,
       clinicasCrear: clinicasCrear 
    },
    error: function(xhr, status, error) {
      $.growl({
        icon: "glyphicon glyphicon-remove",
        message: " Error, no se pudo añadir el doctor"
      },{
        type: "danger"
      });
    },
    success: function(data) {
      // Si no da error actualizamos datatables
      var $mitabla =  $("#miTabla").dataTable( { bRetrieve : true } );
      // y volvemos a mostrar el resultado
      $mitabla.fnDraw();
      // Si todo fue bien (no dio un error mysql_errno)      
      if(data[0].estado==0){
        $.growl({
          icon: "glyphicon glyphicon-ok",
          message: "Doctor añadido correctamente"
        },{
          type: "success"
        });
      }else{
        $.growl({
            icon: "glyphicon glyphicon-remove",
            message: " Error. no se pudo añadir el doctor!"
          },{
            type: "danger"
        });
      }
    },
      complete: {
    }
  });
    /*
       Ocultamos el formulario para editar el doctor
       y volvemos a mostrar datatables
    */
    $('#formularioCrearDoctor').fadeOut(100);
    $('#tabla').fadeIn(100);
  }                
  });

  /*boton añadir doctor,oculto tabla para mostrar form*/
  $('#añadirDoctor').click(function(e) {
    e.preventDefault();
    $('#tabla').fadeOut(100);
    $('#formularioCrearDoctor').fadeIn(100);
    $('#nombreNuevo').val("");
    $('#numcolegiadoNuevo').val("");
    cargarClinicas();
  });

  /* 
    Funcion para cargar las clinicas en el select,
    he realizado una funcion porque se utiliza varias veces (2)
  */
  function cargarClinicas() {
    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: 'php/cargar_clinicas.php',
      async: false,
      error: function(xhr, status, error) {
        $.growl({
            icon: "glyphicon glyphicon-remove",
            message: " Error al cargar las clinicas"
          },{
            type: "danger"
        });
      },
      success: function(data) {
         $('#clinicasCrear').empty();
         $.each(data, function() {
             $('#clinicasCrear').append(
                 $('<option ></option>').val(this.id_clinica).html(this.nombre)
             );
         });
         $('#clinicasEditar').empty();
         $.each(data, function() {
           $('#clinicasEditar').append(
               $('<option ></option>').val(this.id_clinica).html(this.nombre)
           );
        });
      },
      complete: {
      }
    });
  }   
       
});
