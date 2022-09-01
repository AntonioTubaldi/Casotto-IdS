package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.services.StrutturaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/struttura")
public class StrutturaController {

    @Autowired
    private StrutturaService service;

    @GetMapping("/all")
    public List<Struttura> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/new")
    public boolean addStruttura(@RequestBody ParametriStruttura p) {
        return this.service.addStruttura(p.nome, p.stato);
    }

    @PutMapping("/modifica/{id}")
    public boolean modificaStruttura(@PathVariable("id") String idStruttura, @RequestBody ParametriStruttura s) {
        return this.service.modificaStruttura(idStruttura, s.nome, s.stato);
    }

    @DeleteMapping("/delete/{id}")
    public boolean deleteStruttura(@PathVariable("id") String idStruttura) {
        return this.service.deleteStruttura(idStruttura);
    }
}
