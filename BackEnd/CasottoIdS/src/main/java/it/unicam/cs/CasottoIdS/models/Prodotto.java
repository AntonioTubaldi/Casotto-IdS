package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

public class Prodotto {
    @Id
    public String idProdotto;
    private String nome;
    private double prezzo;
    private Tipologia tipologia;

    public Prodotto(String nome, double prezzo, Tipologia tipologia) {
        this.nome = nome;
        this.prezzo = prezzo;
        this.tipologia = tipologia;

    }

    public String getIdProdotto() {
        return idProdotto;
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

    public Tipologia getTipologia() {
        return tipologia;
    }

    public void setTipologia(Tipologia tipologia) {
        this.tipologia = tipologia;
    }

    @Override
    public String toString() {
        return "Prodotto{" +
                "idProdotto='" + idProdotto + '\'' +
                ", nome='" + nome + '\'' +
                ", prezzo=" + prezzo +
                ", tipologia=" + tipologia +
                '}';
    }
}
