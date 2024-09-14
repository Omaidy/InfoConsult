package pe.utp.model;

public class Persona {
	String tipoDocumento;
	String digitoVerificador;
	String dni;
	String nombres;
	String apellidoPaterno;
	String apellidoMaterno;
	public Persona() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Persona(String tipoDocumento, String digitoVerificador, String dni, String nombres, String apellidoPaterno,
			String apellidoMaterno) {
		super();
		this.tipoDocumento = tipoDocumento;
		this.digitoVerificador = digitoVerificador;
		this.dni = dni;
		this.nombres = nombres;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
	}
	public String getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	public String getDigitoVerificador() {
		return digitoVerificador;
	}
	public void setDigitoVerificador(String digitoVerificador) {
		this.digitoVerificador = digitoVerificador;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}
	
	
}
