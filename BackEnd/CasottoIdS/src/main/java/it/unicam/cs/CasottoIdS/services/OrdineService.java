package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.repositories.OrdineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrdineService {

    @Autowired
    private OrdineRepository repository;

    @Autowired
    private UtenteService utenteService;

    public List<Ordine> getAll() {
        return this.repository.findAll();
    }

    public boolean addOrdine(String idUtente, String idOmbrellone, double costoTotale, List<Prodotto> prodotti) {
        Ordine newOrdine = new Ordine(idUtente,idOmbrellone, costoTotale,prodotti);
        this.repository.save(newOrdine);
        Optional<Ordine> ordineFromMongo = this.repository.findById(newOrdine.getIdOrdine());
        boolean esito;
        if(ordineFromMongo.isPresent()) {
            esito = true;

        } else {
            esito = false;
        }
        return esito;

    }
    
    public boolean gestisceOrdine(String idOrdine){
        boolean esito;
        Optional<Ordine> ordinazioneFromMongo = this.repository.findById(idOrdine);
            if(ordinazioneFromMongo.isPresent()) {
                Ordine ordinazioneToUpdate = ordinazioneFromMongo.get();
                ordinazioneToUpdate.setStato(StatoOrdine.IN_GESTIONE);
                this.repository.save(ordinazioneToUpdate);
                esito = true;

            } else esito=false;

            return esito;
    }

    public boolean chiudeOrdine(String idOrdine){
        boolean esito;
        this.repository.deleteById(idOrdine);
        Optional<Ordine> ordinazioneFromMongo = this.repository.findById(idOrdine);
        if(ordinazioneFromMongo.isPresent()) {
            esito = false;

        } else esito=true;

        return esito;
    }
}
