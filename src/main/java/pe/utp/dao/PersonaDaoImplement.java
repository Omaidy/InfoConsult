package pe.utp.dao;

import pe.utp.model.Persona;
import pe.utp.db.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PersonaDaoImplement implements IPersona {

    private String monthName;
    private int year;
    public PersonaDaoImplement() {
        // Puedes dejar el mes y año vacíos o asignar valores predeterminados
    }

    public PersonaDaoImplement(String monthName, int year) {
        this.monthName = monthName;
        this.year = year;
    }

    private Connection getConnection() {
        return DatabaseConnection.getConnection();
    }

    private String getTableName() {
        return "personas_" + monthName + "_" + year;
    }

    public List<Persona> buscarPorMesYAño(String monthName, int year) {
        List<Persona> personas = new ArrayList<>();
        String tableName = "personas_" + monthName + "_" + year;
        String sql = "SELECT * FROM " + tableName;

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Persona persona = mapResultSetToPersona(rs);
                personas.add(persona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return personas;
    }

    @Override
    public void insertar(Persona persona) {
        String tableName = getTableName();
        String sql = "INSERT INTO " + tableName + " (tipoDocumento, digitoVerificador, dni, nombres, apellidoPaterno, apellidoMaterno) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            setPreparedStatementParameters(stmt, persona);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void actualizar(Persona persona) {
    	String tableName = getTableName();
        String sql = "UPDATE " + tableName +" SET tipoDocumento = ?, digitoVerificador = ?, nombres = ?, apellidoPaterno = ?, apellidoMaterno = ? WHERE dni = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, persona.getTipoDocumento());
            stmt.setString(2, persona.getDigitoVerificador());
            stmt.setString(3, persona.getNombres());
            stmt.setString(4, persona.getApellidoPaterno());
            stmt.setString(5, persona.getApellidoMaterno());
            stmt.setString(6, persona.getDni());

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated == 0) {
                throw new SQLException("No se encontró el registro con DNI " + persona.getDni());
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al actualizar la persona", e);
        }
    }


    @Override
    public Persona buscarPorDni(String dni) {
        String tableName = getTableName();
        Persona persona = null;
        String sql = "SELECT * FROM " + tableName + " WHERE dni = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, dni);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                persona = mapResultSetToPersona(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return persona;
    }

    @Override
    public void eliminar(String dni) {
        String tableName = getTableName();
        String sql = "DELETE FROM " + tableName + " WHERE dni = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, dni);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Persona> listarCincoPrimeros(String tableName) {
        List<Persona> personas = new ArrayList<>();
        String sql = "SELECT * FROM " + tableName + " LIMIT 5";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Persona persona = mapResultSetToPersona(rs);
                personas.add(persona);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return personas;
    }

    // Método auxiliar para mapear el ResultSet a una instancia de Persona
    private Persona mapResultSetToPersona(ResultSet rs) throws SQLException {
        Persona persona = new Persona();
        persona.setTipoDocumento(rs.getString("tipoDocumento"));
        persona.setDigitoVerificador(rs.getString("digitoVerificador"));
        persona.setDni(rs.getString("dni"));
        persona.setNombres(rs.getString("nombres"));
        persona.setApellidoPaterno(rs.getString("apellidoPaterno"));
        persona.setApellidoMaterno(rs.getString("apellidoMaterno"));
        return persona;
    }

    // Método auxiliar para configurar los parámetros del PreparedStatement
    private void setPreparedStatementParameters(PreparedStatement stmt, Persona persona) throws SQLException {
        stmt.setString(1, persona.getTipoDocumento());
        stmt.setString(2, persona.getDigitoVerificador());
        stmt.setString(3, persona.getDni());
        stmt.setString(4, persona.getNombres());
        stmt.setString(5, persona.getApellidoPaterno());
        stmt.setString(6, persona.getApellidoMaterno());
    }
}
