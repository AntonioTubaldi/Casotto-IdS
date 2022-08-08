package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriOmbrellone {

   public double prezzo;
    public int posizione;
    public double prezzoLettini;
    public double prezzoSdraio;

    public ParametriOmbrellone(double prezzo, int posizione, double prezzoLettini, double prezzoSdraio) {
        this.prezzo = prezzo;
        this.posizione = posizione;
        this.prezzoLettini = prezzoLettini;
        this.prezzoSdraio = prezzoSdraio;
    }
}
