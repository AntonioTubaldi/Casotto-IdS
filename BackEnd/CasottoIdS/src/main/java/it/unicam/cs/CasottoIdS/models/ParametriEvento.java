package it.unicam.cs.CasottoIdS.models;

import java.time.LocalDate;
import java.time.LocalTime;

public class ParametriEvento {

    public String nome;
    public LocalDate data;
    public LocalTime orarioInizio;
    public int numeroMaxPartecipanti;

    public ParametriEvento(String nome, LocalDate data, LocalTime orarioInizio, int numeroMaxPartecipanti) {
        this.nome = nome;
        this.data = data;
        this.orarioInizio = orarioInizio;
        this.numeroMaxPartecipanti = numeroMaxPartecipanti;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public LocalTime getOrarioInizio() {
        return orarioInizio;
    }

    public void setOrarioInizio(LocalTime orarioInizio) {
        this.orarioInizio = orarioInizio;
    }

    public int getNumeroMaxPartecipanti() {
        return numeroMaxPartecipanti;
    }

    public void setNumeroMaxPartecipanti(int numeroMaxPartecipanti) {
        this.numeroMaxPartecipanti = numeroMaxPartecipanti;
    }
}
