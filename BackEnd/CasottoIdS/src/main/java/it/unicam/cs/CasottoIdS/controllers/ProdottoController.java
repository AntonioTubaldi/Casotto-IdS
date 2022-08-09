package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.services.ProdottoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/prodotto")
public class ProdottoController {

    @Autowired
    private ProdottoService service;

    @GetMapping("/all")
    public List<Prodotto> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/new")
    public boolean addProdotto(@RequestBody ParametriProdotto p) {
        return this.service.addProdotto(p.nome, p.prezzo);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteProdotto(@PathVariable("id") String nome) {
        this.service.deleteProdotto(nome);
    }

    @PutMapping("/modifica/{id}")
    public boolean modificaProdotto(@PathVariable("id") String nome, @RequestBody ParametriProdotto p) {
        return this.service.modificaProdotto(nome, p.prezzo);
    }

}
