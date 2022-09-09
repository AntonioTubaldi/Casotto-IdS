package it.unicam.cs.CasottoIdS.services;

import it.unicam.cs.CasottoIdS.models.Prodotto;
import it.unicam.cs.CasottoIdS.models.Promozione;
import it.unicam.cs.CasottoIdS.repositories.ProdottoRepository;
import it.unicam.cs.CasottoIdS.repositories.PromozioneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PromozioneService {

    @Autowired
    private PromozioneRepository repository;

    @Autowired
    private ProdottoRepository prodottoRepository;

    public List<Promozione> getAll() {
        return this.repository.findAll();
    }


    public boolean addPromozione(String idProdotto, double newPrezzo) {
        boolean esito;
        Optional<Prodotto> prodottoFromMongo = this.prodottoRepository.findById(idProdotto);
        if(prodottoFromMongo.isPresent()) {
            Prodotto daModificare = prodottoFromMongo.get();
            Promozione newPromozione = new Promozione(idProdotto,daModificare.getPrezzo(),newPrezzo);
            daModificare.setPrezzo(newPrezzo);
            this.prodottoRepository.save(daModificare);
            this.repository.save(newPromozione);
            esito = true;

        } else esito = false;

        return esito;

    }

    public boolean modificaPromozione(String idPromozione, double newPrezzo) {
        boolean esito;
        Optional<Promozione> promozioneFromMongo = this.repository.findById(idPromozione);
        if(promozioneFromMongo.isPresent()) {
            Promozione daModificare = promozioneFromMongo.get();
            daModificare.setNewPrezzo(newPrezzo);
            this.repository.save(daModificare);
            Optional<Prodotto> prodottoFromMongo = this.prodottoRepository.findById(daModificare.getIdProdotto());
            if(prodottoFromMongo.isPresent()) {
                Prodotto prodottoDaModificare = prodottoFromMongo.get();
                prodottoDaModificare.setPrezzo(newPrezzo);
                this.prodottoRepository.save(prodottoDaModificare);

            }
            esito = true;

        } else esito = false;

        return esito;
    }

    public boolean deletePromozione(String idPromozione) {
        boolean esito;
        Optional<Promozione> promozioneFromMongo = this.repository.findById(idPromozione);
        if(promozioneFromMongo.isPresent()) {
            Promozione daEliminare = promozioneFromMongo.get();
            Optional<Prodotto> prodottoFromMongo = this.prodottoRepository.findById(daEliminare.getIdProdotto());
            if(prodottoFromMongo.isPresent()) {
                Prodotto prodottoDaModificare = prodottoFromMongo.get();
                prodottoDaModificare.setPrezzo(daEliminare.getOriginalPrezzo());
                this.prodottoRepository.save(prodottoDaModificare);
                this.repository.deleteById(idPromozione);

            }


            esito = true;
        }
        else esito = false;

        return esito;
    }
}
