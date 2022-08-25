package it.unicam.cs.CasottoIdS.repositories;

import it.unicam.cs.CasottoIdS.models.Attrezzatura;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttrezzaturaRepository extends MongoRepository<Attrezzatura, String> {
}
