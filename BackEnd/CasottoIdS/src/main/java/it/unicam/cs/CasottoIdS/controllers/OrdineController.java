package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.Ordine;
import it.unicam.cs.CasottoIdS.models.ParametriOrdine;
import it.unicam.cs.CasottoIdS.models.StatoOrdine;
import it.unicam.cs.CasottoIdS.services.OrdineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ordine")
public class OrdineController {

    @Autowired
    private OrdineService service;

    @GetMapping("/all")
    public List<Ordine> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/new")
    public boolean addOrdine(@RequestBody ParametriOrdine p) {
        return this.service.addOrdine(p.idUtente, p.costoTotale, p.prodotti);
    }
}
