package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

import java.util.List;
import java.util.Objects;

public class Utente {

    @Id
    public String idUtente;
    private String nome;
    private String cognome;
    private List<Notifica> notifiche;
    private Ruolo ruolo;

    public void addNotificaById(String idUtente, Notifica nuovaNotifica) {
        notifiche.add(nuovaNotifica);

    }

    public Utente(String nome, String cognome, List<Notifica> notifiche, Ruolo ruolo) {
        this.nome = nome;
        this.cognome = cognome;
        this.notifiche = notifiche;
        this.ruolo = ruolo;
    }

    /**
     * recupera l'identificativo dell'utente
     * @return l'identificativo dell'utente
     * */
    public String getIdUtente() {
        return idUtente;
    }

    /**
     * recupera il nome di un determinato di un utente
     * @return il nome dell'utente
     * */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome
     * imposta il nome per un utente
     * */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * recupera il cognome di un utente
     * @return il cognome dell'utente
     * */
    public String getCognome() {
        return cognome;
    }

    /**
     * @param cognome
     * imposta il cognome per un utente
     * */
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    /**
     * recupera le notifiche da una lista
     * @return la lista delle notifiche
     * */
    public List<Notifica> getNotifiche() {
        return notifiche;
    }
    /**
     * @param notifiche
     * permette di impostare una lista di notifiche da inviare
     * */
    public void setNotifiche(List<Notifica> notifiche) {
        this.notifiche = notifiche;
    }

    /**
     * recupera le info sul ruolo di un utente all'interno del sito
     * @return il ruolo dell'utente
     * */
    public Ruolo getRuolo() {
        return ruolo;
    }

    /**
     * @param ruolo
     * imposta un ruolo per un determinato utente all'interno del sito
     * */
    public void setRuolo(Ruolo ruolo) {
        this.ruolo = ruolo;
    }

    @Override
    public String toString() {
        return "Utente{" +
                "idUtente='" + idUtente + '\'' +
                ", nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", notifiche=" + notifiche +
                ", ruolo=" + ruolo +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Utente utente = (Utente) o;
        return Objects.equals(idUtente, utente.idUtente) && Objects.equals(nome, utente.nome) && Objects.equals(cognome, utente.cognome) && Objects.equals(notifiche, utente.notifiche) && ruolo == utente.ruolo;
    }

}
