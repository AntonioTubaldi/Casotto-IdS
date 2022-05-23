package it.unicam.IdS.Casotto;

import java.util.Date;

public class DataPrenotazione {


    Date data;

    /**
     *
     * recupera la data del giorno della prenotazione
     *
     * */
    protected Date getGiorno(){
        return data;
    }

    /**
     * imposta una data per la prenotazione
     *
     * */
    protected void setData(Date data){
        this.data = data;
    }


}
