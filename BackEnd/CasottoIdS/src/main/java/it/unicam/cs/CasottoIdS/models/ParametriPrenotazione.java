package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriPrenotazione {

    public String idUtente;
    public String idOmbrellone;
    public double costoTotale;
    public List<SlotData> dataPrenotazione;

    public ParametriPrenotazione(String idUtente, String idOmbrellone, double costoTotale, List<SlotData> dataPrenotazione) {
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
        this.costoTotale = costoTotale;
        this.dataPrenotazione = dataPrenotazione;
    }
}
