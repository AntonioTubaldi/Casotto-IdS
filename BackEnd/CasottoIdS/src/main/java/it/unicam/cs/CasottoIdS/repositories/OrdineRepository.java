package it.unicam.cs.CasottoIdS.repositories;


import it.unicam.cs.CasottoIdS.models.Ordine;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface OrdineRepository extends MongoRepository<Ordine, String> {
}
