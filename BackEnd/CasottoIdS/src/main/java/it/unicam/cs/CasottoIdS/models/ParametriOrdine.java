package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriOrdine {


    public String idUtente;
    public String idOmbrellone;
    public double costoTotale;
    public List<Prodotto> prodotti;
    public StatoOrdine stato;

    public ParametriOrdine(String idUtente, String idOmbrellone, double costoTotale, List<Prodotto> prodotti, StatoOrdine stato) {
        this.idUtente = idUtente;
        this.idOmbrellone=idOmbrellone;
        this.costoTotale = costoTotale;
        this.prodotti = prodotti;
        this.stato = stato;
    }

    public String getIdUtente() {
        return idUtente;
    }

    public String getIdOmbrellone() {
        return idOmbrellone;
    }

    public void setIdOmbrellone(String idOmbrellone) {
        this.idOmbrellone = idOmbrellone;
    }

    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public double getCostoTotale() {
        return costoTotale;
    }

    public void setCostoTotale(double costoTotale) {
        this.costoTotale = costoTotale;
    }

    public List<Prodotto> getProdotti() {
        return prodotti;
    }

    public void setProdotti(List<Prodotto> prodotti) {
        this.prodotti = prodotti;
    }

    public StatoOrdine getStato() {
        return stato;
    }

    public void setStato(StatoOrdine stato) {
        this.stato = stato;
    }
}