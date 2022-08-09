package it.unicam.cs.CasottoIdS.models;

public class ParametriProdotto {
    public String nome;
    public double prezzo;


    public ParametriProdotto(String nome, double prezzo) {
        this.nome=nome;
        this.prezzo = prezzo;

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }
}
