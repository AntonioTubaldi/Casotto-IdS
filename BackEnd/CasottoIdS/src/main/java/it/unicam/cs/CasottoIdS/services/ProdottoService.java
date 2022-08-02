package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Prodotto;
import it.unicam.cs.CasottoIdS.repositories.ProdottoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProdottoService {

    @Autowired
    private ProdottoRepository repository;

    public List<Prodotto> getAll() {
       List<Prodotto> menu = this.repository.findAll();
       return menu;
    }

}
