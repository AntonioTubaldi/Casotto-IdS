package it.unicam.cs.CasottoIdS.models;

import java.util.List;

public class ParametriPrenotazione {

    public String idUtente;
    public String idOmbrellone;
    public List<SlotData> dataPrenotazione;
    public int numeroLettini;
    public int numeroSdraio;

    public ParametriPrenotazione(String idUtente, String idOmbrellone, List<SlotData> dataPrenotazione, int numeroLettini, int numeroSdraio) {
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
        this.dataPrenotazione = dataPrenotazione;
        this.numeroLettini = numeroLettini;
        this. numeroSdraio = numeroSdraio;
    }
}
