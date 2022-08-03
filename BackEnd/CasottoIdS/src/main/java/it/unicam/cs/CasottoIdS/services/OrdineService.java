package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Ordine;
import it.unicam.cs.CasottoIdS.models.Prodotto;
import it.unicam.cs.CasottoIdS.models.StatoOrdine;
import it.unicam.cs.CasottoIdS.repositories.OrdineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdineService {

    @Autowired
    private OrdineRepository repository;

    public List<Ordine> getAll() {
        return this.repository.findAll();
    }

    public Ordine addOrdine(String idUtente, double costoTotale, List<Prodotto> prodotti) {
        Ordine newOrdine = new Ordine(idUtente, costoTotale, prodotti);
        this.repository.save(newOrdine);
        return newOrdine;
    }
}
