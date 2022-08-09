package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

public class Prodotto {
    @Id
    public String nome;
    private double prezzo;


    public Prodotto(String nome, double prezzo) {
        this.nome = nome;
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


    @Override
    public String toString() {
        return "Prodotto{" +
                 '\'' +
                ", nome='" + nome + '\'' +
                ", prezzo=" + prezzo  +
                '}';
    }
}
