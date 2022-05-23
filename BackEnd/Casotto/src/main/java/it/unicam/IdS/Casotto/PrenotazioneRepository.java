package it.unicam.IdS.Casotto;

import java.util.List;

public class PrenotazioneRepository {

    private int idUtente;

    protected List<DataDisponibilita> date;
    private int idOmbrellone;


    /**
     * ritorna la lista delle date disponibili dal database
     * @return le date disponibili per l'ombrellone dal database
     * */
    protected List<DataDisponibilita> getPrenotazione(){
        return date;
    }

    /**
     * @param idOmbrellone
     * @param idUtente
     * imposta una prenotazione dato l'id dell'ombrellone
     * e l'id dell'utente
     *
     * */
    protected void setPrenotazione(int idOmbrellone, int idUtente){
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
    }

    /**
     * @param idOmbrellone
     * @param idUtente
     * cancella una prenotazione, dato un id dell'ombrellone
     * e un id utente
     *
     * */
    protected void deletePrenotazione(int idOmbrellone, int idUtente){

    }

    /**
     * @param idOmbrellone
     * @param idUtente
     * conferma una prenotazione per un dato ombrellone e id utente
     *
     * */
    protected void confermaPrenotazione(int idOmbrellone, int idUtente){
    }

}
