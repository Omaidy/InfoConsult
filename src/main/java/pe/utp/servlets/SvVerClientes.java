package pe.utp.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.utp.dao.PersonaDaoImplement;
import pe.utp.model.Persona;

/**
 * Servlet implementation class SvVerClientes
 */
public class SvVerClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvVerClientes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros mes y año del request
        String mes = request.getParameter("mes");
        int ano = Integer.parseInt(request.getParameter("ano"));

        // Crear una instancia del DAO y buscar los clientes por mes y año
        PersonaDaoImplement personaDao = new PersonaDaoImplement();
        List<Persona> personas = personaDao.buscarPorMesYAño(mes, ano);
        
     // Añadir la lista de personas y los parámetros mes y año al request para pasarlos al JSP
        request.setAttribute("personas", personas);
        request.setAttribute("mes", mes);
        request.setAttribute("ano", ano);


        // Redirigir a la página JSP que muestra la tabla de clientes
        request.getRequestDispatcher("clientes.jsp").forward(request, response);
    }

}
