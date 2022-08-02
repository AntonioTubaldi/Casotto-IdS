package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;

public class Ordine {
    @Id
    public String idOrdine;
    private String idUtente;
    private double costoTotale;
    private List<Prodotto> prodotti;
    private StatoOrdine stato;

    public Ordine(String idUtente, double costoTotale, List<Prodotto> prodotti) {
        this.idUtente = idUtente;
        this.costoTotale = costoTotale;
        this.prodotti = prodotti;
        this.stato = StatoOrdine.DA_GESTIRE;
    }

    public String getIdOrdine() {
        return idOrdine;
    }

    public String getIdUtente() {
        return idUtente;
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

    @Override
    public String toString() {
        return "Ordine{" +
                "idOrdine='" + idOrdine + '\'' +
                ", idUtente='" + idUtente + '\'' +
                ", costoTotale=" + costoTotale +
                ", prodotti=" + prodotti +
                ", stato=" + stato +
                '}';
    }
}
