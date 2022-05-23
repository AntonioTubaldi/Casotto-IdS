package it.unicam.IdS.Casotto;

import java.util.List;

public class PrenotazioneService {


    protected List<DataPrenotazione> data;
    private int idOmbrellone;
    private int idUtente;

    /**
     * @param idOmbrellone
     * @param idUtente
     * recupera la lista delle date prontabili dato un id ombrellone
     * e un id utente
     * @return le date disponibili per la prenotazione
     * */
    protected List<DataPrenotazione> getPrenotazione(int idOmbrellone, int idUtente){
        return data;
    }

    /**
     * @param idOMbrellone
     * @param idUtente
     *
     * imposta una data per la prenotazione dato un id ombrellone
     * e id utente
     * */
    protected void setPrenotazione(int idOMbrellone, int idUtente){
        this.idOmbrellone = idOMbrellone;
        this.idUtente = idUtente;
    }

    /**
     * cancella una prenotazione dato un id ombrellone e id utente
     */
    protected void deletePrenotazione(int idOmbrellone, int idUtente){

    }

    /**
     * conferma la prenotazione dell'ombrellone dato un id ombrellone e id utente
     * */
    protected void confermaPrenotazione(int idOmbrellone, int idutente){

    }


}
