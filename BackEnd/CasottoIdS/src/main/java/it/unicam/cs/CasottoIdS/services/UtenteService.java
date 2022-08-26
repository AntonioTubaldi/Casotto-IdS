package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Evento;
import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Utente;
import it.unicam.cs.CasottoIdS.repositories.EventoRepository;
import it.unicam.cs.CasottoIdS.repositories.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UtenteService {

    @Autowired
    private UtenteRepository repository;

    @Autowired
    private EventoRepository eventoRepository;

    public List<Utente> getAll() {
        return this.repository.findAll();
    }

    /**
     * @param idUtente
     * @param nuovaNotifica
     *
     * permette di notificare un determinato utente dato il suo id, se presente nel database
     *
     * @return true se l'utente è stato notificato
     * @return false se l'utente non ha ricevuto la notifica
     * */
    public boolean notificaUtente(String idUtente, Notifica nuovaNotifica) {
        Optional<Utente> utenteFromMongo = this.repository.findById(idUtente);
        if(utenteFromMongo.isPresent()) {
            Utente utenteDaNotificare = utenteFromMongo.get();
            utenteDaNotificare.addNotificaById(nuovaNotifica);
            this.repository.save(utenteDaNotificare);
            return true;
        } else
            return false;

    }

    public boolean iscrizioneEvento(String idUtente, String idEvento) {
        boolean esito = false;
        Optional<Utente> utenteFromMongo = this.repository.findById(idUtente);
        if(utenteFromMongo.isPresent()) {
            Utente utenteDaAggiungere = utenteFromMongo.get();
            Optional<Evento> eventoFromMongo = this.eventoRepository.findById(idEvento);
            if (eventoFromMongo.isPresent()) {
                Evento eventoToUpdate = eventoFromMongo.get();
                if(eventoToUpdate.getNumeroPartecipanti() < eventoToUpdate.getNumeroMaxPartecipanti() && !utenteDaAggiungere.getEventiAderiti().contains(eventoToUpdate)) {
                    eventoToUpdate.setNumeroPartecipanti(eventoToUpdate.getNumeroPartecipanti()+1);
                    this.eventoRepository.save(eventoToUpdate);
                    utenteDaAggiungere.addEventoById(eventoToUpdate);
                    Notifica notifica = new Notifica("Iscrizione Confermata", "Ti sei iscritto a: " + eventoToUpdate.getNome());
                    utenteDaAggiungere.addNotificaById(notifica);
                    this.repository.save(utenteDaAggiungere);
                    esito = true;
                }


            }

           return esito;
        } else
            return false;
    }

    public List<Evento> visualizzaEventiAderiti(String idUtente) {
        Optional<Utente> utenteFromMongo = this.repository.findById(idUtente);
        if(utenteFromMongo.isPresent()) {
            Utente singleUtente = utenteFromMongo.get();
            return singleUtente.getEventiAderiti();
        }
        else return null;
    }
}
