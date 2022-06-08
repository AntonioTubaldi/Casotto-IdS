package it.unicam.cs.CasottoIdS;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.repositories.OmbrelloneRepository;
import it.unicam.cs.CasottoIdS.repositories.UtenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.*;

import static it.unicam.cs.CasottoIdS.models.Giorno.MATTINA;
import static it.unicam.cs.CasottoIdS.models.Giorno.POMERIGGIO;

@SpringBootApplication
public class CasottoIdSApplication implements CommandLineRunner {

	@Autowired
	private OmbrelloneRepository ombrelloneRepository;

	@Autowired
	private UtenteRepository utenteRepository;

	public static void main(String[] args) {
		SpringApplication.run(CasottoIdSApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		ombrelloneRepository.deleteAll();
		utenteRepository.deleteAll();
		Calendar calendario = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"),Locale.ITALY);


		calendario.set(2022, 8, 1, 0, 0, 0);
		SlotData iniziale = new SlotData(Giorno.MATTINA, calendario.getTime());
		calendario.add(Calendar.DAY_OF_YEAR, 1);
		SlotData iniziale2 = new SlotData(POMERIGGIO, calendario.getTime());
		List<SlotData> lista = new ArrayList<>(
				List.of(iniziale, iniziale2)
		);

		calendario.set(2022, 7, 1, 0, 0, 0);
		SlotData iniziale3 = new SlotData(Giorno.MATTINA, calendario.getTime());
		SlotData iniziale4 = new SlotData(POMERIGGIO, calendario.getTime());
		calendario.set(2022, 7, 2, 0, 0, 0);
		SlotData iniziale5 = new SlotData(POMERIGGIO, calendario.getTime());
		List<SlotData> lista1 = new ArrayList<>(
				List.of(iniziale3, iniziale4,iniziale5)
		);


		Ombrellone toAddOne = new Ombrellone(50, 1, lista);
		ombrelloneRepository.save(toAddOne);
		Ombrellone toAddTwo = new Ombrellone(50, 2, lista1);
		ombrelloneRepository.save(toAddTwo);

		Utente utente1 = new Utente("Antonio", "Tubaldi", Ruolo.REGISTRATO);
		utenteRepository.save(utente1);

	}

}
