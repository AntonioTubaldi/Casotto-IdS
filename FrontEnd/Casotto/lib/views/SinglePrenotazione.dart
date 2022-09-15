import 'package:casotto/arguments/SinglePrenotazioneViewArgs.dart';
import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:casotto/models/Utente.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/PrenotazioneConfermata.dart';
import 'package:casotto/views/PrenotazioneEliminata.dart';
import 'package:casotto/widgets/SelectableSlotDataTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/UtenteService.dart';
import 'MessageScreen.dart';
import 'RiepilogoPrenotazione.dart';

class SinglePrenotazioneView extends StatelessWidget {
  const SinglePrenotazioneView({Key? key, required this.singlePrenotazione})
      : super(key: key);

  final Prenotazione singlePrenotazione;
  static const String routeName = "SinglePrenotazione";

  List<Widget> _getSlotDataTabs(List<SlotData> disponibilita) {
    return disponibilita.map((SlotData dateTime) {
      return SelectableSlotDataTab(
        child: dateTime,
        isActivated: true,
        onPressed: null,
      );
    }).toList();
  }

  Widget _getScrollableView(List<SlotData> disponibilita) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getSlotDataTabs(disponibilita),
      ),
    );
  }

  List<Widget> _confermaOEliminaButton(BuildContext context) {
    if (singlePrenotazione.getStatoPrenotazioneString() == "APERTA") {
      return <Widget>[
        ElevatedButton(
          onPressed: () => {
            Navigator.pushNamedAndRemoveUntil(
              context,
              PrenotazioneConfermataView.routeName,
              arguments: SinglePrenotazioneViewArgs(singlePrenotazione),
              ModalRoute.withName(HomePage.routeName),
            ),
          },
          child: Text("CONFERMA"),
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomePage.routeName,
              arguments: const HomePage(),
              ModalRoute.withName(HomePage.routeName),
            ),
          },
          child: Text("ANNULLA"),
        )
      ];
    } else
      return <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              PrenotazioneEliminataView.routeName,
              arguments: SinglePrenotazioneViewArgs(singlePrenotazione),
              ModalRoute.withName(HomePage.routeName),
            );
          },
          child: Text("ELIMINA"),
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomePage.routeName,
              arguments: const HomePage(),
              ModalRoute.withName(HomePage.routeName),
            ),
          },
          child: Text("ANNULLA"),
        )
      ];
  }

  @override
  Widget build(BuildContext context) {
    UtenteService utenteService = new UtenteService();

    return FutureBuilder<Utente>(
        future: utenteService.getUtenteById(singlePrenotazione.getIdUtente()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const MessageScreen(status: MessageScreenStatus.LOADING);
            case ConnectionState.none:
              return const MessageScreen(status: MessageScreenStatus.ERROR);
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const MessageScreen(status: MessageScreenStatus.ERROR);
              } else if (snapshot.hasData) {
                return Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _confermaOEliminaButton(context)),
                  ),
                  appBar: AppBar(title: Text("La prenotazione nel dettaglio")),
                  body: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Ombrellone prenotato: " +
                                singlePrenotazione.getIdOmbrellone())),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Prenotazione: " +
                                singlePrenotazione.getIdPrenotazione())),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Utente associato: " +
                                snapshot.data!.getNome())),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("CostoTotale: " +
                              singlePrenotazione.getCostoTotale().toString()),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Stato Prenotazione: " +
                              singlePrenotazione.getStatoPrenotazioneString()),
                        ),
                        _getScrollableView(
                            singlePrenotazione.getDataPrenotazione()),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Numero Lettini: " +
                              singlePrenotazione.getNumeroLettini().toString()),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Numero Sdraio: " +
                              singlePrenotazione.getNumeroSdraio().toString()),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const MessageScreen(status: MessageScreenStatus.ERROR);
          }
        });
  }
}
