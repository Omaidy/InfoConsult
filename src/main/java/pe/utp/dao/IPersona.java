package pe.utp.dao;

import java.util.List;

import pe.utp.model.Persona;

public interface IPersona {
	public List<Persona> buscarPorMesYAño(String monthName, int year);
	public void insertar(Persona persona);
	public void actualizar(Persona persona);
	public Persona buscarPorDni(String dni);
	public void eliminar(String dni);
	// Nuevo método para listar los primeros 5 registros
    public List<Persona> listarCincoPrimeros(String tableName);
}
