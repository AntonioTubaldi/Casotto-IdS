package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.ParametriProdotto;
import it.unicam.cs.CasottoIdS.models.ParametriPromozione;
import it.unicam.cs.CasottoIdS.models.Promozione;
import it.unicam.cs.CasottoIdS.services.PromozioneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/promozione")
public class PromozioneController {

    @Autowired
    private PromozioneService service;

    @GetMapping("/all")
    public List<Promozione> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/new")
    public boolean addPromozione(@RequestBody ParametriPromozione p) {
        return this.service.addPromozione(p.idProdotto, p.newPrezzo);
    }

    @PutMapping("/modifica/{id}/{newPrezzo}")
    public boolean modificaPromozione(@PathVariable("id") String idPromozione, @PathVariable double newPrezzo) {
        return this.service.modificaPromozione(idPromozione, newPrezzo);
    }

    @DeleteMapping("/delete/{id}")
    public boolean deletePromozione(@PathVariable("id") String idPromozione) {
        return this.service.deletePromozione(idPromozione);
    }



}
