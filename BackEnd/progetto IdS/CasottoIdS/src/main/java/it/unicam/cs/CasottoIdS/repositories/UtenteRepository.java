package it.unicam.cs.CasottoIdS.repositories;

import it.unicam.cs.CasottoIdS.models.Utente;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UtenteRepository extends MongoRepository<Utente, String> {
}
