package it.unicam.cs.CasottoIdS;

import it.unicam.cs.CasottoIdS.models.Giorno;
import it.unicam.cs.CasottoIdS.models.Ombrellone;
import it.unicam.cs.CasottoIdS.models.SlotData;
import it.unicam.cs.CasottoIdS.repositories.OmbrelloneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import static it.unicam.cs.CasottoIdS.models.Giorno.POMERIGGIO;

@SpringBootApplication
public class CasottoIdSApplication implements CommandLineRunner {

	@Autowired
	private OmbrelloneRepository ombrelloneRepository;

	public static void main(String[] args) {
		SpringApplication.run(CasottoIdSApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		ombrelloneRepository.deleteAll();
		Ombrellone toAddOne = new Ombrellone(50, 1, Giorno.MATTINA, 2022-6-10 );
		ombrelloneRepository.save(toAddOne);



	}

}
