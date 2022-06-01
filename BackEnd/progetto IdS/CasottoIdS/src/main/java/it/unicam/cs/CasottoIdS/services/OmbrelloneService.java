package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.repositories.OmbrelloneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OmbrelloneService {

    @Autowired
    private OmbrelloneRepository repository;

    /**
     * recupera la lista degli ombrelloni presenti nel database
     * @return la lista degli ombrelloni nel database
     * */
    public List<Ombrellone> getAll() {
        return this.repository.findAll();
    }

    /**
     * @param idOmbrellone
     * recupera la disponibilità di un ombrellone dato il suo identificativo
     * @return la disponibilità dell'ombrellone altrimenti ritorna <null>.
     * */
    public List<SlotData> getDisponibilita(String idOmbrellone)  {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if(ombrelloneFromMongo.isPresent()) {
            Ombrellone ombrellone = ombrelloneFromMongo.get();
            return ombrellone.getDisponibilita();
        } else {
            return null;
        }


    }
    /**
     * @param idOmbrellone
     * @param dataPrenotazione
     *
     * permette di rimuovere la disponibilità di un ombrellone attraverso l'inserimento
     * dell'identificativo dell'ombrellone e la data della prenotazione
     *
     * @return la disponibilità aggiornata per quel determinato ombrellone
     * altrimenti ritorna false.
     * */
    public boolean rimuoviDisponibilitaById(String idOmbrellone, List<SlotData> dataPrenotazione) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if(ombrelloneFromMongo.isPresent()) {
            Ombrellone toUpdate = ombrelloneFromMongo.get();
            boolean disponibilitaAggiornata = toUpdate.rimuoviDisponibilita(dataPrenotazione);
            this.repository.save(toUpdate);
            return disponibilitaAggiornata;
           } else {
            return false;
        }
    }

    /**
     * aggiunge una lista di ombrelloni nel database
     * @return la lista di ombrelloni inserite nel repository
     * */
    public List<Ombrellone> addListOmbrellone(List<Ombrellone> newOmbrelloneList) {
        this.repository.saveAll(newOmbrelloneList);
        return this.repository.findAll();
    }

}
