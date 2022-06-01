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
        this.repository.deleteById(idPrenotazione);
        Optional<Prenotazione> prenotazioneFromMongo = this.repository.findById(idPrenotazione);
        if(prenotazioneFromMongo.isPresent()) {
            Prenotazione prenotazioneEliminata = prenotazioneFromMongo.get();
            utenteService.notificaUtente(prenotazioneEliminata.getIdUtente(), new Notifica("Prenotazione Eliminata", "La tua prenotazione è stata eliminata"));

          //  public boolean setDisponibilita(String idOmbrellone)
            return true;

        } else
            return false;

    }



}
