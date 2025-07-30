$(function () {

  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);

    var id = button.data('id');
    var nombre = button.data('nombre'); 
    var texto = "¿Desea actualizar la información del usuario " + nombre + "?";

    var estado = button.data('estado'); 
    var rol = button.data('rol'); 
   
    $("#IdUsuario").val(id);
    $("#Texto").text(texto);
    $("#Estado").val(estado === 'True' ? '1' : '0');
    $("#Rol").val(rol);
  })

  new DataTable('#TablaDatos', {
    language: {
      url: 'https://cdn.datatables.net/plug-ins/2.3.2/i18n/es-ES.json',
    },
  });

  $("#btnCambiarDatosUsuario").on("click", function() {
    $.ajax({
      "url": "/Usuario/CambiarDatosUsuario",
      "type": "POST",
      "dataType": "json",
      data: {
        IdUsuario: $("#IdUsuario").val(),
        Estado: $("#Estado").val() === '1' ? true : false,
        IdRol: $("#Rol").val()
      },
      success: function (response) {

        if (response == "OK") {
          location.reload();
        } else {
          alert(response);
        }

      },
    });

  });

});