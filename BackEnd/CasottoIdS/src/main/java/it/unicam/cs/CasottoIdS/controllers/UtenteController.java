package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.services.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/utente")
public class UtenteController {

    @Autowired
    private UtenteService service;
/*
    @PutMapping("/addNotifica/{id}")
    public boolean notificaUtente(@PathVariable("id)") String idUtente, @RequestBody Notifica nuovaNotifica) {
        return this.service.notificaUtente(idUtente,nuovaNotifica);

    }
    */

}
