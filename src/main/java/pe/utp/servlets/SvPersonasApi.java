package pe.utp.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.utp.service.PersonaService;
import pe.utp.dao.PersonaDaoImplement;
import pe.utp.model.Persona;

@WebServlet(name = "SvPersonasApi", urlPatterns = "/SvPersonasApi")
public class SvPersonasApi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SvPersonasApi() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String dni = request.getParameter("dni");
        String mes = request.getParameter("mes");
        String ano = request.getParameter("ano");

        if (dni == null || dni.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'dni' es obligatorio.");
            return;
        }

        if ("addApi".equals(action)) {
            try {
                // Usar el servicio para obtener los datos de la persona por DNI
                PersonaService personaService = new PersonaService();
                Persona persona = personaService.obtenerPersonaPorDni(dni);

                if (persona != null) {
                    PersonaDaoImplement personaDao = new PersonaDaoImplement(mes, Integer.parseInt(ano));
                    personaDao.insertar(persona); // Insertar la persona obtenida en la base de datos
                    response.sendRedirect("SvVerClientes?mes=" + mes + "&ano=" + ano);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontraron datos para el DNI proporcionado.");
                }

            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al buscar los datos de la persona.");
                e.printStackTrace();
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida.");
        }
    }
}
