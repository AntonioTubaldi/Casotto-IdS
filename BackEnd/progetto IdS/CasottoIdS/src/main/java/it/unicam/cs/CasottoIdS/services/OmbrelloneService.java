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

    public List<Ombrellone> getAll() {
        return this.repository.findAll();
    }

    public List<SlotData> getDisponibilita(String idOmbrellone) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if (ombrelloneFromMongo.isPresent()) {
            Ombrellone ombrellone = ombrelloneFromMongo.get();
            return ombrellone.getDisponibilita();
        } else {
            return null;
        }


    }

    public boolean setDisponibilita(String idOmbrellone, List<SlotData> disponibilitaToAdd) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if (ombrelloneFromMongo.isPresent()) {
            Ombrellone ombrelloneToUpdate = ombrelloneFromMongo.get();
            ombrelloneToUpdate.addDisponibilita(disponibilitaToAdd);
            this.repository.save(ombrelloneToUpdate);
            return true;
        } else
            return false;
    }

    public boolean rimuoviDisponibilitaById(String idOmbrellone, List<SlotData> dataPrenotazione) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if (ombrelloneFromMongo.isPresent()) {
            Ombrellone toUpdate = ombrelloneFromMongo.get();
            boolean disponibilitaAggiornata = toUpdate.rimuoviDisponibilita(dataPrenotazione);
            this.repository.save(toUpdate);
            return disponibilitaAggiornata;
        } else {
            return false;
        }
    }

    public List<Ombrellone> addListOmbrellone(List<Ombrellone> newOmbrelloneList) {
        this.repository.saveAll(newOmbrelloneList);
        return this.repository.findAll();
    }
}


