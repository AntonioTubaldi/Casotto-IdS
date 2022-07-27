package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriPrenotazione {

    public String idUtente;
    public String idOmbrellone;
    public List<SlotData> dataPrenotazione;

    public ParametriPrenotazione(String idUtente, String idOmbrellone, List<SlotData> dataPrenotazione) {
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
        this.dataPrenotazione = dataPrenotazione;
    }
}
