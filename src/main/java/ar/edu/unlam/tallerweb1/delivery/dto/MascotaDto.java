package ar.edu.unlam.tallerweb1.delivery.dto;

import ar.edu.unlam.tallerweb1.model.enumerated.GeneroMascota;
import ar.edu.unlam.tallerweb1.model.enumerated.TipoMascota;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Date;

public class MascotaDto {


    private String nombre;


    private String tipo;

    private String genero;
    private String raza;
    private Float peso;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date nacimiento;
    private String personalidad;
    private String salud;
    private String foto;

    private MultipartFile imagen;


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public TipoMascota getTipoToEnum(){
        if(this.tipo.equalsIgnoreCase("perro"))
            return TipoMascota.PERRO;
        return TipoMascota.GATO;
    }

    public void setEnumToTipo(TipoMascota tipo){
        this.tipo = tipo == TipoMascota.PERRO ? "PERRO" : "GATO";
    }

    public GeneroMascota getGeneroToEnum(){
        if(this.genero.equalsIgnoreCase("macho")) return GeneroMascota.MACHO;
        return GeneroMascota.HEMBRA;
    }

    public void setEnumToGenero(GeneroMascota genero){
        this.genero = genero == GeneroMascota.MACHO ? "MACHO" : "HEMBRA";
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getPersonalidad() {
        return personalidad;
    }

    public void setPersonalidad(String personalidad) {
        this.personalidad = personalidad;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public Date getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(Date nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getSalud() {
        return salud;
    }

    public void setSalud(String salud) {
        this.salud = salud;
    }

    public Float getPeso() {
        return peso;
    }

    public void setPeso(Float peso) {
        this.peso = peso;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public MultipartFile getImagen() {
        return imagen;
    }

    public void setImagen(MultipartFile imagen) {
        this.imagen = imagen;
    }
}
