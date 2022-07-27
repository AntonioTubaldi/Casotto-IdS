import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'package:casotto/arguments/SingleOmbrelloneViewArgs.dart';
import 'package:casotto/views/AllOmbrelloni.dart';
import 'package:casotto/views/AllPrenotazioni.dart';
import 'package:casotto/views/Calendar.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/PrenotazioneConfermata.dart';
import 'package:casotto/views/PrenotazioneEliminata.dart';
import 'package:casotto/views/RiepilogoPrenotazione.dart';
import 'package:casotto/views/SingleOmbrellone.dart';
import 'package:casotto/views/SinglePrenotazione.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'arguments/AllPrenotazioniViewArgs.dart';
import 'arguments/SinglePrenotazioneViewArgs.dart';
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
                    singleOmbrellone: argomenti.ombrellone1),
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
                    dataPrenotazione: argomenti.dataPrenotazione),
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
        }
      },
      initialRoute: HomePage.routeName,
    );
  }
}
