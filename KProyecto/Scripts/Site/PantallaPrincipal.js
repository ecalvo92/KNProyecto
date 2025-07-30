function AgregarAlCarrito(idProducto) {

  $.ajax({
    "url": "/Carrito/AgregarCarrito",
    "type": "POST",
    "dataType": "json",
    data: {
      IdProducto: idProducto
    },
    success: function (response) {

      if (response == "OK") {
        location.reload();
      } else {
        alert(response);
      }

    },
  });

}

