<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="pe.utp.model.TablaInfo"%>
<%@ page import="pe.utp.model.Persona"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Clientes</title>
<!-- Incluir jQuery desde un CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
</head>
<body>
	<header>
		<nav class="navbar bg-dark navbar-expand-lg" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
				</a>
				<button class="navbar-toggler ms-auto" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarText"
					aria-controls="navbarText" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="listanav">
						<li class="nav-item"><a class="nav-link active"
							href="index.html">Inicio</a></li>
						<li class="nav-item"><a class="nav-link" href="clientes.html">Clientes</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/servicios">Servicios</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/contacto">Contacto</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main class="container mt-4">
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<h2 id="clientes-title">
				Clientes del
				<%= request.getParameter("mes") %>
				del
				<%= request.getParameter("ano") %>
			</h2>
							<!-- Botón para abrir el modal de agregar -->
				<button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addModal">
				    Agregar Persona
				</button>
							<!-- Botón para abrir el modal de agregar por API -->
				<button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#addApiModal">
				    Agregar Persona por API
				</button>
		</div>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Tipo de DOC</th>
					<th>Digito Verificador</th>
					<th>Num de Doc</th>
					<th>Nombres</th>
					<th>Apellido Pat.</th>
					<th>Apellido Mat.</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody id="clientes-table-body">
				<%
				List<Persona> personas = (List<Persona>) request.getAttribute("personas");
				for (Persona persona : personas) {
				%>
				<tr>
					<td><%= persona.getTipoDocumento() %></td>
					<td><%= persona.getDigitoVerificador() %></td>
					<td><%= persona.getDni() %></td>
					<td><%= persona.getNombres() %></td>
					<td><%= persona.getApellidoPaterno() %></td>
					<td><%= persona.getApellidoMaterno() %></td>
					<td>
										<!-- Botón que abre el modal -->
					<button type="button" class="btn btn-blue btn-sm" data-bs-toggle="modal" data-bs-target="#editModal"
					        data-dni="<%= persona.getDni() %>" 
					        data-tipoDocumento="<%= persona.getTipoDocumento() %>" 
					        data-digitoVerificador="<%= persona.getDigitoVerificador() %>"
					        data-nombres="<%= persona.getNombres() %>" 
					        data-apellidoPaterno="<%= persona.getApellidoPaterno() %>" 
					        data-apellidoMaterno="<%= persona.getApellidoMaterno() %>">
					    Editar
					</button>
						<form action="SvPersonas" method="post" style="display: inline;">
						    <input type="hidden" name="action" value="delete">
						    <input type="hidden" name="dni" value="<%= persona.getDni() %>">
						    <input type="hidden" name="mes" value="<%= request.getParameter("mes") %>">
						    <input type="hidden" name="ano" value="<%= request.getParameter("ano") %>">
						    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<!-- Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Editar Persona</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editForm" action="SvPersonas" method="post">
          <input type="hidden" name="action" value="edit">
          <input type="hidden" name="mes" value="<%= request.getParameter("mes") %>">
          <input type="hidden" name="ano" value="<%= request.getParameter("ano") %>">
          
          <!-- DNI (readonly) -->
          <div class="mb-3">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="dni" name="dni" readonly>
          </div>

          <!-- Tipo de Documento -->
          <div class="mb-3">
            <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
            <input type="text" class="form-control" id="tipoDocumento" name="tipoDocumento" required>
          </div>

          <!-- Dígito Verificador -->
          <div class="mb-3">
            <label for="digitoVerificador" class="form-label">Dígito Verificador</label>
            <input type="text" class="form-control" id="digitoVerificador" name="digitoVerificador" required>
          </div>

          <!-- Nombres -->
          <div class="mb-3">
            <label for="nombres" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="nombres" name="nombres" required>
          </div>

          <!-- Apellido Paterno -->
          <div class="mb-3">
            <label for="apellidoPaterno" class="form-label">Apellido Paterno</label>
            <input type="text" class="form-control" id="apellidoPaterno" name="apellidoPaterno" required>
          </div>

          <!-- Apellido Materno -->
          <div class="mb-3">
            <label for="apellidoMaterno" class="form-label">Apellido Materno</label>
            <input type="text" class="form-control" id="apellidoMaterno" name="apellidoMaterno" required>
          </div>

          <button type="submit" class="btn btn-primary">Guardar cambios</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal para agregar persona -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addModalLabel">Agregar Persona</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addForm" action="SvPersonas" method="post">
          <input type="hidden" name="action" value="add">
          <input type="hidden" name="mes" value="<%= request.getParameter("mes") %>">
          <input type="hidden" name="ano" value="<%= request.getParameter("ano") %>">
          
          <!-- DNI -->
          <div class="mb-3">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="addDni" name="dni" required>
          </div>

          <!-- Tipo de Documento -->
          <div class="mb-3">
            <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
            <input type="text" class="form-control" id="addTipoDocumento" name="tipoDocumento" required>
          </div>

          <!-- Dígito Verificador -->
          <div class="mb-3">
            <label for="digitoVerificador" class="form-label">Dígito Verificador</label>
            <input type="text" class="form-control" id="addDigitoVerificador" name="digitoVerificador" required>
          </div>

          <!-- Nombres -->
          <div class="mb-3">
            <label for="nombres" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="addNombres" name="nombres" required>
          </div>

          <!-- Apellido Paterno -->
          <div class="mb-3">
            <label for="apellidoPaterno" class="form-label">Apellido Paterno</label>
            <input type="text" class="form-control" id="addApellidoPaterno" name="apellidoPaterno" required>
          </div>

          <!-- Apellido Materno -->
          <div class="mb-3">
            <label for="apellidoMaterno" class="form-label">Apellido Materno</label>
            <input type="text" class="form-control" id="addApellidoMaterno" name="apellidoMaterno" required>
          </div>

          <button type="submit" class="btn btn-primary">Agregar Persona</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal para agregar persona por API -->
<div class="modal fade" id="addApiModal" tabindex="-1" aria-labelledby="addApiModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addApiModalLabel">Agregar Persona por API</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addApiForm" action="SvPersonasApi" method="post">
          <input type="hidden" name="action" value="addApi">
          <input type="hidden" name="mes" value="<%= request.getParameter("mes") %>">
          <input type="hidden" name="ano" value="<%= request.getParameter("ano") %>">

          <!-- DNI -->
          <div class="mb-3">
            <label for="apiDni" class="form-label">DNI</label>
            <input type="text" class="form-control" id="apiDni" name="dni" required>
          </div>

          <button type="submit" class="btn btn-primary">Buscar y Agregar Persona</button>
        </form>
      </div>
    </div>
  </div>
</div>
		<!-- Botón para regresar a la parrilla de meses -->
		<div class="mt-4">
			<a href="SvParrillaMeses" class="btn btn-primary">Volver a la Parrilla de Meses</a>
		</div>
		
	</main>
<script>
  var editModal = document.getElementById('editModal');
  editModal.addEventListener('show.bs.modal', function (event) {
    // Botón que abrió el modal
    var button = event.relatedTarget;

    // Extraer la información de los atributos data-* del botón
    var dni = button.getAttribute('data-dni');
    var tipoDocumento = button.getAttribute('data-tipoDocumento');
    var digitoVerificador = button.getAttribute('data-digitoVerificador');
    var nombres = button.getAttribute('data-nombres');
    var apellidoPaterno = button.getAttribute('data-apellidoPaterno');
    var apellidoMaterno = button.getAttribute('data-apellidoMaterno');

    // Seleccionar los campos del formulario dentro del modal y asignar los valores
    var modalDni = editModal.querySelector('#dni');
    var modalTipoDocumento = editModal.querySelector('#tipoDocumento');
    var modalDigitoVerificador = editModal.querySelector('#digitoVerificador');
    var modalNombres = editModal.querySelector('#nombres');
    var modalApellidoPaterno = editModal.querySelector('#apellidoPaterno');
    var modalApellidoMaterno = editModal.querySelector('#apellidoMaterno');

    modalDni.value = dni;
    modalTipoDocumento.value = tipoDocumento;
    modalDigitoVerificador.value = digitoVerificador;
    modalNombres.value = nombres;
    modalApellidoPaterno.value = apellidoPaterno;
    modalApellidoMaterno.value = apellidoMaterno;
  });
</script>
	



</body>
</html>
