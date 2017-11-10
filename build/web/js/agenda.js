var fechaSeleccionada="<% out.print(fechaSeleccionada) %>";
function seleccion(){
	this.fechaSeleccionada=fechaSeleccionada;
	document.getElementById("fechaVis").setAttribute("value", fechaSeleccionada);
}

saveFile = "E:/DocumentosProgramacion/BaseDeDatos/I/Proyecto/web/archivosSubidos/" + saveFile;

saveFile = "http://localhost:9090/Proyecto/archivosSubidos/" + saveFile;