package it.unicam.cs.CasottoIdS.models;

public class ParametriProdotto {
    public double prezzo;
    public Tipologia tipologia;

    public ParametriProdotto(double prezzo, Tipologia tipologia) {
        this.prezzo = prezzo;
        this.tipologia = tipologia;
    }
}
