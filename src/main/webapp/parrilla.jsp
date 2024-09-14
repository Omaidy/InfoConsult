<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="pe.utp.model.TablaInfo"%>
<%@ page import="pe.utp.model.Persona"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="/Css/styles.css">
<style>
.month-container {
	cursor: pointer;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 5px;
	text-align: center;
	background-color: #f8f9fa;
}

.month-container:hover {
	background-color: #e2e6ea;
}

.hidden {
	display: none;
}
   
</style>

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
    <!-- Bienvenida al Usuario -->
    <div class="welcome-header">
        <h1 class="display-4">¡Bienvenido!</h1>
        <p class="lead">Aquí puedes consultar las tablas de clientes por mes.</p>
    </div>

    <!-- Header de Clientes -->
    <div id="clientes-header">
        <h2 id="clientes-title">Meses</h2>
    </div>

    <!-- Parrilla de Meses -->
    <div class="container">
        <h1>Parrilla de Meses</h1>

        <!-- Mostrar la parrilla de meses -->
        <div class="row">
            <%
            List<TablaInfo> tablasInfo = (List<TablaInfo>) request.getAttribute("tablasInfo");
            for (TablaInfo tabla : tablasInfo) {
            %>
            <div class="col-md-4 mb-3">
                <!-- Agregar un formulario con parámetros ocultos -->
                <form action="SvParrillaMeses" method="get">
                    <input type="hidden" name="mes" value="<%=tabla.getMes()%>">
                    <input type="hidden" name="ano" value="<%=tabla.getAno()%>">
                    <div class="month-container">
                        <h4><%=tabla.getMes()%> <%=tabla.getAno()%></h4>
                        <p><%=tabla.getCantidad()%> Clientes</p>
                        <button type="submit" class="btn btn-primary">Ver Clientes</button>
                    </div>
                </form>
            </div>
            <%
            }
            %>
        </div>

        <!-- Sección de la tabla que se mostrará al hacer clic en un mes -->
        <div id="table-section" class="table-section">
            <div class="table-header" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="table-title">Clientes - Mes Año</h3>
                
                <!-- Botón para acceder a la tabla de clientes -->
                <form action="SvVerClientes" method="get">
                    <input type="hidden" name="mes" value="<%=request.getParameter("mes")%>">
                    <input type="hidden" name="ano" value="<%=request.getParameter("ano")%>">
                    <button type="submit" class="btn btn-primary">Acceder a Tabla de Clientes</button>
                </form>
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
                    </tr>
                </thead>
                <tbody id="registros-body">
                    <%
                    List<Persona> registros = (List<Persona>) request.getAttribute("registros");
                    for (Persona persona : registros) {
                    %>
                    <tr>
                        <td><%=persona.getTipoDocumento()%></td>
                        <td><%=persona.getDigitoVerificador()%></td>
                        <td><%=persona.getDni()%></td>
                        <td><%=persona.getNombres()%></td>
                        <td><%=persona.getApellidoPaterno()%></td>
                        <td><%=persona.getApellidoMaterno()%></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</main>

	<!-- Fragmento del Footer -->
	<footer class="bg-dark text-light pt-4">
		<div class="container px-5">
			<div class="row">
				<div class="col-12 col-lg-4 mb-3">
					<h3 class="fw-bold">AYCHOW</h3>
					<p class="pt-2">Av. Tecnológica 123, Lima, Perú.</p>
					<p class="mb-2">Teléfono: +51 987 654 321</p>
					<p>Correo: contacto@aychow.com</p>
				</div>

				<div class="col-6 col-lg-2">
					<h5>Menú</h5>
					<ul class="list-unstyled pt-2">
						<li class="py-1"><a href="/"
							class="text-light text-decoration-none">Inicio</a></li>
						<li class="py-1"><a href="/tienda"
							class="text-light text-decoration-none">Usuarios</a></li>
						<li class="py-1"><a href="/conocenos"
							class="text-light text-decoration-none">Conócenos</a></li>
					</ul>
				</div>

				<div class="col-6 col-lg-2">
					<h5>Categorías</h5>
					<ul class="list-unstyled pt-2">
						<li class="py-1"><a href="#"
							class="text-light text-decoration-none">Número</a></li>
						<li class="py-1"><a href="#"
							class="text-light text-decoration-none">Correo</a></li>
						<li class="py-1"><a href="#"
							class="text-light text-decoration-none">Contactos</a></li>
					</ul>
				</div>

				<div class="col-12 col-lg-4 text-lg-end">
					<h5>Redes Sociales</h5>
					<div class="social-media pt-2">
						<a href="https://www.facebook.com" class="text-light fs-3 me-3"><i
							class="fab fa-facebook"></i></a> <a href="https://www.instagram.com"
							class="text-light fs-3 me-3"><i class="fab fa-instagram"></i></a>
						<a href="#" class="text-light fs-3 me-3"><i
							class="fab fa-whatsapp"></i></a> <a href="https://www.twitter.com"
							class="text-light fs-3"><i class="fab fa-twitter"></i></a>
					</div>
				</div>
			</div>
			<hr class="text-secondary">

			<div class="d-sm-flex justify-content-between py-1">
				<p>2024 © AYCHOW. Todos los derechos reservados.</p>
				<p>
					<a href="#" class="text-light text-decoration-none pe-4">Términos
						y Condiciones</a> <a href="#" class="text-light text-decoration-none">Política
						de Privacidad</a>
				</p>
			</div>
		</div>
	</footer>
</body>
</html>