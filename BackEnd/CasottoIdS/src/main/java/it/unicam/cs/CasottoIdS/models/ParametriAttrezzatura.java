package it.unicam.cs.CasottoIdS.models;

public class ParametriAttrezzatura {

    public String nome;
    public int quantita;

    public ParametriAttrezzatura(String nome, int quantita) {
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
