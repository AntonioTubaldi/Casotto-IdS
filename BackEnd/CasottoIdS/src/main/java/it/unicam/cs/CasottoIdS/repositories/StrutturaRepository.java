package it.unicam.cs.CasottoIdS.repositories;


import it.unicam.cs.CasottoIdS.models.Struttura;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StrutturaRepository extends MongoRepository<Struttura, String> {
}
