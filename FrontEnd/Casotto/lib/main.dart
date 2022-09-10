import 'package:casotto/arguments/AddOmbrelloneViewArgs.dart';
import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/AddProdottoViewArgs.dart';
import 'package:casotto/arguments/OmbrelloneStringArg.dart';
import 'package:casotto/arguments/PromozioneIdArg.dart';
import 'package:casotto/arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/SingleOmbrelloneViewArgs.dart';
import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/views/AddAttrezzatura.dart';
import 'package:casotto/views/AddEvento.dart';
import 'package:casotto/views/AddOrdine.dart';
import 'package:casotto/views/AddProdotto.dart';
import 'package:casotto/views/AddPromozione.dart';
import 'package:casotto/views/AddStruttura.dart';
import 'package:casotto/views/AllAttrezzature.dart';
import 'package:casotto/views/AllEventi.dart';
import 'package:casotto/views/AllEventiAderiti.dart';
import 'package:casotto/views/AllNotifiche.dart';
import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllOrdini.dart';
import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/AllPrenotazioniUtente.dart';
import 'package:casotto/views/AllPromozioniGestore.dart';
import 'package:casotto/views/AllPromozioniUtente.dart';
import 'package:casotto/views/AllStrutture.dart';
import 'package:casotto/views/AllUtenti.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:casotto/views/ChiudeOrdine.dart';
import 'package:casotto/views/ConfermaEliminazione.dart';
import 'package:casotto/views/ConfermaEliminazioneAttrezzatura.dart';
import 'package:casotto/views/ConfermaEliminazioneEvento.dart';
import 'package:casotto/views/ConfermaEliminazioneProdotto.dart';
import 'package:casotto/views/ConfermaEliminazioneStruttura.dart';
import 'package:casotto/views/ConfermaInvioMessaggio.dart';
import 'package:casotto/views/EliminaAttrezzatura.dart';
import 'package:casotto/views/EliminaPromozione.dart';
import 'package:casotto/views/EliminaStruttura.dart';
import 'package:casotto/views/EventoEliminato.dart';
import 'package:casotto/views/GestisceOrdine.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/IscrizioneAdEvento.dart';
import 'package:casotto/views/Menu.dart';
import 'package:casotto/views/MessaggioInviato.dart';
import 'package:casotto/views/ModificaAttrezzatura.dart';
import 'package:casotto/views/ModificaDataEvento.dart';
import 'package:casotto/views/ModificaEvento.dart';
import 'package:casotto/views/ModificaOmbrellone.dart';
import 'package:casotto/views/ModificaOrarioEvento.dart';
import 'package:casotto/views/ModificaParametriStruttura.dart';
import 'package:casotto/views/ModificaPartecipantiEvento.dart';
import 'package:casotto/views/ModificaProdotto.dart';
import 'package:casotto/views/ModificaPromozione.dart';
import 'package:casotto/views/ModificaStruttura.dart';
import 'package:casotto/views/PaginaContatti.dart';
import 'package:casotto/views/PrenotazioneConfermata.dart';
import 'package:casotto/views/PrenotazioneEliminata.dart';
import 'package:casotto/views/ProdottiSelezionabili.dart';
import 'package:casotto/views/ProdottoEliminato.dart';
import 'package:casotto/views/RiepilogoAttrezzatura.dart';
import 'package:casotto/views/RiepilogoEvento.dart';
import 'package:casotto/views/RiepilogoModificaEvento.dart';
import 'package:casotto/views/RiepilogoModificaStruttura.dart';
import 'package:casotto/views/RiepilogoModificheAttrezzatura.dart';
import 'package:casotto/views/RiepilogoOrdinazione.dart';
import 'package:casotto/views/RiepilogoPrenotazione.dart';
import 'package:casotto/views/RiepilogoStruttura.dart';
import 'package:casotto/views/RimuoviOmbrellone.dart';
import 'package:casotto/views/SceltaDataEvento.dart';
import 'package:casotto/views/SceltaLettini.dart';
import 'package:casotto/views/SceltaModificheAttrezzatura.dart';
import 'package:casotto/views/SceltaModificheOmbrellone.dart';
import 'package:casotto/views/SceltaNomeEPartecipanti.dart';
import 'package:casotto/views/SceltaOrarioEvento.dart';
import 'package:casotto/views/SceltaParametriStruttura.dart';
import 'package:casotto/views/SceltaPrezzoProdotto.dart';
import 'package:casotto/views/SceltaSpecificheOmb.dart';
import 'package:casotto/views/SceltaSpecificheProdotto.dart';
import 'package:casotto/views/SceltaSpecifichePromozione.dart';
import 'package:casotto/views/ScritturaMessaggio.dart';
import 'package:casotto/views/SingleAttrezzatura.dart';
import 'package:casotto/views/SingleEvento.dart';
import 'package:casotto/views/SingleOmbrellone.dart';
import 'package:casotto/views/SingleOrdine.dart';
import 'package:casotto/views/SinglePrenotazione.dart';
import 'package:casotto/views/SinglePrenotazioneUtente.dart';
import 'package:casotto/views/SingleProdotto.dart';
import 'package:casotto/views/SinglePromozioneGestore.dart';
import 'package:casotto/views/SingleStruttura.dart';
import 'package:casotto/views/AddOmbrellone.dart';
import 'package:casotto/views/SingleUtente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'arguments/AddEventoArgs.dart';
import 'arguments/AddOrdineViewArgs.dart';
import 'arguments/AddPromozioneArgs.dart';
import 'arguments/AddStrutturaArgs.dart';
import 'arguments/AllPrenotazioniViewArgs.dart';
import 'arguments/AttrezzaturaNomeArg.dart';
import 'arguments/ConfermaInvioArgs.dart';
import 'arguments/IscrizioneEventoViewArgs.dart';
import 'arguments/ModificaAttrezzaturaViewArgs.dart';
import 'arguments/ModificaDataEventoArgs.dart';
import 'arguments/ModificaEventoArgs.dart';
import 'arguments/ModificaOrarioEventoArgs.dart';
import 'arguments/ModificaParametriStrutturaArgs.dart';
import 'arguments/ModificaPartecipantiEventoArgs.dart';
import 'arguments/ModificaProdottoViewArgs.dart';
import 'arguments/ModificaPromozioneViewArgs.dart';
import 'arguments/ModificaStrutturaArgs.dart';
import 'arguments/ProdottiSelezionabiliArgs.dart';
import 'arguments/ProdottoStringArgs.dart';
import 'arguments/SceltaDataEventoArgs.dart';
import 'arguments/SceltaLettiniViewArgs.dart';
import 'arguments/SceltaModificheOmbrelloneViewArgs.dart';
import 'arguments/SceltaOrarioEventoArgs.dart';
import 'arguments/SingleAttrezzaturaViewArgs.dart';
import 'arguments/SingleEventoViewArgs.dart';
import 'arguments/SingleOrdineArgs.dart';
import 'arguments/SinglePrenotazioneViewArgs.dart';
import 'arguments/SingleProdottoViewArgs.dart';
import 'arguments/SinglePromozioneArgs.dart';
import 'arguments/SingleStrutturaArgs.dart';
import 'arguments/SingleUtenteArgs.dart';
import 'arguments/UtenteStringArg.dart';
import 'views/AddPrenotazione.dart';
import 'views/SceltaSpecificheAttrezzature.dart';

