package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriOrdine {
    public String idUtente;
    public double costoTotale;
    public List<Prodotto> prodotti;


    public ParametriOrdine(String idUtente, double costoTotale, List<Prodotto> prodotti) {
        this.idUtente = idUtente;
        this.costoTotale = costoTotale;
        this.prodotti = prodotti;

    }
}
