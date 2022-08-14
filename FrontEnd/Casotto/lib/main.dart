import 'package:casotto/arguments/AddOmbrelloneViewArgs.dart';
import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/AddProdottoViewArgs.dart';
import 'package:casotto/arguments/OmbrelloneStringArg.dart';
import 'package:casotto/arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/SingleOmbrelloneViewArgs.dart';
import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/views/AddProdotto.dart';
import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/Menu.dart';
import 'package:casotto/views/ModificaOmbrellone.dart';
import 'package:casotto/views/ModificaProdotto.dart';
import 'package:casotto/views/PrenotazioneConfermata.dart';
import 'package:casotto/views/PrenotazioneEliminata.dart';
import 'package:casotto/views/ProdottiSelezionabili.dart';
import 'package:casotto/views/ProdottoEliminato.dart';
import 'package:casotto/views/RiepilogoOrdinazione.dart';
import 'package:casotto/views/RiepilogoPrenotazione.dart';
import 'package:casotto/views/RimuoviOmbrellone.dart';
import 'package:casotto/views/SceltaLettini.dart';
import 'package:casotto/views/SceltaModificheOmbrellone.dart';
import 'package:casotto/views/SceltaPrezzoProdotto.dart';
import 'package:casotto/views/SceltaSpecificheOmb.dart';
import 'package:casotto/views/SceltaSpecificheProdotto.dart';
import 'package:casotto/views/SingleOmbrellone.dart';
import 'package:casotto/views/SinglePrenotazione.dart';
import 'package:casotto/views/SingleProdotto.dart';
import 'package:casotto/views/addOmbrellone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'arguments/AllPrenotazioniViewArgs.dart';
import 'arguments/ModificaProdottoViewArgs.dart';
import 'arguments/ProdottiSelezionabiliArgs.dart';
import 'arguments/ProdottoStringArgs.dart';
import 'arguments/SceltaLettiniViewArgs.dart';
import 'arguments/SceltaModificheOmbrelloneViewArgs.dart';
import 'arguments/SinglePrenotazioneViewArgs.dart';
import 'arguments/SingleProdottoViewArgs.dart';
import 'views/AddPrenotazione.dart';

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
        }
      },
      initialRoute: HomePage.routeName,
    );
  }
}