Future main() async {
  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        final argomenti = settings.arguments;
        final percorso = settings.name;

        switch (percorso) {
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (_) => HomePage(),
              settings: const RouteSettings(name: HomePage.routeName),
            );
            break;

          case AllOmbrelloniView.routeName:
            return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AllOmbrelloniView.routeName),
                builder: (_) => AllOmbrelloniView());

            break;

          case SingleOmbrelloneView.routeName:
            if (argomenti is SingleOmbrelloneViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SingleOmbrelloneView.routeName),
                builder: (_) =>
                    SingleOmbrelloneView(ombrellone: argomenti.singleOmbre),
              );
            }
            break;

          case RiepilogoPrenotazioneView.routeName:
            if (argomenti is RiepilogoPrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoPrenotazioneView.routeName),
                builder: (_) => RiepilogoPrenotazioneView(
                    selezionati: argomenti.lista,
                    singleOmbrellone: argomenti.ombrellone1,
                    numeroLettini: argomenti.numeroLettini,
                    numeroSdraio: argomenti.numeroSdraio),
              );
            }
            break;

          case AddPrenotazioneView.routeName:
            if (argomenti is AddPrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AddPrenotazioneView.routeName),
                builder: (_) => AddPrenotazioneView(
                    idUtente: argomenti.idUtente,
                    idOmbrellone: argomenti.idOmbrellone,
                    dataPrenotazione: argomenti.dataPrenotazione,
                    numeroLettini: argomenti.numeroLettini,
                    numeroSdraio: argomenti.numeroSdraio),
              );
            }
            break;

          case CalendarView.routeName:
            return MaterialPageRoute(
                settings: const RouteSettings(name: CalendarView.routeName),
                builder: (_) => CalendarView());

            break;

          case AllPrenotazioniView.routeName:
            if (argomenti is AllPrenotazioniViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AllPrenotazioniView.routeName),
                builder: (_) =>
                    AllPrenotazioniView(dataSelezionata: argomenti.data),
              );
            }
            break;

          case SinglePrenotazioneView.routeName:
            if (argomenti is SinglePrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SinglePrenotazioneView.routeName),
                builder: (_) => SinglePrenotazioneView(
                    singlePrenotazione: argomenti.prenotazione1),
              );
            }
            break;

          case PrenotazioneConfermataView.routeName:
            if (argomenti is SinglePrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: PrenotazioneConfermataView.routeName),
                builder: (_) =>
                    PrenotazioneConfermataView(child: argomenti.prenotazione1),
              );
            }
            break;

          case PrenotazioneEliminataView.routeName:
            if (argomenti is SinglePrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: PrenotazioneEliminataView.routeName),
                builder: (_) =>
                    PrenotazioneEliminataView(child: argomenti.prenotazione1),
              );
            }
            break;

          case SceltaLettiniView.routeName:
            if (argomenti is SceltaLettiniViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SceltaLettiniView.routeName),
                builder: (_) => SceltaLettiniView(
                    selezionati: argomenti.lista,
                    singleOmbrellone: argomenti.ombrellone1),
              );
            }
            break;

          case AddOmbrelloneView.routeName:
            if (argomenti is AddOmbrelloneViewArgs) {
              return MaterialPageRoute(
                  settings:
                      const RouteSettings(name: AddOmbrelloneView.routeName),
                  builder: (_) => AddOmbrelloneView(
                      prezzo: argomenti.prezzo,
                      posizione: argomenti.posizione,
                      prezzoLettini: argomenti.prezzoLettini,
                      prezzoSdraio: argomenti.prezzoSdraio));
            }
            break;

          case SceltaSpecificheOmbView.routeName:
            return MaterialPageRoute(
              settings:
                  const RouteSettings(name: SceltaSpecificheOmbView.routeName),
              builder: (_) => SceltaSpecificheOmbView(),
            );
            break;

          case RimuoviOmbrelloneView.routeName:
            if (argomenti is OmbrelloneStringArg) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: RimuoviOmbrelloneView.routeName),
                builder: (_) =>
                    RimuoviOmbrelloneView(idOmbrellone: argomenti.idOmbrellone),
              );
            }
            break;

          case SceltaModificheOmbrelloneView.routeName:
            if (argomenti is SceltaModificheOmbrelloneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaModificheOmbrelloneView.routeName),
                builder: (_) => SceltaModificheOmbrelloneView(
                    idOmbrellone: argomenti.idOmbrellone,
                    prezzo: argomenti.prezzo,
                    posizione: argomenti.posizione,
                    prezzoLettini: argomenti.prezzoLettini,
                    prezzoSdraio: argomenti.prezzoSdraio),
              );
            }
            break;

          case ModificaOmbrelloneView.routeName:
            if (argomenti is SceltaModificheOmbrelloneViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaOmbrelloneView.routeName),
                builder: (_) => ModificaOmbrelloneView(
                    idOmbrellone: argomenti.idOmbrellone,
                    prezzo: argomenti.prezzo,
                    posizione: argomenti.posizione,
                    prezzoLettini: argomenti.prezzoLettini,
                    prezzoSdraio: argomenti.prezzoSdraio),
              );
            }
            break;

          case MenuView.routeName:
            return MaterialPageRoute(
                settings: const RouteSettings(name: MenuView.routeName),
                builder: (_) => MenuView());

            break;

          case ProdottiSelezionabiliView.routeName:
            if (argomenti is ProdottiSelezionabiliArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ProdottiSelezionabiliView.routeName),
                builder: (_) =>
                    ProdottiSelezionabiliView(lista: argomenti.lista),
              );
            }
            break;

          case SingleProdottoView.routeName:
            if (argomenti is SingleProdottoViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SingleProdottoView.routeName),
                builder: (_) => SingleProdottoView(
                    singleProdotto: argomenti.singleProdotto),
              );
            }
            break;

          case ProdottoEliminatoView.routeName:
            if (argomenti is ProdottoStringArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ProdottoEliminatoView.routeName),
                builder: (_) => ProdottoEliminatoView(name: argomenti.nome),
              );
            }
            break;

          case SceltaPrezzoProdottoView.routeName:
            if (argomenti is ProdottoStringArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaPrezzoProdottoView.routeName),
                builder: (_) => SceltaPrezzoProdottoView(nome: argomenti.nome),
              );
            }
            break;

          case ModificaProdottoView.routeName:
            if (argomenti is ModificaProdottoViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaProdottoView.routeName),
                builder: (_) => ModificaProdottoView(
                    nome: argomenti.nome, newPrezzo: argomenti.prezzo),
              );
            }
            break;

          case AddProdottoView.routeName:
            if (argomenti is ModificaProdottoViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: AddProdottoView.routeName),
                builder: (_) => AddProdottoView(
                    nome: argomenti.nome, prezzo: argomenti.prezzo),
              );
            }
            break;

          case AddOrdineView.routeName:
            if (argomenti is AddOrdineViewArgs) {
              return MaterialPageRoute(
                  settings:
                      const RouteSettings(name: AddProdottoView.routeName),
                  builder: (_) => AddOrdineView(
                        idUtente: argomenti.idUtente,
                        idOmbrellone: argomenti.idOmbrellone,
                        costoTotale: argomenti.costoTotale,
                        prodotti: argomenti.prodotti,
                      ));
            }
            break;

          case SceltaSpecificheProdottoView.routeName:
            return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaSpecificheProdottoView.routeName),
                builder: (_) => SceltaSpecificheProdottoView());
            break;

          case RiepilogoOrdinazioneView.routeName:
            if (argomenti is ProdottiSelezionabiliArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoOrdinazioneView.routeName),
                builder: (_) => RiepilogoOrdinazioneView(
                  lista: argomenti.lista,
                ),
              );
            }
            break;
          case AllOrdiniView.routeName:
            return MaterialPageRoute(
              builder: (_) => AllOrdiniView(),
              settings: const RouteSettings(name: AllOrdiniView.routeName),
            );
            break;

          case PaginaContattiView.routeName:
            return MaterialPageRoute(
              builder: (_) => PaginaContattiView(),
              settings: const RouteSettings(name: PaginaContattiView.routeName),
            );
            break;

          case ConfermaEliminazioneView.routeName:
            if (argomenti is SingleOmbrelloneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaEliminazioneView.routeName),
                builder: (_) => ConfermaEliminazioneView(
                    singleOmbrellone: argomenti.singleOmbre),
              );
            }
            break;

          case ConfermaEliminazioneProdottoView.routeName:
            if (argomenti is SingleProdottoViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaEliminazioneProdottoView.routeName),
                builder: (_) => ConfermaEliminazioneProdottoView(
                    singleProdotto: argomenti.singleProdotto),
              );
            }
            break;

          case AllEventiView.routeName:
            return MaterialPageRoute(
              builder: (_) => AllEventiView(),
              settings: const RouteSettings(name: AllEventiView.routeName),
            );
            break;

          case AllAttrezzatureView.routeName:
            return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AllAttrezzatureView.routeName),
                builder: (_) => AllAttrezzatureView());

            break;

          case SceltaSpecificheAttrezzatureView.routeName:
            return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaSpecificheAttrezzatureView.routeName),
                builder: (_) => SceltaSpecificheAttrezzatureView());
            break;

          case RiepilogoAttrezzaturaView.routeName:
            if (argomenti is ModificaAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoAttrezzaturaView.routeName),
                builder: (_) => RiepilogoAttrezzaturaView(
                    nome: argomenti.nome, quantita: argomenti.quantita),
              );
            }
            break;

          case AddAttrezzaturaView.routeName:
            if (argomenti is ModificaAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AddAttrezzaturaView.routeName),
                builder: (_) => AddAttrezzaturaView(
                    nome: argomenti.nome, quantita: argomenti.quantita),
              );
            }
            break;

          case SingleAttrezzaturaView.routeName:
            if (argomenti is SingleAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SingleAttrezzaturaView.routeName),
                builder: (_) => SingleAttrezzaturaView(
                    singleAttrezzatura: argomenti.attrezzatura),
              );
            }
            break;

          case SceltaModificheAttrezzaturaView.routeName:
            if (argomenti is SingleAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaModificheAttrezzaturaView.routeName),
                builder: (_) => SceltaModificheAttrezzaturaView(
                    singleAttrezzatura: argomenti.attrezzatura),
              );
            }
            break;

          case RiepilogoModificheAttrezzaturaView.routeName:
            if (argomenti is ModificaAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoModificheAttrezzaturaView.routeName),
                builder: (_) => RiepilogoModificheAttrezzaturaView(
                    nome: argomenti.nome, newQuantita: argomenti.quantita),
              );
            }
            break;

          case ModificaAttrezzaturaView.routeName:
            if (argomenti is ModificaAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ModificaAttrezzaturaView.routeName),
                builder: (_) => ModificaAttrezzaturaView(
                    nome: argomenti.nome, newQuantita: argomenti.quantita),
              );
            }
            break;

          case ConfermaEliminazioneAttrezzaturaView.routeName:
            if (argomenti is SingleAttrezzaturaViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaEliminazioneAttrezzaturaView.routeName),
                builder: (_) => ConfermaEliminazioneAttrezzaturaView(
                    singleAttrezzatura: argomenti.attrezzatura),
              );
            }
            break;

          case EliminaAttrezzaturaView.routeName:
            if (argomenti is AttrezzaturaNomeArg) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: EliminaAttrezzaturaView.routeName),
                builder: (_) => EliminaAttrezzaturaView(nome: argomenti.nome),
              );
            }

            break;

          case SingleEventoView.routeName:
            if (argomenti is SingleEventoViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: SingleEventoView.routeName),
                builder: (_) =>
                    SingleEventoView(singleEvento: argomenti.singleEvento),
              );
            }
            break;

          case IscrizioneAdEventoView.routeName:
            if (argomenti is IscrizioneEventoViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: IscrizioneAdEventoView.routeName),
                builder: (_) => IscrizioneAdEventoView(
                    idUtente: argomenti.idUtente, idEvento: argomenti.idEvento),
              );
            }
            break;

          case AllEventiAderitiView.routeName:
            if (argomenti is UtenteStringArg) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AllEventiAderitiView.routeName),
                builder: (_) =>
                    AllEventiAderitiView(idUtente: argomenti.idUtente),
              );
            }
            break;

          case SceltaNomeEPartecipantiView.routeName:
            return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SceltaNomeEPartecipantiView.routeName),
                builder: (_) => SceltaNomeEPartecipantiView());
            break;

          case SceltaDataEventoView.routeName:
            if (argomenti is SceltaDataEventoArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SceltaDataEventoView.routeName),
                builder: (_) => SceltaDataEventoView(
                    nome: argomenti.nome,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case SceltaOrarioEventoView.routeName:
            if (argomenti is SceltaOrarioEventoArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SceltaOrarioEventoView.routeName),
                builder: (_) => SceltaOrarioEventoView(
                    nome: argomenti.nome,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti,
                    data: argomenti.data),
              );
            }
            break;

          case RiepilogoEventoView.routeName:
            if (argomenti is AddEventoArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: RiepilogoEventoView.routeName),
                builder: (_) => RiepilogoEventoView(
                    nome: argomenti.nome,
                    data: argomenti.data,
                    orarioInizio: argomenti.orarioInizio,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case AddEventoView.routeName:
            if (argomenti is AddEventoArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: AddEventoView.routeName),
                builder: (_) => AddEventoView(
                    nome: argomenti.nome,
                    data: argomenti.data,
                    orarioInizio: argomenti.orarioInizio,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case ModificaPartecipantiEventoView.routeName:
            if (argomenti is ModificaPartecipantiEventoArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ModificaPartecipantiEventoView.routeName),
                builder: (_) => ModificaPartecipantiEventoView(
                  idEvento: argomenti.idEvento,
                ),
              );
            }
            break;

          case ModificaDataEventoView.routeName:
            if (argomenti is ModificaDataEventoArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaDataEventoView.routeName),
                builder: (_) => ModificaDataEventoView(
                    idEvento: argomenti.idEvento,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case ModificaOrarioEventoView.routeName:
            if (argomenti is ModificaOrarioEventoArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ModificaOrarioEventoView.routeName),
                builder: (_) => ModificaOrarioEventoView(
                    idEvento: argomenti.idEvento,
                    data: argomenti.data,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case RiepilogoModificaEventoView.routeName:
            if (argomenti is ModificaEventoArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoModificaEventoView.routeName),
                builder: (_) => RiepilogoModificaEventoView(
                    idEvento: argomenti.idEvento,
                    data: argomenti.data,
                    orarioInizio: argomenti.orarioInizio,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case ModificaEventoView.routeName:
            if (argomenti is ModificaEventoArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaEventoView.routeName),
                builder: (_) => ModificaEventoView(
                    idEvento: argomenti.idEvento,
                    data: argomenti.data,
                    orarioInizio: argomenti.orarioInizio,
                    numeroMaxPartecipanti: argomenti.numeroMaxPartecipanti),
              );
            }
            break;

          case ConfermaEliminazioneEventoView.routeName:
            if (argomenti is SingleEventoViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaEliminazioneEventoView.routeName),
                builder: (_) => ConfermaEliminazioneEventoView(
                    singleEvento: argomenti.singleEvento),
              );
            }
            break;

          case EventoEliminatoView.routeName:
            if (argomenti is SingleEventoViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: EventoEliminatoView.routeName),
                builder: (_) =>
                    EventoEliminatoView(singleEvento: argomenti.singleEvento),
              );
            }
            break;

          case AllStruttureView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(name: AllStruttureView.routeName),
              builder: (_) => AllStruttureView(),
            );
            break;

          case SceltaParametriStrutturaView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(
                  name: SceltaParametriStrutturaView.routeName),
              builder: (_) => SceltaParametriStrutturaView(),
            );
            break;

          case RiepilogoStrutturaView.routeName:
            if (argomenti is AddStrutturaArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: RiepilogoStrutturaView.routeName),
                builder: (_) => RiepilogoStrutturaView(
                    nome: argomenti.nome, stato: argomenti.stato),
              );
            }
            break;

          case AddStrutturaView.routeName:
            if (argomenti is AddStrutturaArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: AddStrutturaView.routeName),
                builder: (_) => AddStrutturaView(
                    nome: argomenti.nome, stato: argomenti.stato),
              );
            }
            break;

          case SingleStrutturaView.routeName:
            if (argomenti is SingleStrutturaArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: SingleStrutturaView.routeName),
                builder: (_) => SingleStrutturaView(
                    singleStruttura: argomenti.singleStruttura),
              );
            }
            break;

          case ModificaParametriStrutturaView.routeName:
            if (argomenti is ModificaParametriStrutturaArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ModificaParametriStrutturaView.routeName),
                builder: (_) => ModificaParametriStrutturaView(
                    idStruttura: argomenti.idStruttura),
              );
            }
            break;

          case RiepilogoModificaStrutturaView.routeName:
            if (argomenti is ModificaStrutturaArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: RiepilogoModificaStrutturaView.routeName),
                builder: (_) => RiepilogoModificaStrutturaView(
                    idStruttura: argomenti.idStruttura,
                    nome: argomenti.nome,
                    stato: argomenti.stato),
              );
            }
            break;

          case ModificaStrutturaView.routeName:
            if (argomenti is ModificaStrutturaArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaStrutturaView.routeName),
                builder: (_) => ModificaStrutturaView(
                    idStruttura: argomenti.idStruttura,
                    nome: argomenti.nome,
                    stato: argomenti.stato),
              );
            }
            break;

          case ConfermaEliminazioneStrutturaView.routeName:
            if (argomenti is SingleStrutturaArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaEliminazioneStrutturaView.routeName),
                builder: (_) => ConfermaEliminazioneStrutturaView(
                    singleStruttura: argomenti.singleStruttura),
              );
            }
            break;

          case EliminaStrutturaView.routeName:
            if (argomenti is SingleStrutturaArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: EliminaStrutturaView.routeName),
                builder: (_) => EliminaStrutturaView(
                    singleStruttura: argomenti.singleStruttura),
              );
            }
            break;

          case AllUtentiView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(name: AllUtentiView.routeName),
              builder: (_) => AllUtentiView(),
            );
            break;

          case SingleUtenteView.routeName:
            if (argomenti is SingleUtenteArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: SingleUtenteView.routeName),
                builder: (_) =>
                    SingleUtenteView(singleUtente: argomenti.singleUtente),
              );
            }
            break;

          case ScritturaMessaggioView.routeName:
            if (argomenti is SingleUtenteArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ScritturaMessaggioView.routeName),
                builder: (_) => ScritturaMessaggioView(
                    singleUtente: argomenti.singleUtente),
              );
            }
            break;

          case ConfermaInvioMessaggioView.routeName:
            if (argomenti is ConfermaInvioArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: ConfermaInvioMessaggioView.routeName),
                builder: (_) => ConfermaInvioMessaggioView(
                    singleUtente: argomenti.singleUtente,
                    titolo: argomenti.titolo,
                    descrizione: argomenti.descrizione),
              );
            }
            break;

          case MessaggioInviatoView.routeName:
            if (argomenti is ConfermaInvioArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: MessaggioInviatoView.routeName),
                builder: (_) => MessaggioInviatoView(
                    singleUtente: argomenti.singleUtente,
                    titolo: argomenti.titolo,
                    descrizione: argomenti.descrizione),
              );
            }
            break;

          case AllNotificheView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(name: AllNotificheView.routeName),
              builder: (_) => AllNotificheView(),
            );
            break;

          case AllPrenotazioniUtenteView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(
                  name: AllPrenotazioniUtenteView.routeName),
              builder: (_) => AllPrenotazioniUtenteView(),
            );
            break;

          case SinglePrenotazioneUtenteView.routeName:
            if (argomenti is SinglePrenotazioneViewArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SinglePrenotazioneUtenteView.routeName),
                builder: (_) => SinglePrenotazioneUtenteView(
                    singlePrenotazione: argomenti.prenotazione1),
              );
            }
            break;

          case SingleOrdineView.routeName:
            if (argomenti is SingleOrdineArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: SingleOrdineView.routeName),
                builder: (_) =>
                    SingleOrdineView(singleOrdine: argomenti.singleOrdine),
              );
            }
            break;

          case GestisceOrdineView.routeName:
            if (argomenti is SingleOrdineArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: GestisceOrdineView.routeName),
                builder: (_) =>
                    GestisceOrdineView(singleOrdine: argomenti.singleOrdine),
              );
            }
            break;

          case ChiudeOrdineView.routeName:
            if (argomenti is SingleOrdineArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: ChiudeOrdineView.routeName),
                builder: (_) =>
                    ChiudeOrdineView(singleOrdine: argomenti.singleOrdine),
              );
            }
            break;

          case AllPromozioniGestoreView.routeName:
            return MaterialPageRoute(
              settings:
                  const RouteSettings(name: AllPromozioniGestoreView.routeName),
              builder: (_) => AllPromozioniGestoreView(),
            );
            break;

          case SceltaSpecifichePromozioneView.routeName:
            return MaterialPageRoute(
              settings: const RouteSettings(
                  name: SceltaSpecifichePromozioneView.routeName),
              builder: (_) => SceltaSpecifichePromozioneView(),
            );
            break;

          case AddPromozioneView.routeName:
            if (argomenti is AddPromozioneArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: AddPromozioneView.routeName),
                builder: (_) => AddPromozioneView(
                    idProdotto: argomenti.idProdotto,
                    newPrezzo: argomenti.newPrezzo),
              );
            }
            break;
          case SinglePromozioneGestoreView.routeName:
            if (argomenti is SinglePromozioneArgs) {
              return MaterialPageRoute(
                settings: const RouteSettings(
                    name: SinglePromozioneGestoreView.routeName),
                builder: (_) => SinglePromozioneGestoreView(
                    singlePromozione: argomenti.singlePromozione),
              );
            }
            break;

          case AllPromozioniUtenteView.routeName:
            return MaterialPageRoute(
              settings:
                  const RouteSettings(name: AllPromozioniUtenteView.routeName),
              builder: (_) => AllPromozioniUtenteView(),
            );
            break;

          case ModificaPromozioneView.routeName:
            if (argomenti is ModificaPromozioneViewArgs) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: ModificaProdottoView.routeName),
                builder: (_) => ModificaProdottoView(
                    nome: argomenti.idPromozione,
                    newPrezzo: argomenti.newPrezzo),
              );
            }
            break;

          case EliminaPromozioneView.routeName:
            if (argomenti is PromozioneIdArg) {
              return MaterialPageRoute(
                settings:
                    const RouteSettings(name: EliminaPromozioneView.routeName),
                builder: (_) =>
                    EliminaPromozioneView(idPromozione: argomenti.idPromozione),
              );
            }

            break;
        }
      },
      initialRoute: HomePage.routeName,
    );
  }
}
