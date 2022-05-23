package it.unicam.IdS.Casotto;

import java.util.List;

public class ombrelloneService  {

    private List<DataDisponibilita> disponibilita;
    private List<Ombrellone> ombrellone;
    private int prezzo;


    /**
     * permette di ritornare la lista degli ombrelloni
     * presenti nella spiaggia
     *
     * @return la lista degli ombrelloni presenti nella spiaggio
     * */
    protected List<Ombrellone> getAll(){
        return ombrellone;
    }

    /**
     * recupera dalla lista le date disponibili per prenotare
     * l'ombrellone
     * @return le date disponibili per la prenotazione
     * */
    protected List<DataDisponibilita> getDisponibilita(){

        return disponibilita;
    }

    /**
     * @param idOmbrellone
     * imposta la disponibiltà per la prenotazione dell'ombrellone
     * in base al suo id
     *
     * */
    protected void setDisponibilita(int idOmbrellone){
    }


    protected int getPrezzo(){
        return prezzo;
    }

    protected void setPrezzo(int prezzo){
        this.prezzo = prezzo;
    }


}