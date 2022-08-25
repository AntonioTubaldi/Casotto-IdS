package it.unicam.cs.CasottoIdS.models;

public class ParametriStruttura {

    public String nome;
    public StatoStruttura stato;

    public ParametriStruttura(String nome, StatoStruttura stato) {
        this.nome = nome;
        this.stato = stato;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public StatoStruttura getStato() {
        return stato;
    }

    public void setStato(StatoStruttura stato) {
        this.stato = stato;
    }
}
