package it.unicam.cs.CasottoIdS.models;

import java.util.Objects;

public class Notifica {
    String titolo;
    String descrizione;

    public Notifica(String titolo, String descrizione) {
        this.titolo = titolo;
        this.descrizione = descrizione;
    }
    /**
     * recupera il titolo della notifica
     * @return il titolo della notifica
     * */
    public String getTitolo() {
        return titolo;
    }

    /**
     * @param titolo
     * imposta un titolo per la notifica da inviare
     *
     * */
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    /**
     * recupera la descrizione della notifica
     * @return la descrizione della notifica
     * */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * @param descrizione
     * imposta una descrizione per la notifica da inviare
     * */
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
