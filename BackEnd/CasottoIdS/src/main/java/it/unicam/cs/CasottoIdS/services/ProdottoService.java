package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.Prodotto;
import it.unicam.cs.CasottoIdS.models.Tipologia;
import it.unicam.cs.CasottoIdS.repositories.ProdottoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProdottoService {

    @Autowired
    private ProdottoRepository repository;

    public List<Prodotto> getAll() {
       List<Prodotto> menu = this.repository.findAll();
       return menu;
    }

    public boolean addProdotto(String nome, double prezzo) {
        boolean esito;
        Prodotto newProdotto = new Prodotto(nome, prezzo);
        this.repository.save(newProdotto);
        Optional<Prodotto> prodottoFromMongo = this.repository.findById(newProdotto.getNome());
        if(prodottoFromMongo.isPresent()) {
            esito = true;
        } else
            esito = false;
        return esito;
        }

    public boolean deleteProdotto(String nome) {
        boolean esito;
        Optional<Prodotto> prodottoFromMongo = this.repository.findById(nome);
        if(prodottoFromMongo.isPresent()) {
            this.repository.deleteById(nome);
            esito = true;
        }
        else
            esito = false;
        return esito;
    }

    public boolean modificaProdotto(String nome, double newPrezzo) {
        boolean esito;
        Optional<Prodotto> prodottoFromMongo = this.repository.findById(nome);
        if(prodottoFromMongo.isPresent()) {
            Prodotto daModificare = prodottoFromMongo.get();
            daModificare.setPrezzo(newPrezzo);
            this.repository.save(daModificare);
            esito = true;
        }
        else esito = false;
        return esito;
    }

}
