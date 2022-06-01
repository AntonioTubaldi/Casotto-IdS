package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;

public class Ombrellone {

    @Id
    public String idOmbrellone;
    private double prezzo;
    private int posizione;
    private List<SlotData> disponibilita;

    public Ombrellone(double prezzo, int posizione, List<SlotData> disponibilita) {
        this.prezzo = prezzo;
        this.posizione = posizione;
        this.disponibilita = disponibilita;
    }

    public int getPosizione() {
        return posizione;
    }

    public void setPosizione(int posizione) {
        this.posizione = posizione;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public List<SlotData> getDisponibilita() {
        return disponibilita;
    }

    public void setDisponibilita(List<SlotData> disponibilita) {
        this.disponibilita = disponibilita;
    }

    public String getIdOmbrellone() {
        return idOmbrellone;
    }

    public boolean rimuoviDisponibilita(List<SlotData> daRimuovere) {
        return this.disponibilita.removeAll(daRimuovere);


    }

    @Override
    public String toString() {
        return "Ombrellone{" +
                "idOmbrellone='" + idOmbrellone + '\'' +
                ", prezzo=" + prezzo +
                ", posizione=" + posizione +
                ", disponibilita=" + disponibilita +
                '}';
    }
}
