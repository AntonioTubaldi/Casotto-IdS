package it.unicam.cs.CasottoIdS;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.time.ZoneId;
import java.util.*;

import static it.unicam.cs.CasottoIdS.models.Giorno.MATTINA;
import static it.unicam.cs.CasottoIdS.models.Giorno.POMERIGGIO;

@SpringBootApplication
public class CasottoIdSApplication implements CommandLineRunner {

	@Autowired
	private OmbrelloneRepository ombrelloneRepository;

	@Autowired
	private UtenteRepository utenteRepository;

	@Autowired
	private PrenotazioneRepository prenotazioneRepository;

	@Autowired
	private ProdottoRepository prodottoRepository;

	@Autowired
	private OrdineRepository ordineRepository;

	public static void main(String[] args) {
		SpringApplication.run(CasottoIdSApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		ombrelloneRepository.deleteAll();
		utenteRepository.deleteAll();
		prenotazioneRepository.deleteAll();
		prodottoRepository.deleteAll();
		ordineRepository.deleteAll();


		Calendar calendario = Calendar.getInstance();


		calendario.set(2022, 8, 1, 0, 0, 0);
		SlotData iniziale = new SlotData(Giorno.MATTINA, calendario.getTime().toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDate());
		calendario.add(Calendar.DAY_OF_YEAR, 1);
		SlotData iniziale2 = new SlotData(POMERIGGIO, calendario.getTime().toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDate());
		List<SlotData> lista = new ArrayList<>(
				List.of(iniziale, iniziale2)
		);

		calendario.set(2022, 7, 1, 0, 0, 0);
		SlotData iniziale3 = new SlotData(Giorno.MATTINA, calendario.getTime().toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDate());
		SlotData iniziale4 = new SlotData(POMERIGGIO, calendario.getTime().toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDate());
		calendario.set(2022, 7, 2, 0, 0, 0);
		SlotData iniziale5 = new SlotData(POMERIGGIO, calendario.getTime().toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDate());
		List<SlotData> lista1 = new ArrayList<>(
				List.of(iniziale3, iniziale4,iniziale5)
		);


		Ombrellone One = new Ombrellone(10, 1, lista,1,1);
		ombrelloneRepository.save(One);
		Ombrellone Two = new Ombrellone(10, 2, lista1,1,1);
		ombrelloneRepository.save(Two);
		Ombrellone Three = new Ombrellone(8, 3, lista1,1,1);
		ombrelloneRepository.save(Three);

		Utente utente1 = new Utente("Antonio", "Tubaldi", Ruolo.REGISTRATO);
		utente1.setIdUtente("123");
		utenteRepository.save(utente1);
		Utente utente2 = new Utente("Tiziano", "Tacconi", Ruolo.REGISTRATO);
		utente2.setIdUtente("234");
		utenteRepository.save(utente2);

		Prenotazione prenotazione1 = new Prenotazione(utente1.getIdUtente(), One.getIdOmbrellone(), 10, lista,2,1);
		prenotazioneRepository.save(prenotazione1);
		Prenotazione prenotazione2 = new Prenotazione(utente2.getIdUtente(), Two.getIdOmbrellone(), 10, lista,2,1);
		prenotazioneRepository.save(prenotazione2);
		Prenotazione prenotazione3 = new Prenotazione(utente2.getIdUtente(), One.getIdOmbrellone(), 20, lista1,2,1);
		prenotazioneRepository.save(prenotazione3);

		Prodotto prodotto1 = new Prodotto("Gelato", 8, Tipologia.CIBO);
		prodottoRepository.save(prodotto1);
		Prodotto prodotto2 = new Prodotto("Coca-Cola", 4, Tipologia.BIBITA);
		prodottoRepository.save(prodotto2);
		Prodotto prodotto3 = new Prodotto("Pizza Bianca", 3, Tipologia.CIBO);
		prodottoRepository.save(prodotto3);
		Prodotto prodotto4 = new Prodotto("Aranciata", 4, Tipologia.BIBITA);
		prodottoRepository.save(prodotto4);

		List<Prodotto> provaOrdine = new ArrayList<>(List.of(prodotto1,prodotto2,prodotto4));
		List<Prodotto> provaOrdine1 = new ArrayList<>(List.of(prodotto3,prodotto2,prodotto4));


		Ordine ordine1 = new Ordine("123", prodotto1.getPrezzo()+prodotto2.getPrezzo()+prodotto4.getPrezzo(), provaOrdine);
		ordineRepository.save(ordine1);
		Ordine ordine2 = new Ordine("234", prodotto3.getPrezzo()+prodotto2.getPrezzo()+prodotto4.getPrezzo(), provaOrdine1);
		ordineRepository.save(ordine2);




	}

}
