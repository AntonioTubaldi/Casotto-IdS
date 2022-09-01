package it.unicam.cs.CasottoIdS.controllers;

import it.unicam.cs.CasottoIdS.DTO.GetEventoByDataBody;
import it.unicam.cs.CasottoIdS.models.Evento;
import it.unicam.cs.CasottoIdS.models.ParametriEvento;
import it.unicam.cs.CasottoIdS.models.ParametriModificaEvento;
import it.unicam.cs.CasottoIdS.services.EventoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/evento")
public class EventoController {

    @Autowired
    private EventoService service;

    @GetMapping("/all")
    public List<Evento> getAll() {
        return this.service.getAll();
    }

    @PostMapping("/data")
    public List<Evento> getEventoByData(@RequestBody GetEventoByDataBody bodyData) {
        return this.service.getEventoByData(bodyData.data);
    }

    @PostMapping("/new")
    public boolean addEvento(@RequestBody ParametriEvento p) {
        return this.service.addEvento(p.nome, p.data, p.orarioInizio, p.numeroMaxPartecipanti);
    }

    @PutMapping("/modifica/{id}")
    public boolean modificaEvento(@PathVariable("id") String idEvento, @RequestBody ParametriModificaEvento p) {
        return this.service.modificaEvento(idEvento, p.data, p.orarioInizio, p.numeroMaxPartecipanti);
    }

    @DeleteMapping("/delete/{id}")
    public boolean eliminaEvento(@PathVariable("id") String idEvento) {

        return this.service.eliminaEvento(idEvento);
    }
}
