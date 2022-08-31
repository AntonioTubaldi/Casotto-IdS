package it.unicam.cs.CasottoIdS;

import it.unicam.cs.CasottoIdS.models.*;
import it.unicam.cs.CasottoIdS.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.xml.crypto.Data;
import java.time.LocalDate;
import java.time.LocalTime;
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

	@Autowired
	private AttrezzaturaRepository attrezzaturaRepository;

	@Autowired
	private StrutturaRepository strutturaRepository;

	@Autowired
	private EventoRepository eventoRepository;

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
		attrezzaturaRepository.deleteAll();
		strutturaRepository.deleteAll();
		eventoRepository.deleteAll();


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
		One.setIdOmbrellone("999");
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

		List<Utente> listaUtenti = new ArrayList<>(List.of(utente1,utente2));

		Prenotazione prenotazione1 = new Prenotazione(utente1.getIdUtente(), One.getIdOmbrellone(), 10, lista,2,1);
		prenotazioneRepository.save(prenotazione1);
		Prenotazione prenotazione2 = new Prenotazione(utente2.getIdUtente(), Two.getIdOmbrellone(), 10, lista,2,1);
		prenotazioneRepository.save(prenotazione2);
		Prenotazione prenotazione3 = new Prenotazione(utente2.getIdUtente(), One.getIdOmbrellone(), 20, lista1,2,1);
		prenotazioneRepository.save(prenotazione3);

		Prodotto prodotto1 = new Prodotto("Gelato", 8);
		prodottoRepository.save(prodotto1);
		Prodotto prodotto2 = new Prodotto("Coca-Cola", 4);
		prodottoRepository.save(prodotto2);
		Prodotto prodotto3 = new Prodotto("Pizza Bianca", 3);
		prodottoRepository.save(prodotto3);
		Prodotto prodotto4 = new Prodotto("Aranciata", 4);
		prodottoRepository.save(prodotto4);

		List<Prodotto> provaOrdine = new ArrayList<>(List.of(prodotto1,prodotto2,prodotto4));
		List<Prodotto> provaOrdine1 = new ArrayList<>(List.of(prodotto3,prodotto2,prodotto4));


		Ordine ordine1 = new Ordine(utente1.getIdUtente(), One.getIdOmbrellone(), prodotto1.getPrezzo()+prodotto2.getPrezzo()+prodotto4.getPrezzo(), provaOrdine);
		ordineRepository.save(ordine1);
		Ordine ordine2 = new Ordine(utente2.getIdUtente(), Two.getIdOmbrellone(), prodotto3.getPrezzo()+prodotto2.getPrezzo()+prodotto4.getPrezzo(), provaOrdine1);
		ordineRepository.save(ordine2);


		Attrezzatura attrezzatura1 = new Attrezzatura("Pallone da beach volley", 4);
		attrezzaturaRepository.save(attrezzatura1);
		Attrezzatura attrezzatura2 = new Attrezzatura("Racchettoni", 3);
		attrezzaturaRepository.save(attrezzatura2);
		Attrezzatura attrezzatura3 = new Attrezzatura("Porte da calcetto", 2);
		attrezzaturaRepository.save(attrezzatura3);


		Struttura struttura1 = new Struttura("Campo da beach", StatoStruttura.LIBERA);
		strutturaRepository.save(struttura1);
		Struttura struttura2 = new Struttura("Campo da calcetto", StatoStruttura.OCCUPATA);
		strutturaRepository.save(struttura2);
		Struttura struttura3 = new Struttura("Piattaforma per i tuffi", StatoStruttura.OCCUPATA);
		strutturaRepository.save(struttura3);



		Evento evento1 = new Evento("Torneo calcetto", LocalDate.now(), LocalTime.of(19,30),  10 );
		eventoRepository.save(evento1);
		Evento evento2 = new Evento("Torneo beach volley", LocalDate.of(2022,8, 27), LocalTime.of(20,00),  50 );
		eventoRepository.save(evento2);


	}

}
