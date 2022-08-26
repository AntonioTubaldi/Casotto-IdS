package it.unicam.cs.CasottoIdS.services;


import it.unicam.cs.CasottoIdS.models.Evento;
import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Utente;
import it.unicam.cs.CasottoIdS.repositories.EventoRepository;
import it.unicam.cs.CasottoIdS.repositories.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;


@Service
public class EventoService {

    @Autowired
    private EventoRepository repository;

     @Autowired
    private UtenteRepository utenteRepository;


    public List<Evento> getAll() {
        return this.repository.findAll();
    }

    public List<Evento> getEventoByData(LocalDate data) {
        List<Evento> daRitornare = this.repository.findAllByData(data);
        return daRitornare;
    }

    public boolean addEvento(String nome, LocalDate data, LocalTime orarioInizio, int numeroMaxPartecipanti) {
        boolean esito;
        Evento newEvento = new Evento(nome,data,orarioInizio,numeroMaxPartecipanti);
        this.repository.save(newEvento);
        Optional<Evento> eventoFromMongo = this.repository.findById(newEvento.getIdEvento());
        if(eventoFromMongo.isPresent()) {
            esito = true;
        } else esito = false;

        return esito;
    }

    public boolean modificaEvento(String idEvento, String newNome, LocalDate newData, LocalTime newOrarioInizio, int newNumeroMaxPartecipanti) {
        Optional<Evento> eventoFromMongo = this.repository.findById(idEvento);
        boolean esito;
        if(eventoFromMongo.isPresent()) {
            Evento daModificare = eventoFromMongo.get();
            daModificare.setNome(newNome);
            daModificare.setData(newData);
            daModificare.setOrarioInizio(newOrarioInizio);
            daModificare.setNumeroPartecipanti(newNumeroMaxPartecipanti);
            this.repository.save(daModificare);
            esito = true;
        }
        else esito = false;
        return esito;

    }

    public boolean eliminaEvento(String idEvento) {
        boolean esito;
        Optional<Evento> eventoFromMongo = this.repository.findById(idEvento);
        if(eventoFromMongo.isPresent()) {
            Evento eventoDaEliminare = eventoFromMongo.get();
            List<Utente> lista = utenteRepository.findAll();
            for (Utente singleUtente: lista) {
                if(singleUtente.getEventiAderiti().contains(eventoDaEliminare)) {
                    Notifica newNotifica = new Notifica("Evento eliminato", "L'evento al quale ti eri iscritto è stato eliminato");
                    singleUtente.addNotificaById(newNotifica);
                    singleUtente.getEventiAderiti().remove(eventoDaEliminare);
                    utenteRepository.save(singleUtente);
                }
            }
            this.repository.deleteById(idEvento);
            esito = true;
        } else esito = false;

        return esito;
    }



}
