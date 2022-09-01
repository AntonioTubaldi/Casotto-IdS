package it.unicam.cs.CasottoIdS.models;

import java.time.LocalDate;
import java.time.LocalTime;

public class ParametriModificaEvento {

    public LocalDate data;
    public LocalTime orarioInizio;
    public int numeroMaxPartecipanti;

    public ParametriModificaEvento(LocalDate data, LocalTime orarioInizio, int numeroMaxPartecipanti) {
        this.data = data;
        this.orarioInizio = orarioInizio;
        this.numeroMaxPartecipanti = numeroMaxPartecipanti;
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
