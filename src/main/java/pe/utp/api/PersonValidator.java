package pe.utp.api;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONObject;

public class PersonValidator {

    private static final String API_URL = "https://api.apis.net.pe/v2/reniec/dni";
    private static final String API_TOKEN = "apis-token-10399.EzkLm5YaRb09vrINA1lgEa3y9RRvyQH5";

    public JSONObject getPersonInfo(String dni) throws Exception {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(API_URL + "?numero=" + dni))
                .header("Authorization", "Bearer " + API_TOKEN)
                .header("Accept", "application/json")
                .GET()
                .build();
        
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        
        if (response.statusCode() == 200) {
            // Analizar la respuesta JSON
            return new JSONObject(response.body());
        } else {
            throw new RuntimeException("Error en la solicitud. Código de estado: " + response.statusCode());
        }
    }
}
