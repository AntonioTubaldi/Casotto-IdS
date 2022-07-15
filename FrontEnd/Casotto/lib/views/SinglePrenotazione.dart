import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:casotto/widgets/SelectableSlotDataTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RiepilogoPrenotazione.dart';

class SinglePrenotazioneView extends StatefulWidget {
  const SinglePrenotazioneView({Key? key, required this.prenotazione})
      : super(key: key);
  final Prenotazione prenotazione;

  @override
  State<SinglePrenotazioneView> createState() => _SinglePrenotazioneViewState();
}

class _SinglePrenotazioneViewState extends State<SinglePrenotazioneView> {
  Set<SlotData> _datiSelezionati = Set();

  List<Widget> _getSlotDataTabs(List<SlotData> disponibilita) {
    return disponibilita.map((SlotData dateTime) {
      return SelectableSlotDataTab(
        child: dateTime,
        isActivated: _datiSelezionati.contains(dateTime),
        onPressed: () => {
          setState(
            () => {
              if (_datiSelezionati.contains(dateTime))
                {_datiSelezionati.remove(dateTime)}
              else
                {_datiSelezionati.add(dateTime)}
            },
          )
        },
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

  Widget? _confermaPrenotazione() {
    if (_datiSelezionati.isNotEmpty) {
      return Column(children: [
        ElevatedButton(
            onPressed: () => {},
            child: Text(
              "CONFERMA",
              style: TextStyle(fontSize: 30),
            )),
        ElevatedButton(
            onPressed: () => {},
            child: Text(
              "ELIMINA",
              style: TextStyle(fontSize: 30),
            ))
      ]);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _confermaPrenotazione(),
      appBar: AppBar(title: Text("Schermata Prenotazione")),
      body: Center(
        child: _getScrollableView(widget.prenotazione.getDataPrenotazione()),
      ),
    );
  }
}
