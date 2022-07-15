package it.unicam.cs.CasottoIdS.models;

import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;

public class SlotData {

    private Giorno durata;
    private LocalDate data;

    public SlotData(Giorno durata, LocalDate data) {
        this.durata = durata;
        this.data = data;
    }

    /**
     * recupera le informazioni della durata della prenotazione dell'ombrellone
     * @return la durata della prenotazione
     * */
    public Giorno getDurata() {
        return durata;
    }

    /**
     * @param durata
     * imposta una durata per la prenotazione dell'ombrellone
     * */
    public void setDurata(Giorno durata) {
        this.durata = durata;
    }


    /**
     * recupera la data della prenotazione di un dato ombrellone
     * @return la data della prenotazione dell'ombrellone
     * */
    public LocalDate getData() {
        return data;
    }

    /**
     * @param data
     * imposta una data per la prenotazione dell'ombrellone
     * */
    public void setData(LocalDate data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "SlotData{" +
                "durata=" + durata +
                ", data=" + data +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SlotData slotData = (SlotData) o;
        return durata == slotData.durata && data.equals(slotData.data);
    }

    }
