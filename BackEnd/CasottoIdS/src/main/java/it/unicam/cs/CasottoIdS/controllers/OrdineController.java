package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.Ordine;
import it.unicam.cs.CasottoIdS.models.ParametriOrdine;
import it.unicam.cs.CasottoIdS.models.StatoOrdine;
import it.unicam.cs.CasottoIdS.services.OrdineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ordine")
public class OrdineController {

    @Autowired
    private OrdineService service;

    @PostMapping("/new")
    public Ordine addOrdine(@RequestBody ParametriOrdine p) {
        return this.service.addOrdine(p.idUtente, p.costoTotale, p.prodotti);
    }
}
