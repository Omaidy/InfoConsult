package pe.utp.service;

import org.json.JSONObject;
import pe.utp.model.Persona;
import pe.utp.api.PersonValidator;

public class PersonaService {
    
    private PersonValidator validator = new PersonValidator();

    public Persona obtenerPersonaPorDni(String dni) {
        try {
            JSONObject json = validator.getPersonInfo(dni);
            if (json != null) {
                Persona persona = new Persona();
                persona.setDni(dni);
                persona.setNombres(json.getString("nombres"));
                persona.setApellidoPaterno(json.getString("apellidoPaterno"));
                persona.setApellidoMaterno(json.getString("apellidoMaterno"));
                persona.setTipoDocumento(json.getString("tipoDocumento"));
                persona.setDigitoVerificador(json.getString("digitoVerificador"));
                return persona;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;  // Si no se encuentran datos o ocurre un error
    }
}
