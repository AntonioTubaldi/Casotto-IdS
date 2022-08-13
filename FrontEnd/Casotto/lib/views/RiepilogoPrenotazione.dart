import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/views/AddPrenotazione.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/widgets/SelectableSlotDataTab.dart';
import 'package:flutter/material.dart';

import '../models/Giorno.dart';
import '../models/Ombrellone.dart';
import '../models/SlotData.dart';

class RiepilogoPrenotazioneView extends StatelessWidget {
  const RiepilogoPrenotazioneView(
      {Key? key,
      required this.selezionati,
      required this.singleOmbrellone,
      required this.numeroLettini,
      required this.numeroSdraio})
      : super(key: key);

  static const String routeName = "RiepilogoPrenotazione";

  final List<SlotData> selezionati;
  final Ombrellone singleOmbrellone;
  final int numeroLettini;
  final int numeroSdraio;

  Widget _getRiepilogoPrenotazione(
      Ombrellone ombrellone, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Prenotazione")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Costo prenotazione: ${(ombrellone.getPrezzo() * selezionati.length) + (ombrellone.getPrezzoLettini() * numeroLettini) + (ombrellone.getPrezzoSdraio() * numeroSdraio)} euro",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            _getScrollableView(selezionati)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RawMaterialButton(
              onPressed: () => {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AddPrenotazioneView.routeName,
                  arguments: AddPrenotazioneViewArgs(
                      "123",
                      singleOmbrellone.getIdOmbrellone(),
                      selezionati,
                      numeroLettini,
                      numeroSdraio),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: Text("Conferma Prenotazione",
                  style: TextStyle(color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 205),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Torna alla Home",
                style: TextStyle(color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
            ),
          ],
        ),
      ),
    );
  }

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
    return _getRiepilogoPrenotazione(singleOmbrellone, context);
  }
}
