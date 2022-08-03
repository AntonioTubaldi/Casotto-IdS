package it.unicam.cs.CasottoIdS.repositories;

import it.unicam.cs.CasottoIdS.models.Prenotazione;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PrenotazioneRepository extends MongoRepository<Prenotazione, String> {

public List<Prenotazione> findByIdOmbrellone(String idOmbrellone);
public void deleteByIdOmbrellone(String idOmbrellone);

}
