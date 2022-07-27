package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Utente;
import it.unicam.cs.CasottoIdS.repositories.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UtenteService {

    @Autowired
    private UtenteRepository repository;

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
}
