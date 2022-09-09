package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.Evento;
import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.ParametriNotifica;
import it.unicam.cs.CasottoIdS.models.Utente;
import it.unicam.cs.CasottoIdS.services.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/utente")
public class UtenteController {

    @Autowired
    private UtenteService service;

    @GetMapping("/all")
    public List<Utente> getAll() {
        return this.service.getAll();
    }


    @PutMapping("/iscrizione/{id1}/{id2}")
    public boolean iscrizioneEvento(@PathVariable("id1") String idUtente,@PathVariable("id2") String idEvento) {
        return this.service.iscrizioneEvento(idUtente,idEvento);
    }

    @GetMapping("/visualizza/{id}")
    public List<Evento> visualizzaEventiAderiti(@PathVariable("id") String idUtente) {
        return this.service.visualizzaEventiAderiti(idUtente);
    }

    @GetMapping("messaggi/{id}")
    public List<Notifica> visualizzaMessaggi(@PathVariable("id") String idUtente) {
        return this.service.visualizzaMessaggi(idUtente);
    }

    @PutMapping("/notifica/{id}")
    public boolean inviaMessaggio(@PathVariable("id") String idUtente, @RequestBody ParametriNotifica p) {
        return this.service.inviaMessaggio(idUtente,p.titolo,p.descrizione);
    }
}

