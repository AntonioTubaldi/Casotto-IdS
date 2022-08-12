package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.Ordine;
import it.unicam.cs.CasottoIdS.models.Prodotto;
import it.unicam.cs.CasottoIdS.models.StatoOrdine;
import it.unicam.cs.CasottoIdS.repositories.OrdineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrdineService {

    @Autowired
    private OrdineRepository repository;

    public List<Ordine> getAll() {
        return this.repository.findAll();
    }

    public boolean addOrdine(String idUtente, double costoTotale, List<Prodotto> prodotti) {
        Ordine newOrdine = new Ordine(idUtente,costoTotale,prodotti);
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
}
