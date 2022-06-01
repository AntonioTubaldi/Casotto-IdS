package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;

import static it.unicam.cs.CasottoIdS.models.StatoPrenotazione.APERTA;

public class Prenotazione {

    @Id
    public String idPrenotazione;
    private String idUtente;
    private String idOmbrellone;
    private double costoTotale;
    private List<SlotData> dataPrenotazione;
    private StatoPrenotazione statoPrenotazione;

    public Prenotazione() {
        this.idUtente = idUtente;
        this.idOmbrellone = idOmbrellone;
        this.costoTotale = costoTotale;
        this.dataPrenotazione = dataPrenotazione;
        this.statoPrenotazione = APERTA;
    }


    public String getIdPrenotazione() {
        return idPrenotazione;
    }

    public void setIdPrenotazione(String idPrenotazione) {
        this.idPrenotazione = idPrenotazione;
    }

    public String getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(String idUtente) {
        this.idUtente = idUtente;
    }

    public String getIdOmbrellone() {
        return idOmbrellone;
    }

    public void setIdOmbrellone(String idOmbrellone) {
        this.idOmbrellone = idOmbrellone;
    }

    public double getCostoTotale() {
        return costoTotale;
    }

    public void setCostoTotale(double costoTotale) {
        this.costoTotale = costoTotale;
    }

    public List<SlotData> getDataPrenotazione() {
        return dataPrenotazione;
    }

    public void setDataPrenotazione(List<SlotData> dataPrenotazione) {
        this.dataPrenotazione = dataPrenotazione;
    }

    public StatoPrenotazione getStatoPrenotazione() {
        return statoPrenotazione;
    }

    public void setStatoPrenotazione(StatoPrenotazione statoPrenotazione) {
        this.statoPrenotazione = statoPrenotazione;
    }
}
