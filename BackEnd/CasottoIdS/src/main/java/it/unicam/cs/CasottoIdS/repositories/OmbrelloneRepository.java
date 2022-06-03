package it.unicam.cs.CasottoIdS.repositories;


import it.unicam.cs.CasottoIdS.models.Ombrellone;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OmbrelloneRepository extends MongoRepository<Ombrellone, String> {



}
