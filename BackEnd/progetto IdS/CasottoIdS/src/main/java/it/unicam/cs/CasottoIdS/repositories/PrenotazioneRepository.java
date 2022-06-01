package it.unicam.cs.CasottoIdS.repositories;

import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.Prenotazione;
import it.unicam.cs.CasottoIdS.models.SlotData;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface PrenotazioneRepository extends MongoRepository<Prenotazione, String> {

    public List<Prenotazione> findAllByDataPrenotazione(List<SlotData> dataPrenotazione);

}
