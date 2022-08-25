package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Attrezzatura;
import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.repositories.AttrezzaturaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AttrezzaturaService {

    @Autowired
    private AttrezzaturaRepository repository;

    public List<Attrezzatura> getAll() {
       List<Attrezzatura> elencoAttrezzature = this.repository.findAll();
       return elencoAttrezzature;
    }

    public boolean addAttrezzatura(String nome, int quantita) {
        Attrezzatura newAttrezzatura = new Attrezzatura(nome, quantita);
        this.repository.save(newAttrezzatura);
        Optional<Attrezzatura> attrezzaturaFromMongo = this.repository.findById(newAttrezzatura.getNome());
        boolean esito;
        if(attrezzaturaFromMongo.isPresent()) {
            esito = true;
        } else {
            esito = false;
        }
        return esito;
    }

    public boolean modificaAttrezzatura(String nome, int newQuantita) {
        Optional<Attrezzatura> attrezzaturaFromMongo = this.repository.findById(nome);
        boolean esito;
        if(attrezzaturaFromMongo.isPresent()) {
            Attrezzatura daModificare = attrezzaturaFromMongo.get();
            daModificare.setQuantita(newQuantita);
            this.repository.save(daModificare);
            esito = true;
        }
        else esito = false;
        return esito;
    }

    public void deleteAttrezzatura(String nome) {
        this.repository.deleteById(nome);
    }

}
