package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;

/**
 * la classe ombrellone contiene tutti i dati sull'oggetto in questione
 * quali identificativo dell'ombrellone, prezzo, posizione nella spiaggia, disponibilità per la prenotazione.
 * @return tutti i dati di uno specifico ombrellone
 * */

public class Ombrellone {

    @Id
    public String idOmbrellone;
    private double prezzo;
    private int posizione;
    private List<SlotData> disponibilita;
    private double prezzoLettini;
    private double prezzoSdraio;

    public Ombrellone(double prezzo, int posizione, List<SlotData> disponibilita, double prezzoLettini,double prezzoSdraio) {
        this.prezzo = prezzo;
        this.posizione = posizione;
        this.disponibilita = disponibilita;
        this.prezzoLettini = prezzoLettini;
        this.prezzoSdraio = prezzoSdraio;

    }
    /**
     * ritorna la posizione
     * nella spieaggia dell'ombrellone
     * @return posizione dell'ombrellone
     * */
    public int getPosizione() {
        return posizione;
    }
    /**
     * @param posizione
     * imposta la posizione dell'ombrellone
     *
     * */
    public void setPosizione(int posizione) {
        this.posizione = posizione;
    }
    /**
     * recupera il prezzo di un dato ombrellone
     * @return il prezzo dell'ombrellone
     * */
    public double getPrezzo() {
        return prezzo;
    }
    /**
     * @param prezzo
     * imposta il prezzo dell'ombrellone
     *
     * */
    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }
    /**
     * visualizza la disponibilità di un ombrellone per la prenotaazione
     * @return disponibilità di un ombrellone
     * */
    public List<SlotData> getDisponibilita() {
        return disponibilita;
    }
    /**
     * @param disponibilita
     * imposta la disponibilità di un ombrellone per la prenotazione
     * */
    public void setDisponibilita(List<SlotData> disponibilita) {
        this.disponibilita = disponibilita;
    }

    public void addDisponibilita(List<SlotData> disponibilitaToAdd) {
        disponibilita.addAll(disponibilitaToAdd);
    }

    /**
     * recupera l'id dell'ombrellone selezionato
     * @return l'id dell'ombrellone
     * */
    public String getIdOmbrellone() {
        return idOmbrellone;
    }

    public void setIdOmbrellone(String idOmbrellone) {
        this.idOmbrellone = idOmbrellone;
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

    /**
     * @param daRimuovere
     * rimuove la disponibilità per l'ombrellone selezionato
     * @return true o false se la disponibiltà è stata rimossa.
     * */
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
                ", prezzo lettini: " + prezzoLettini +
                ", prezzo sdraio: " + prezzoSdraio +
                '}';
    }
}
