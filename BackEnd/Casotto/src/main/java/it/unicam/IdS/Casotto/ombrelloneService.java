package it.unicam.IdS.Casotto;

import java.util.List;

public class ombrelloneService implements Ombrellone {

    List<Ombrellone> ombrellone;

    /**
     * permette di ritornare la lista degli ombrelloni
     * presenti nella spiaggia
     *
     * @return la lista degli ombrelloni presenti nella spiaggio
     * */
    protected List<Ombrellone> getAll(){
        return ombrellone;
    }


    @Override
    public int getPrezzo() {
        return 0;
    }

    @Override
    public int setPrezzo(int prezzo) {
        return 0;
    }

    @Override
    public int getPosizione() {
        return 0;
    }

    @Override
    public int setPosizione(int posizione) {
        return 0;
    }

    @Override
    public int getIdPosizione() {
        return 0;
    }

    @Override
    public int setIdOmbrellone(int idOmbrellone) {
        return 0;
    }
}