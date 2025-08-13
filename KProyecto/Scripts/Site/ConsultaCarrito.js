$(function () {

  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var id = button.data('id');
    var nombre = button.data('nombre');
    var texto = "¿Desea eliminar el producto " + nombre + " de su carrito?";

    $("#IdProducto").val(id);
    $("#Texto").text(texto);
  })

  var table = new DataTable('#TablaDatos', {
    language: {
      url: 'https://cdn.datatables.net/plug-ins/2.3.2/i18n/es-ES.json',
    },
  });


  $("#btnEliminarProductoCarrito").on("click", function () {
    $.ajax({
      "url": "/Carrito/EliminarProductoCarrito",
      "type": "POST",
      "dataType": "json",
      data: {
        IdProducto: $("#IdProducto").val()
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

  $("#btnProcesarPago").on("click", function () {
    $.ajax({
      "url": "/Carrito/ProcesarPago",
      "type": "POST",
      "dataType": "json",
      data: {

      },
      success: function (response) {

        if (response == "OK") {
          window.location.href = "/Carrito/ConsultarFacturas"
        } else {
          alert(response);
        }

      },
    });
  });  
  

});