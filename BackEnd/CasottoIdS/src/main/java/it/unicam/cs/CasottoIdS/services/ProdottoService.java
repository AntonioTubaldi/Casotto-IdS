package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
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
        Prodotto newProdotto = new Prodotto(nome, prezzo);
        this.repository.save(newProdotto);
        Optional<Prodotto> prodottoFromMongo = this.repository.findById(newProdotto.getNome());
        if(prodottoFromMongo.isPresent()) {
            return true;
        } else
            return false;
        }

    public void deleteProdotto(String nome) {
        this.repository.deleteById(nome);
    }

    public boolean modificaProdotto(String nome, double newPrezzo) {
        Optional<Prodotto> prodottoFromMongo = this.repository.findById(nome);
        if(prodottoFromMongo.isPresent()) {
            Prodotto daModificare = prodottoFromMongo.get();
            daModificare.setPrezzo(newPrezzo);
            this.repository.save(daModificare);
            return true;
        }
        else return false;

    }

}
