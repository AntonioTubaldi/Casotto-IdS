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

    public String getIdUtente() {
        return idUtente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public List<Notifica> getNotifiche() {
        return notifiche;
    }

    public void setNotifiche(List<Notifica> notifiche) {
        this.notifiche = notifiche;
    }

    public Ruolo getRuolo() {
        return ruolo;
    }

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
