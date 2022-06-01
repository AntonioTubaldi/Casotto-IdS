package it.unicam.cs.CasottoIdS.models;

import java.util.Date;
import java.util.Objects;

public class SlotData {

    private Giorno durata;
    private Date data;

    public SlotData(Giorno durata, Date data) {
        this.durata = durata;
        this.data = data;
    }

    public Giorno getDurata() {
        return durata;
    }

    public void setDurata(Giorno durata) {
        this.durata = durata;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
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
