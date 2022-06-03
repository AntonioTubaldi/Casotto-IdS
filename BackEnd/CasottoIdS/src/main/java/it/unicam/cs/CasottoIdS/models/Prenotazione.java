package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;

import static it.unicam.cs.CasottoIdS.models.StatoPrenotazione.APERTA;

public class Prenotazione {

    @Id
    public String idPrenotazione;
    private String idUtente;
    private String idOmbrellone;
    private double costoTotale;
    private List<SlotData> dataPrenotazione;
    private StatoPrenotazione statoPrenotazione;

    public Prenotazione(String idUtente, String idOmbrellone, double costoTotale, List<SlotData> dataPrenotazione) {
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
        this.costoTotale = costoTotale;
        this.dataPrenotazione = dataPrenotazione;
       this.statoPrenotazione = APERTA;
    }

    /**
     * recupera l'id della prenotazione selezionata
     * @return id della prenotazione
     * */
    public String getIdPrenotazione() {
        return idPrenotazione;
    }


    /**
     * recupera l'id di un utente
     * @return id dell'utente
     * */
    public String getIdUtente() {
        return idUtente;
    }

    /**
     * @param idUtente
     * imposta l'id per un utente
     * */
    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    /**
     * recupera l'id di un ombrellone
     * @return id dell'ombrellone
     * */
    public String getIdOmbrellone() {
        return idOmbrellone;
    }
    /**
     * @param idOmbrellone
     * imposta un identificativo per l'ombrellone
     * */
    public void setIdOmbrellone(String idOmbrellone) {
        this.idOmbrellone = idOmbrellone;
    }
    /**
     * recupera il costo totale della prenotazione dell'ombrellone
     * @return il costo totale della prenotazione
     * */
    public double getCostoTotale() {
        return costoTotale;
    }
    /**
     * @param costoTotale
     * imposta il costo totale della prenotazione dell'ombrellone
     * */
    public void setCostoTotale(double costoTotale) {
        this.costoTotale = costoTotale;
    }

    /**
     * recupera la data di una prenotazione
     * @return la data della prenotazione
     * */
    public List<SlotData> getDataPrenotazione() {
        return dataPrenotazione;
    }

    /**
     * @param dataPrenotazione
     * imposta la data per la prenotazione in corso
     * */
    public void setDataPrenotazione(List<SlotData> dataPrenotazione) {
        this.dataPrenotazione = dataPrenotazione;
    }

    /**
     * recupera lo stato della prenotazione
     * @return lo stato della prenotazione
     * */
    public StatoPrenotazione getStatoPrenotazione() {
        return statoPrenotazione;
    }

    /**
     * @param statoPrenotazione
     * imposta uno stato per la prenotazione
     * */
    public void setStatoPrenotazione(StatoPrenotazione statoPrenotazione) {
        this.statoPrenotazione = statoPrenotazione;
    }
}
