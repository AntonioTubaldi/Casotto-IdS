package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.*;
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

    @PostMapping("/new")
    public boolean createUtente(@RequestBody ParametriUtente p) {
        return this.service.createUtente(p.idUtente,p.nome,p.cognome,p.ruolo);

    }

    @GetMapping("/{id}")
    public Ruolo getRuolo(@PathVariable("id") String idUtente) {
        return this.service.getRuolo(idUtente);
    }


    @PutMapping("/set/{id}")
    public void setRuolo(@PathVariable("id") String idUtente) {
        this.service.setRuolo(idUtente);
    }

    @GetMapping("/get/{id}")
    public Utente getUtenteById(@PathVariable("id") String idUtente) {
        return this.service.getUtenteById(idUtente);
    }
}

