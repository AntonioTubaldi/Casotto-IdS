package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.models.StatoPrenotazione;
import it.unicam.cs.CasottoIdS.repositories.PrenotazioneRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

public class PrenotazioneService {

    @Autowired
    private PrenotazioneRepository repository;

    @Autowired
    private OmbrelloneService ombrelloneService;

    @Autowired
    private UtenteService utenteService;

    public List<Prenotazione> getPrenotazioneByData(List<SlotData> dataPrenotazione) {
       return this.repository.findAllByDataPrenotazione(dataPrenotazione);
    }

    public boolean confermaPrenotazione(String idPrenotazione) {
        Optional<Prenotazione> prenotazioneFromMongo = this.repository.findById(idPrenotazione);
        if(prenotazioneFromMongo.isPresent()) {
            Prenotazione prenotazioneToUpdate = prenotazioneFromMongo.get();
            prenotazioneToUpdate.setStatoPrenotazione(StatoPrenotazione.CONFERMATA);
            this.repository.save(prenotazioneToUpdate);
            utenteService.notificaUtente(prenotazioneToUpdate.getIdUtente(), new Notifica("Prenotazione Confermata", "La tua prenotazione è stata confermata"));
            return true;

        } else
            return false;

    }

    public boolean eliminaPrenotazione(String idPrenotazione) {
        Optional<Prenotazione> prenotazioneFromMongo = this.repository.findById(idPrenotazione);
        if(prenotazioneFromMongo.isPresent()) {
            Prenotazione prenotazioneDaEliminare = prenotazioneFromMongo.get();
            utenteService.notificaUtente(prenotazioneDaEliminare.getIdUtente(), new Notifica("Prenotazione Eliminata", "La tua prenotazione è stata eliminata"));
            ombrelloneService.setDisponibilita(prenotazioneDaEliminare.getIdOmbrellone(), prenotazioneDaEliminare.getDataPrenotazione());
            this.repository.deleteById(idPrenotazione);
            return true;

        } else
            return false;

    }



}
