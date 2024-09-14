package pe.utp.servlets;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.utp.dao.PersonaDaoImplement;
import pe.utp.model.Persona;

@WebServlet(name = "SvPersonas", urlPatterns = "/SvPersonas")
public class SvPersonas extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SvPersonas() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String mes = request.getParameter("mes");
        String ano = request.getParameter("ano");

        // Validación básica de los parámetros mes y año
        if (mes == null || mes.isEmpty() || ano == null || ano.isEmpty()) {
            response.sendRedirect("SvVerClientes?mes=" + URLEncoder.encode("FEBRERO", "UTF-8") + "&ano=2025");
            return;
        }

        try {
            int year = Integer.parseInt(ano);
            PersonaDaoImplement personaDao = new PersonaDaoImplement(mes, year);

            switch (action) {
                case "add":
                    agregarPersona(request, personaDao, mes, ano, response);
                    break;
                case "edit":
                    editarPersona(request, personaDao, mes, ano, response);
                    break;
                case "delete":
                    eliminarPersona(request, personaDao, mes, ano, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida.");
                    break;
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'ano' debe ser un número válido.");
        }
    }

    private void agregarPersona(HttpServletRequest request, PersonaDaoImplement personaDao, String mes, String ano, HttpServletResponse response) throws IOException {
        // Obtener datos de la persona desde el request
        String dni = request.getParameter("dni");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String digitoVerificador = request.getParameter("digitoVerificador");
        String nombres = request.getParameter("nombres");
        String apellidoPaterno = request.getParameter("apellidoPaterno");
        String apellidoMaterno = request.getParameter("apellidoMaterno");

        // Verificar que todos los parámetros requeridos no sean nulos o vacíos
        if (dni == null || dni.isEmpty() || nombres == null || nombres.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros insuficientes para agregar una persona.");
            return;
        }

        // Crear objeto Persona
        Persona persona = new Persona();
        persona.setDni(dni);
        persona.setTipoDocumento(tipoDocumento);
        persona.setDigitoVerificador(digitoVerificador);
        persona.setNombres(nombres);
        persona.setApellidoPaterno(apellidoPaterno);
        persona.setApellidoMaterno(apellidoMaterno);

        // Agregar persona a la base de datos
        personaDao.insertar(persona);

        // Redirigir a la página de clientes
        response.sendRedirect("SvVerClientes?mes=" + URLEncoder.encode(mes, "UTF-8") + "&ano=" + URLEncoder.encode(ano, "UTF-8"));
    }

    private void editarPersona(HttpServletRequest request, PersonaDaoImplement personaDao, String mes, String ano, HttpServletResponse response) throws IOException {
        // Obtener datos para la edición
        String dni = request.getParameter("dni");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String digitoVerificador = request.getParameter("digitoVerificador");
        String nombres = request.getParameter("nombres");
        String apellidoPaterno = request.getParameter("apellidoPaterno");
        String apellidoMaterno = request.getParameter("apellidoMaterno");

        // Verificar que el DNI no sea nulo ni vacío
        if (dni == null || dni.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'dni' es necesario.");
            return;
        }

        // Crear objeto Persona
        Persona persona = new Persona();
        persona.setDni(dni);
        persona.setTipoDocumento(tipoDocumento);
        persona.setDigitoVerificador(digitoVerificador);
        persona.setNombres(nombres);
        persona.setApellidoPaterno(apellidoPaterno);
        persona.setApellidoMaterno(apellidoMaterno);

        // Actualizar persona
        personaDao.actualizar(persona);

        // Redirigir a la página de clientes
        response.sendRedirect("SvVerClientes?mes=" + URLEncoder.encode(mes, "UTF-8") + "&ano=" + URLEncoder.encode(ano, "UTF-8"));
    }

    private void eliminarPersona(HttpServletRequest request, PersonaDaoImplement personaDao, String mes, String ano, HttpServletResponse response) throws IOException {
        // Obtener el DNI para eliminar
        String dni = request.getParameter("dni");

        if (dni == null || dni.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro 'dni' es necesario.");
            return;
        }

        // Eliminar persona
        personaDao.eliminar(dni);

        // Redirigir a la página de clientes
        response.sendRedirect("SvVerClientes?mes=" + URLEncoder.encode(mes, "UTF-8") + "&ano=" + URLEncoder.encode(ano, "UTF-8"));
    }
}
