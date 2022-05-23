package it.unicam.IdS.Casotto;

import java.util.List;

public class Prenotazione  {
    private String statoPrenotazione = "";
    private int idOmbrellone;
    private int idUtente;
    protected List<DataPrenotazione> date;
    private String disponibilita = "";

    /**
     * recupera gli id dell'ombrellone
     * @return gli id degli ombrelloni
     * */
    public int getIdOmbrellone(){

        return idOmbrellone;
    }

    /**
     * @param idOmbrellone
     * imposta un id per un dato ombrellone
     * @return l'id dell'ombrellone impostato
     * */
    public void setIdOmbrellone(int idOmbrellone){
        this.idOmbrellone = idOmbrellone;
    }

    /**
     * ritorna gli id degli utenti
     * @return gli id degli utenti
     * */
    public int getIdUtente(){

        return idUtente;
    }

    /**
     * @param idUtente
     * imposta un id per un utente
     * @return l'id dell'utente impostato
     * */
     public void setIdUtente(int idUtente){
        this.idUtente = idUtente;
     }

     /**
      *
      * ritorna la data della prenotazione
      * @return la data della prenotazione
      * */
     public List<DataPrenotazione> getDataPrenotazione(){
        return date;
     }

     /**
      * ritorna lo stato della prenotazione
      * @return la disponibilità dell'ombrellone sotto forma di stringa
      * */
     public String getStatoPrenotazione(){
        return disponibilita;
     }

     /**
      * @param statoPrenotazione
      * imposta uno stato per la prenotazione in corso
      * @return lo stato della prenotazione
      *
      * */
     public void setStatoPrenotazione(String statoPrenotazione){
         this.statoPrenotazione = statoPrenotazione;
     }



}
