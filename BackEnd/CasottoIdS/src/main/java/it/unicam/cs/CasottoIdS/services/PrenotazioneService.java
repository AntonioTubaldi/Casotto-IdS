package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Notifica;
import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.models.StatoPrenotazione;
import it.unicam.cs.CasottoIdS.repositories.PrenotazioneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PrenotazioneService {

    @Autowired
    private PrenotazioneRepository repository;

    @Autowired
    private OmbrelloneService ombrelloneService;

    @Autowired
    private UtenteService utenteService;

    /**
     * @param dataPrenotazione
     * recupera una lista di prenotazioni eseguite in una determinata data
     * @return le prenotazioni eseguite in quella data
     * */
    public List<Prenotazione> getPrenotazioneByData(List<SlotData> dataPrenotazione) {
       return this.repository.findAllByDataPrenotazione(dataPrenotazione);
    }

    /**
     * @param idPrenotazione
     *
     * conferma la prenotazione di un utente attraverso l'inserimento
     * dell'identificativo della prenotazione
     *
     * @return true se la prenotazione è stata confermata
     * @return false se la prenotazione non è andata a buon fine
     * */
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

    /**
     * @param idPrenotazione
     *
     * Elimina una determinata prenotazione attraverso l'inserimento dell'identificativo della prenotazione
     *
     * @return true se la prenotazione è stata eliminata
     * @return false se l'eliminazione della prenotazione non è andata a buon fine
     * */
    public boolean eliminaPrenotazione(String idPrenotazione) {
        Optional<Prenotazione> prenotazioneFromMongo = this.repository.findById(idPrenotazione);
        if(prenotazioneFromMongo.isPresent()) {
            Prenotazione prenotazioneDaEliminare = prenotazioneFromMongo.get();
            this.repository.deleteById(idPrenotazione);
            utenteService.notificaUtente(prenotazioneDaEliminare.getIdUtente(), new Notifica("Prenotazione Eliminata", "La tua prenotazione è stata eliminata"));
            ombrelloneService.addDisponibilita(prenotazioneDaEliminare.getIdOmbrellone(), prenotazioneDaEliminare.getDataPrenotazione());
            return true;

        } else
            return false;

    }

    public boolean addPrenotazione(String idOmbrellone, String idUtente, double costoTotale, List<SlotData> dataPrenotazione) {
        Prenotazione newPrenotazione = new Prenotazione(idOmbrellone,idUtente,costoTotale,dataPrenotazione);
        this.repository.save(newPrenotazione);
        boolean prenotazioneConfermata = ombrelloneService.rimuoviDisponibilita(newPrenotazione.getIdOmbrellone(), newPrenotazione.getDataPrenotazione());
        return prenotazioneConfermata;
    }



}
