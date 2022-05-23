package it.unicam.IdS.Casotto;


import java.util.Date;

public class DataDisponibilita  {

    private Date data;
   //comincio a pensare che l'enum non sia totalmente corretto per
    //richiamare delle date


    /**
     *
     * @return la data della prenotazione
     * */
    protected Date getData(){
        return data;
    }

    /**
     * @param data
     * imposta una data per la prenotazione
     * @return la data della prenotazione impostata
     * */
    protected void setData(Date data){
        this.data = data;
    }

    /**
     *
     * @return il giorno della prenotazione
     * */
   protected Date getGiorno(){
        return data;
    }



}
