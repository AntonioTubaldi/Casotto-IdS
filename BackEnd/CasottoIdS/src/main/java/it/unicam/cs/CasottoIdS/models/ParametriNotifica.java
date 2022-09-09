package it.unicam.cs.CasottoIdS.models;

public class ParametriNotifica {
    public String titolo;
    public String descrizione;

    public ParametriNotifica(String titolo, String descrizione) {
        this.titolo=titolo;
        this.descrizione=descrizione;
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
}
