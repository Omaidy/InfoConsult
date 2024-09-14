package pe.utp.model;

public class TablaInfo {
    private String mes;
    private String ano;
    private int cantidad;

    // Constructor con todos los atributos
    public TablaInfo(String mes, String ano, int cantidad) {
        this.mes = mes;
        this.ano = ano;
        this.cantidad = cantidad;
    }

    // Constructor vacío
    public TablaInfo() {
    }

    // Getters y Setters
    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
