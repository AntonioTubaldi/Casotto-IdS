package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

public class Struttura {

    @Id
    public String idStruttura;
    private String nome;
    private StatoStruttura stato;

    public Struttura(String nome, StatoStruttura stato) {
        this.nome = nome;
        this.stato = stato;
    }

    public String getIdStruttura() {
        return idStruttura;
    }

    public void setIdStruttura(String idStruttura) {
        this.idStruttura = idStruttura;
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
