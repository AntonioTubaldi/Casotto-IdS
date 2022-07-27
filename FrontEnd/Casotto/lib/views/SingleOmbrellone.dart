import 'package:casotto/arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/RiepilogoPrenotazione.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../models/Ombrellone.dart';
import '../models/SlotData.dart';
import '../widgets/SelectableSlotDataTab.dart';

class SingleOmbrelloneView extends StatefulWidget {
  const SingleOmbrelloneView({Key? key, required this.ombrellone})
      : super(key: key);
  final Ombrellone ombrellone;

  static const String routeName = "SingleOmbrellone";

  @override
  State<SingleOmbrelloneView> createState() => _SingleOmbrelloneViewState();
}

class _SingleOmbrelloneViewState extends State<SingleOmbrelloneView> {
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

  Widget? _showPrenotazione() {
    if (_datiSelezionati.isNotEmpty) {
      return ElevatedButton(
          onPressed: () => {
                Navigator.pushNamed(
                  context,
                  RiepilogoPrenotazioneView.routeName,
                  arguments: RiepilogoPrenotazioneViewArgs(
                      widget.ombrellone, _datiSelezionati.toList()),
                ),
              },
          child: Text(
            "PRENOTA",
            style: TextStyle(fontSize: 30),
          ));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ombrellone.getDisponibilita().isNotEmpty) {
      return Scaffold(
        floatingActionButton: _showPrenotazione(),
        appBar: AppBar(title: Text("Schermata Prenotazione")),
        body: Center(
          child: _getScrollableView(widget.ombrellone.getDisponibilita()),
        ),
      );
    } else
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.popUntil(
              context,
              ModalRoute.withName(HomePage.routeName),
            ),
          },
          child: Text(
            "H",
            style: TextStyle(fontSize: 30),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Schermata Prenotazione"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
                "Non ci sono date disponibili per l'ombrellone selezionato"),
          ),
        ),
      );
  }
}
