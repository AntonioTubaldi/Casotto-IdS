package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class Evento {

    @Id
    public String idEvento;
    private String nome;
    private LocalDate data;
    private LocalTime orarioInizio;
    
    private int numeroMaxPartecipanti;
    private int numeroPartecipanti;

    public Evento(String nome, LocalDate data, LocalTime orarioInizio, int numeroMaxPartecipanti) {
        this.nome = nome;
        this.data = data;
        this.orarioInizio = orarioInizio;
        this.numeroMaxPartecipanti = numeroMaxPartecipanti;
        this.numeroPartecipanti = 0;
    }

   /* public void addPartecipanti(Utente nuovoUtente) {
        this.partecipanti.add(nuovoUtente);
    } */




    public String getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(String idEvento) {
        this.idEvento = idEvento;
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

    public int getNumeroPartecipanti() {
        return numeroPartecipanti;
    }

    public void setNumeroPartecipanti(int numeroPartecipanti) {
        this.numeroPartecipanti = numeroPartecipanti;
    }

    /* public List<Utente> getPartecipanti() {
        return partecipanti;
    }

    public void setPartecipanti(List<Utente> partecipanti) {
        this.partecipanti = partecipanti;
    } */

    public int getNumeroMaxPartecipanti() {
        return numeroMaxPartecipanti;
    }

    public void setNumeroMaxPartecipanti(int numeroMaxPartecipanti) {
        this.numeroMaxPartecipanti = numeroMaxPartecipanti;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Evento evento = (Evento) o;
        return idEvento.equals(evento.idEvento);
    }


}
