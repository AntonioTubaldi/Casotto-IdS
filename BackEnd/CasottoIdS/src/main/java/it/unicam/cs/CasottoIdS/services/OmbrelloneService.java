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

    public Ombrellone getById(String idOmbrellone) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if(ombrelloneFromMongo.isPresent()) {
            Ombrellone ombrellone = ombrelloneFromMongo.get();
            return ombrellone;
        } else {
            return null;
        }
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

    public boolean addDisponibilita(String idOmbrellone, List<SlotData> disponibilitaToAdd) {
       Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if (ombrelloneFromMongo.isPresent()) {
            Ombrellone ombrelloneToUpdate = ombrelloneFromMongo.get();
            ombrelloneToUpdate.addDisponibilita(disponibilitaToAdd);
            this.repository.save(ombrelloneToUpdate);
            return true;
        } else
            return false;
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
    public boolean rimuoviDisponibilita(String idOmbrellone, List<SlotData> dataPrenotazione) {
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
    public Ombrellone addOmbrellone(Ombrellone newOmbrellone) {
        return this.repository.save(newOmbrellone);

    }

    public void delOmbrellone(String idOmbrellone) {
        this.repository.deleteById(idOmbrellone);

    }

    public Ombrellone modificaOmbrellone(String idOmbrellone, double newPrezzo, int newPosizione, double newPrezzoLettini, double newPrezzoSdraio) {
        Optional<Ombrellone> ombrelloneFromMongo = this.repository.findById(idOmbrellone);
        if(ombrelloneFromMongo.isPresent()) {
            Ombrellone daModificare = ombrelloneFromMongo.get();
            daModificare.setPrezzo(newPrezzo);
            daModificare.setPosizione(newPosizione);
            daModificare.setPrezzoLettini(newPrezzoLettini);
            daModificare.setPrezzoSdraio(newPrezzoSdraio);
            this.repository.save(daModificare);
            return daModificare;
        }
        else return null;

    }


}
