package it.unicam.IdS.Casotto;

import java.util.List;

public class ombrelloneRepository {


    List<Ombrellone> ombrellone;

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


}
