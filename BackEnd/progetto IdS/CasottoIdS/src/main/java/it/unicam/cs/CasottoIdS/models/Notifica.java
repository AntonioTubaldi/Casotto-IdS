package it.unicam.cs.CasottoIdS.models;

import java.util.Objects;

public class Notifica {
    String titolo;
    String descrizione;

    public Notifica(String titolo, String descrizione) {
        this.titolo = titolo;
        this.descrizione = descrizione;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Notifica notifica = (Notifica) o;
        return Objects.equals(titolo, notifica.titolo) && Objects.equals(descrizione, notifica.descrizione);
    }

 }
