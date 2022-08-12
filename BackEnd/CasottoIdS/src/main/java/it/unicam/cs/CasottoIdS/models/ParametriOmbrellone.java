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

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public int getPosizione() {
        return posizione;
    }

    public void setPosizione(int posizione) {
        this.posizione = posizione;
    }

    public double getPrezzoLettini() {
        return prezzoLettini;
    }

    public void setPrezzoLettini(double prezzoLettini) {
        this.prezzoLettini = prezzoLettini;
    }

    public double getPrezzoSdraio() {
        return prezzoSdraio;
    }

    public void setPrezzoSdraio(double prezzoSdraio) {
        this.prezzoSdraio = prezzoSdraio;
    }
}
