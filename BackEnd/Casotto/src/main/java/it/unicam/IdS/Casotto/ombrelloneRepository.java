package it.unicam.IdS.Casotto;

import java.util.List;

public class ombrelloneRepository {


    private List<Ombrellone> ombrellone;
    private List<DataDisponibilita> disponibilita;
    private int idOmbrellone;

    /**
     *
     * permette di ritornare la lista degli ombrelloni
     * dal database
     *
     * @return la lista degli ombrelloni dal database
     * */
    protected List<Ombrellone> findAll(){
        return ombrellone;
    }

    /**
     * effettua una ricerca dell'ombrellone tramite id
     *
     * @return l'id dell'ombrellone selezionato
     * */
    protected int findById(int idOmbrellone){
        return 0;
    }

    /**
     * @param idOmbrellone
     * recupera la lista delle date disponibili per la prenotazione
     * dell'ombrellone
     *
     * @return le date disponibili per la prenotazione
     * */
    protected List<DataDisponibilita> getDisponibilita(int idOmbrellone){
        return disponibilita;
    }

    /**
     * @param idOmbrellone
     * imposta una data di disponibilità per un dato ombrellone
     * */
    protected void setDisponibilita(int idOmbrellone){
        this.idOmbrellone = idOmbrellone;
    }

    /**
     *
     * recupera il prezzo di un dato ombrellone
     * @return il prezzo dell'ombrellone selezionato
     * */
    public int getPrezzo(){
    return idOmbrellone;
    }
    /**
     * @param idOmbrellone
     * imposta un prezzo per un dato ombrellone
     * @return il prezzo dell'ombrellone selezionato
     * */
    public int setPrezzo(int idOmbrellone){
        return 0;
    }



}
