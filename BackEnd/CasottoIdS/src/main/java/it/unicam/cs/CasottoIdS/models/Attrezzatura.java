package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

public class Attrezzatura {

    @Id
    public String nome;
    private int quantita;

    public Attrezzatura(String nome, int quantita) {
        this.nome = nome;
        this.quantita = quantita;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }
}
