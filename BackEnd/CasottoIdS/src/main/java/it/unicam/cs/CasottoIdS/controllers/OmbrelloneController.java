package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.ParametriModifica;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.services.OmbrelloneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ombrellone")
public class OmbrelloneController {

    @Autowired
    private OmbrelloneService service;

    // GET localhost:8080/ombrellone/all
    @GetMapping("/all")
    public List<Ombrellone> getAllOmbrelloni() {
        return this.service.getAll();
    }

    @GetMapping("/{id}")
    public Ombrellone getOmbrelloneById(@PathVariable("id") String idOmbrellone) {
        return this.service.getById(idOmbrellone);
    }

    // GET localhost:8080/ombrellone/disponibilita/{id}
    @GetMapping("/disponibilita/{id}")
    public List<SlotData> getDisponibilita(@PathVariable("id") String idOmbrellone) {
        return this.service.getDisponibilita(idOmbrellone);
    }

    // PUT localhost:8080/ombrellone/{id}
    @PutMapping("/{id}")
    public boolean addDisponibilita(@PathVariable("id") String idOmbrellone, @RequestBody List<SlotData> disponibilitaToAdd) {
        return this.service.addDisponibilita(idOmbrellone, disponibilitaToAdd);
    }

    // DELETE localhost:8080/ombrellone/{id}
    @DeleteMapping("/{id}")
    public boolean rimuoviDisponibilita(@PathVariable("id") String idOmbrellone, @RequestBody List<SlotData> dataPrenotazione) {
        return this.service.rimuoviDisponibilita(idOmbrellone, dataPrenotazione);
    }

    // POST localhost:8080/ombrellone/new
    @PostMapping("/new")
    public Ombrellone addOmbrellone(@RequestBody Ombrellone newOmbrellone) {
        return this.service.addOmbrellone(newOmbrellone);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteOmbrellone(@PathVariable("id") String idOmbrellone) {
        this.service.delOmbrellone(idOmbrellone);
    }

    @PutMapping("/modifica/{id}")
    public Ombrellone modificaOmbrellone(@PathVariable("id") String idOmbrellone, @RequestBody ParametriModifica p) {
        return this.service.modificaOmbrellone(idOmbrellone, p.prezzo,p.posizione, p.prezzoLettini, p.prezzoSdraio);
    }

}
