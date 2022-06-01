package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Utente;
import it.unicam.cs.CasottoIdS.repositories.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class UtenteService {

    @Autowired
    private UtenteRepository repository;

    public boolean notificaUtente(String idUtente, Notifica nuovaNotifica) {
        boolean utenteNotificato;
        Optional<Utente> utenteFromMongo = this.repository.findById(idUtente);
        if(utenteFromMongo.isPresent()) {
            Utente utenteDaNotificare = utenteFromMongo.get();
            utenteDaNotificare.addNotificaById(idUtente,nuovaNotifica);
            this.repository.save(utenteDaNotificare);
            return utenteNotificato = true;
        } else
            return false;

    }
}
