import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/PrenotazioneConfermata.dart';
import 'package:casotto/views/PrenotazioneEliminata.dart';
import 'package:casotto/widgets/SelectableSlotDataTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RiepilogoPrenotazione.dart';

class SinglePrenotazioneView extends StatelessWidget {
  const SinglePrenotazioneView({Key? key, required this.singlePrenotazione})
      : super(key: key);

  final Prenotazione singlePrenotazione;

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

  @override
  Widget build(BuildContext context) {
    List<Widget> _confermaOEliminaButton() {
      if (singlePrenotazione.getStatoPrenotazioneString() == "APERTA") {
        return <Widget>[
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrenotazioneConfermataView(
                            child: singlePrenotazione,
                          )))
            },
            child: Text("CONFERMA"),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text("ANNULLA"),
          )
        ];
      } else
        return <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrenotazioneEliminataView(
                            child: singlePrenotazione,
                          )));
            },
            child: Text("ELIMINA"),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text("ANNULLA"),
          )
        ];
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _confermaOEliminaButton()),
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
              child: Text(
                  "Prenotazione: " + singlePrenotazione.getIdPrenotazione())),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                  "Utente associato: " + singlePrenotazione.getIdUtente())),
          ElevatedButton(
              onPressed: () {},
              child: Text("CostoTotale: " +
                  singlePrenotazione.getCostoTotale().toString())),
          ElevatedButton(
              onPressed: () {},
              child: Text("Stato Prenotazione: " +
                  singlePrenotazione.getStatoPrenotazioneString())),
          _getScrollableView(singlePrenotazione.getDataPrenotazione()),
        ],
      )),
    );
  }
}
