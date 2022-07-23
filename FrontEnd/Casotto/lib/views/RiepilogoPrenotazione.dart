import 'package:casotto/models/ParametriPrenotazione.dart';
import 'package:casotto/views/AddPrenotazione.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/widgets/SelectableSlotDataTab.dart';
import 'package:flutter/material.dart';

import '../models/Giorno.dart';
import '../models/Ombrellone.dart';
import '../models/SlotData.dart';

class RiepilogoPrenotazioneView extends StatelessWidget {
  const RiepilogoPrenotazioneView(
      {Key? key, required this.selezionati, required this.singleOmbrellone})
      : super(key: key);

  final List<SlotData> selezionati;
  final Ombrellone singleOmbrellone;

  Widget _getRiepilogoPrenotazione(
      Ombrellone ombrellone, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Riepilogo Prenotazione")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Text("Costo prenotazione: " +
                    (ombrellone.getPrezzo() * selezionati.length).toString())),
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
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPrenotazioneView(
                      parametri: ParametriPrenotazione("123",
                          singleOmbrellone.getIdOmbrellone(), selezionati),
                    ),
                  ),
                )
              },
              child: Text("CONFERMA PRENOTAZIONE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("TORNA ALLA HOME"),
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

  /* List<Widget> _getSlotDataTabs(List<SlotData> selezionati) {
    return selezionati.map(SlotData daRitornare) {
      return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ElevatedButton(onPressed: () => {}, child: Text("Riepilogo prenotazione: " +  daRitornare.getDataString() + daRitornare.getDurataString()),),
         ElevatedButton(onPressed: () => {}, child: Text("Costo totale: 50")),
         ],
         ),

      );
    };
  }
  */

  @override
  Widget build(BuildContext context) {
    return _getRiepilogoPrenotazione(singleOmbrellone, context);
  }
}
