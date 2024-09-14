package pe.utp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.utp.dao.IPersona;
import pe.utp.dao.PersonaDaoImplement;
import pe.utp.db.DatabaseConnection;
import pe.utp.model.Persona;
import pe.utp.model.TablaInfo;

@WebServlet(name = "SvParrillaMeses", urlPatterns = "/SvParrillaMeses")
public class SvParrillaMeses extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IPersona personaDao = new PersonaDaoImplement();  // Instancia del DAO

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mes = request.getParameter("mes"); // Parámetro mes
        String ano = request.getParameter("ano"); // Parámetro año
        List<TablaInfo> tablasInfo = new ArrayList<>();
        List<Persona> registros = new ArrayList<>();
        Connection conn = null;

        try {
            conn = DatabaseConnection.getConnection(); // Obtener la conexión

            // Obtener las tablas que coinciden con el patrón 'personas_%'
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet tables = metaData.getTables(null, null, "personas_%", null);

            while (tables.next()) {
                String tableName = tables.getString("TABLE_NAME");
                int rowCount = getRowCount(conn, tableName);
                String[] parts = tableName.split("_");
                String mesTabla = parts[1];
                String anoTabla = parts[2];
                tablasInfo.add(new TablaInfo(mesTabla.toUpperCase(), anoTabla, rowCount));

                // Verificar si es la tabla solicitada (por mes y año)
                if (mes != null && ano != null && mesTabla.equalsIgnoreCase(mes) && anoTabla.equals(ano)) {
                    registros = getTopRecords(conn, tableName); // Obtener los primeros 5 registros
                }
            }
            tables.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Pasar la lista de tablas y registros al JSP
        request.setAttribute("tablasInfo", tablasInfo);
        request.setAttribute("registros", registros);
        RequestDispatcher dispatcher = request.getRequestDispatcher("parrilla.jsp");
        dispatcher.forward(request, response);
    }

    // Obtener el número de filas en una tabla
    private int getRowCount(Connection conn, String tableName) throws SQLException {
        String sql = "SELECT COUNT(*) FROM " + tableName;
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            rs.next();
            return rs.getInt(1);
        }
    }

    // Obtener los primeros 5 registros de una tabla
    private List<Persona> getTopRecords(Connection conn, String tableName) throws SQLException {
        List<Persona> personas = new ArrayList<>();
        String sql = "SELECT * FROM " + tableName + " LIMIT 5";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Persona persona = new Persona();
                persona.setTipoDocumento(rs.getString("tipoDocumento"));
                persona.setDigitoVerificador(rs.getString("digitoVerificador"));
                persona.setDni(rs.getString("dni"));
                persona.setNombres(rs.getString("nombres"));
                persona.setApellidoPaterno(rs.getString("apellidoPaterno"));
                persona.setApellidoMaterno(rs.getString("apellidoMaterno"));
                personas.add(persona);
            }
        }
        return personas;
    }

}
