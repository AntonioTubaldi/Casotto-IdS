package it.unicam.cs.CasottoIdS.models;

public class ParametriUtente {
    public String idUtente;
    public String nome;
    public String cognome;
    public Ruolo ruolo;

    ParametriUtente(String idUtente, String nome, String cognome, Ruolo ruolo) {
        this.idUtente=idUtente;
        this.nome=nome;
        this.cognome=cognome;
        this.ruolo=ruolo;
    }

    public String getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public Ruolo getRuolo() {
        return ruolo;
    }

    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }
}
