package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.Evento;
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
/*
    @PutMapping("/addNotifica/{id}")
    public boolean notificaUtente(@PathVariable("id)") String idUtente, @RequestBody Notifica nuovaNotifica) {
        return this.service.notificaUtente(idUtente,nuovaNotifica);

    }
    */


    @PutMapping("/iscrizione/{id1}/{id2}")
    public boolean iscrizioneEvento(@PathVariable("id1") String idUtente,@PathVariable("id2") String idEvento) {
        return this.service.iscrizioneEvento(idUtente,idEvento);
    }

    @GetMapping("/visualizza/{id}")
    public List<Evento> visualizzaEventiAderiti(@PathVariable("id") String idUtente) {
        return this.service.visualizzaEventiAderiti(idUtente);
    }
}
