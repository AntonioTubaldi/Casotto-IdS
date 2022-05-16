package it.unicam.IdS.Casotto;

public interface Ombrellone {

    /**
     * @return  il valore del costo dell'ombrellone
     * */
    int getPrezzo();

    /**
     * imposta il prezzzo dell'ombrellone
     * @return  il valore del prezzo dell'ombrellone
     * */
    int setPrezzo(int prezzo);

    /**
     * @return la posizione dell'ombrellone nella spiaggia
     * */
    int getPosizione();

    /**
     * imposta la posizione dell'ombrellone nella spiaggia
     * @return la posizione dell'ombrellone
     * */
    int setPosizione(int posizione);

    /**
     * @return il numero dell'ombrellone nella spiaggia
     * */
    int getIdPosizione();

    /**
     * imposta l'identificativo dell'ombrellone
     * @return l'identificativo dell'ombrellone nella spiaggia
     * */
    int setIdOmbrellone(int idOmbrellone);



}
