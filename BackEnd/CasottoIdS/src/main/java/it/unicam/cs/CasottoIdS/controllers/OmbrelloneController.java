package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
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

    // GET localhost:8080/ombrellone/disponibilita
    @GetMapping("/disponibilita")
    public List<SlotData> getDisponibilita(String idOmbrellone) {
        return this.service.getDisponibilita(idOmbrellone);
    }

    // PUT localhost:8080/ombrellone/{id}
    @PutMapping("/{id}")
    public boolean addDisponibilita(String idOmbrellone, List<SlotData> disponibilitaToAdd) {
        return this.service.addDisponibilita(idOmbrellone, disponibilitaToAdd);
    }

    @PutMapping("/{id}")
    public boolean rimuoviDisponibilita(String idOmbrellone, List<SlotData> dataPrenotazione) {
        return this.service.rimuoviDisponibilita(idOmbrellone, dataPrenotazione);
    }

    // POST localhost:8080/ombrellone/new
    @PostMapping("/new")
    public List<Ombrellone> addListOmbrellone(@RequestBody List<Ombrellone> newOmbrelloneList) {
        return this.service.addListOmbrellone(newOmbrelloneList);
    }

}
