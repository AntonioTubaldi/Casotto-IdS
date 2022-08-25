package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.Attrezzatura;
import it.unicam.cs.CasottoIdS.models.ParametriAttrezzatura;
import it.unicam.cs.CasottoIdS.models.ParametriOmbrellone;
import it.unicam.cs.CasottoIdS.services.AttrezzaturaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/attrezzatura")
public class AttrezzaturaController {

    @Autowired
    private AttrezzaturaService service;

    @GetMapping("/all")
    public List<Attrezzatura> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/new")
    public boolean addAttrezzatura(@RequestBody ParametriAttrezzatura p) {
        return this.service.addAttrezzatura(p.nome, p.quantita);
    }

    @PutMapping("/modifica/{id}")
    public boolean modificaAttrezzatura(@PathVariable("id") String nome, @RequestBody ParametriAttrezzatura p) {
        return this.service.modificaAttrezzatura(nome, p.quantita);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteAttrezzatura(@PathVariable("id") String nome) {
        this.service.deleteAttrezzatura(nome);
    }


}
