package it.unicam.cs.CasottoIdS.services;


import it.unicam.cs.CasottoIdS.models.StatoStruttura;
import it.unicam.cs.CasottoIdS.models.Struttura;
import it.unicam.cs.CasottoIdS.repositories.StrutturaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StrutturaService {

    @Autowired
    private StrutturaRepository repository;

    public List<Struttura> getAll() {
       List<Struttura> elencoStrutture = this.repository.findAll();
       return elencoStrutture;
    }

    public boolean addStruttura(String nome, StatoStruttura stato) {
        Struttura newStruttura = new Struttura(nome, stato);
        this.repository.save(newStruttura);
        Optional<Struttura> strutturaFromMongo = this.repository.findById(newStruttura.getIdStruttura());
        boolean esito;
        if(strutturaFromMongo.isPresent()) {
            esito = true;
        } else {
            esito = false;
        }
        return esito;
    }

    public boolean modificaStruttura(String idStruttura, String newNome, StatoStruttura newStato) {
        Optional<Struttura> strutturaFromMongo = this.repository.findById(idStruttura);
        boolean esito;
        if(strutturaFromMongo.isPresent()) {
            Struttura daModificare = strutturaFromMongo.get();
            daModificare.setNome(newNome);
            daModificare.setStato(newStato);
            this.repository.save(daModificare);
            esito = true;
        }
        else esito = false;
        return esito;
    }

    public void deleteStruttura(String idStruttura) {
        this.repository.deleteById(idStruttura);
    }


}
