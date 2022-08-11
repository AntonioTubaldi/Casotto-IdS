import 'package:casotto/arguments/OmbrelloneStringArg.dart';
import 'package:casotto/arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/RiepilogoPrenotazione.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../arguments/SceltaLettiniViewArgs.dart';
import '../arguments/SceltaModificheOmbrelloneViewArgs.dart';
import '../models/Ombrellone.dart';
import '../models/SlotData.dart';
import '../widgets/SelectableSlotDataTab.dart';
import 'RimuoviOmbrellone.dart';
import 'SceltaLettini.dart';
import 'SceltaModificheOmbrellone.dart';
import 'SceltaSpecificheOmb.dart';

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
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () => {
              Navigator.pushNamed(
                context,
                SceltaLettiniView.routeName,
                arguments: SceltaLettiniViewArgs(
                    widget.ombrellone, _datiSelezionati.toList()),
              ),
            },
            child: Text(
              "PRENOTA",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            fillColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
          ),
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ombrellone.getDisponibilita().isNotEmpty) {
      return Scaffold(
        floatingActionButton: _showPrenotazione(),
        appBar: AppBar(
          title: Text("Schermata Prenotazione"),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            children: [
              _getScrollableView(widget.ombrellone.getDisponibilita()),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      RimuoviOmbrelloneView.routeName,
                      arguments: OmbrelloneStringArg(
                          widget.ombrellone.getIdOmbrellone()),
                    ),
                  },
                  child: const Text("Elimina Ombrellone",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      SceltaModificheOmbrelloneView.routeName,
                      arguments: SceltaModificheOmbrelloneViewArgs(
                        widget.ombrellone.getIdOmbrellone(),
                        widget.ombrellone.getPrezzo(),
                        widget.ombrellone.getPosizione(),
                        widget.ombrellone.getPrezzoLettini(),
                        widget.ombrellone.getPrezzoSdraio(),
                      ),
                    ),
                  },
                  child: const Text("Modifica Ombrellone",
                      style: TextStyle(fontSize: 19, color: Colors.white)),
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  constraints:
                      BoxConstraints.tightFor(height: 50.0, width: 200),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        floatingActionButton: Row(
          children: [
            RawMaterialButton(
              onPressed: () => {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: const Text("Home",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 130),
            ),
            RawMaterialButton(
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  RimuoviOmbrelloneView.routeName,
                  arguments:
                      OmbrelloneStringArg(widget.ombrellone.getIdOmbrellone()),
                ),
              },
              child: const Text("Home",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 130),
            ),
          ],
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
}
