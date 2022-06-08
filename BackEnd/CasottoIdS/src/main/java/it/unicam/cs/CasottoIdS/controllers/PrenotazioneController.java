package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.ParametriPrenotazione;
import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.services.PrenotazioneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/prenotazione")
public class PrenotazioneController {

    @Autowired
    private PrenotazioneService service;

    @GetMapping("/data")
    public List<Prenotazione> getPrenotazioneByData(@RequestBody Date data) {
        return this.service.getPrenotazioneByData(data);
    }

    @PutMapping("/conferma/{id}")
    public boolean confermaPrenotazione(@PathVariable("id") String idPrenotazione) {
        return this.service.confermaPrenotazione(idPrenotazione);

    }

    @DeleteMapping("/delete/{id}")
    public boolean eliminaPrenotazione(@PathVariable("id") String idPrenotazione) {
        return this.service.eliminaPrenotazione(idPrenotazione);
    }

    @PostMapping("new")
    public boolean addPrenotazione(@RequestBody ParametriPrenotazione p) {
        return this.service.addPrenotazione( p.idUtente, p.idOmbrellone, p.costoTotale, p.dataPrenotazione);
    }
}
