package it.unicam.cs.CasottoIdS.repositories;

import it.unicam.cs.CasottoIdS.models.Evento;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface EventoRepository extends MongoRepository<Evento, String> {

    public List<Evento> findAllByData(LocalDate data);
}
