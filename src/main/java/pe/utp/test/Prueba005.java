package pe.utp.test;

import java.util.List;
import java.util.Scanner;

import org.json.JSONObject;

import pe.utp.api.PersonValidator;  // Importar la clase PersonValidator
import pe.utp.dao.PersonaDaoImplement;
import pe.utp.model.Persona;

public class Prueba005 {

    private static Scanner scanner = new Scanner(System.in);
    private static PersonaDaoImplement personaDao;
    private static PersonValidator personValidator = new PersonValidator();

    public static void main(String[] args) {
        while (true) {
            System.out.println("Seleccione el mes y el año para aplicar las operaciones CRUD:");
            System.out.println("Ingrese el mes (por ejemplo, enero, febrero, diciembre):");
            String monthName = scanner.nextLine();
            System.out.println("Ingrese el año (por ejemplo, 2024):");
            int year = scanner.nextInt();
            scanner.nextLine();  // Limpiar el buffer

            personaDao = new PersonaDaoImplement(monthName, year);

            performCrudOperations();
        }
    }

    private static void performCrudOperations() {
        while (true) {
            System.out.println("Seleccione una operación CRUD:");
            System.out.println("1. Insertar persona");
            System.out.println("2. Buscar persona por DNI");
            System.out.println("3. Listar todas las personas");
            System.out.println("4. Salir");

            int operation = scanner.nextInt();
            scanner.nextLine();  // Limpiar el buffer

            switch (operation) {
                case 1:
                    insertPersona();
                    break;
                case 2:
                    searchPersonaByDni();
                    break;
                case 3:
                	System.out.println("Saliendo...");
                    break;
                case 4:
                    System.out.println("Saliendo...");
                    return;
                default:
                    System.out.println("Opción no válida. Intente de nuevo.");
                    continue;
            }
        }
    }

    private static void insertPersona() {
        System.out.println("Seleccione cómo desea agregar la persona:");
        System.out.println("1. Manualmente");
        System.out.println("2. A través de la API");

        int choice = scanner.nextInt();
        scanner.nextLine();  // Limpiar el buffer

        if (choice == 1) {
            // Agregar manualmente
            addPersonaManually();
        } else if (choice == 2) {
            // Agregar a través de la API
            addPersonaThroughApi();
        } else {
            System.out.println("Opción no válida. Volviendo al menú principal.");
        }
    }

    private static void addPersonaManually() {
        System.out.println("Ingrese el tipo de documento:");
        String tipoDocumento = scanner.nextLine();
        System.out.println("Ingrese el dígito verificador:");
        String digitoVerificador = scanner.nextLine();
        System.out.println("Ingrese el DNI:");
        String dni = scanner.nextLine();
        System.out.println("Ingrese los nombres:");
        String nombres = scanner.nextLine();
        System.out.println("Ingrese el apellido paterno:");
        String apellidoPaterno = scanner.nextLine();
        System.out.println("Ingrese el apellido materno:");
        String apellidoMaterno = scanner.nextLine();

        Persona persona = new Persona(tipoDocumento, digitoVerificador, dni, nombres, apellidoPaterno, apellidoMaterno);
        personaDao.insertar(persona);
        System.out.println("Persona insertada correctamente.");
    }

    private static void addPersonaThroughApi() {
        System.out.println("Ingrese el DNI para obtener la información de la persona:");
        String dni = scanner.nextLine();

        try {
            JSONObject personaJson = personValidator.getPersonInfo(dni);

            // Extraer datos del JSON y crear un objeto Persona
            String tipoDocumento = personaJson.optString("tipoDocumento", "Desconocido");
            String digitoVerificador = personaJson.optString("digitoVerificador", "Desconocido");
            String nombres = personaJson.optString("nombres", "Desconocido");
            String apellidoPaterno = personaJson.optString("apellidoPaterno", "Desconocido");
            String apellidoMaterno = personaJson.optString("apellidoMaterno", "Desconocido");

            Persona persona = new Persona(tipoDocumento, digitoVerificador, dni, nombres, apellidoPaterno, apellidoMaterno);
            personaDao.insertar(persona);
            System.out.println("Persona insertada correctamente a través de la API.");
        } catch (Exception e) {
            System.out.println("Error al obtener información de la API: " + e.getMessage());
        }
    }

    private static void searchPersonaByDni() {
        System.out.println("Ingrese el DNI:");
        String dni = scanner.nextLine();

        Persona persona = personaDao.buscarPorDni(dni);
        if (persona != null) {
            System.out.println("Persona encontrada:");
            System.out.println("Tipo de Documento: " + persona.getTipoDocumento());
            System.out.println("Dígito Verificador: " + persona.getDigitoVerificador());
            System.out.println("DNI: " + persona.getDni());
            System.out.println("Nombres: " + persona.getNombres());
            System.out.println("Apellido Paterno: " + persona.getApellidoPaterno());
            System.out.println("Apellido Materno: " + persona.getApellidoMaterno());
        } else {
            System.out.println("No se encontró ninguna persona con el DNI proporcionado.");
        }
    }

    
}

