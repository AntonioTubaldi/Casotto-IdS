package it.unicam.cs.CasottoIdS.controllers;


import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.services.PrenotazioneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/prenotazione")
public class PrenotazioneController {

    @Autowired
    private PrenotazioneService service;

    @GetMapping("/all/data/{Data}")
    public List<Prenotazione> getPrenotazioneByData(@PathVariable("Data") List<SlotData> dataPrenotazione) {
        return this.service.getPrenotazioneByData(dataPrenotazione);
    }

    @PutMapping("/conferma")
    public boolean confermaPrenotazione(@RequestParam String idPrenotazione) {
        return this.service.confermaPrenotazione(idPrenotazione);

    }

    @DeleteMapping("/delete")
    public boolean eliminaPrenotazione(@RequestParam String idPrenotazione) {
        return this.service.eliminaPrenotazione(idPrenotazione);
    }

    @PostMapping("new")
    public boolean addPrenotazione(String idOmbrellone, String idUtente, double costoTotale, List<SlotData> dataPrenotazione) {
        return this.service.addPrenotazione(idOmbrellone, idUtente, costoTotale, dataPrenotazione);
    }
}
