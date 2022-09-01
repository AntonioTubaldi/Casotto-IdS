import 'package:casotto/arguments/IscrizioneEventoViewArgs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../arguments/ModificaPartecipantiEventoArgs.dart';
import '../arguments/SingleEventoViewArgs.dart';
import '../models/Evento.dart';
import 'ConfermaEliminazioneEvento.dart';
import 'HomePage.dart';
import 'IscrizioneAdEvento.dart';
import 'ModificaPartecipantiEvento.dart';

class SingleEventoView extends StatefulWidget {
  const SingleEventoView({Key? key, required this.singleEvento})
      : super(key: key);

  final Evento singleEvento;
  static const String routeName = "SingleEvento";

  @override
  State<SingleEventoView> createState() => _SingleEventoViewState();
}

class _SingleEventoViewState extends State<SingleEventoView> {
  Widget? _iscrizioneEvento() {
    if (widget.singleEvento.getNumeroPartecipanti() <
        widget.singleEvento.getNumeroMaxPartecipanti()) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                IscrizioneAdEventoView.routeName,
                arguments: IscrizioneEventoViewArgs(
                    "123", widget.singleEvento.getIdEvento()),
              );
            },
            child: Text(
              "Iscriviti",
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {},
            child: const Text(
              "L'evento è pieno",
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          _iscrizioneEvento()!,
          Padding(
            padding: const EdgeInsets.all(5),
            child: RawMaterialButton(
              onPressed: () => {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: const Text("Home",
                  style: TextStyle(fontSize: 19, color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 150),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Riepilogo Evento"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(widget.singleEvento.getNome()),
                  Text(widget.singleEvento.getDataString()),
                  Text(widget.singleEvento.getOrarioInizioString()),
                  Text(widget.singleEvento.getNumeroPartecipanti().toString()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamed(
                    context,
                    ConfermaEliminazioneEventoView.routeName,
                    arguments: SingleEventoViewArgs(
                      widget.singleEvento,
                    ),
                  ),
                },
                child: const Text("Elimina Evento",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                constraints: BoxConstraints.tightFor(height: 50.0, width: 200),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamed(
                    context,
                    ModificaPartecipantiEventoView.routeName,
                    arguments: ModificaPartecipantiEventoArgs(
                      widget.singleEvento.getIdEvento(),
                    ),
                  ),
                },
                child: const Text("Modifica Evento",
                    style: TextStyle(fontSize: 19, color: Colors.white)),
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                constraints: BoxConstraints.tightFor(height: 50.0, width: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
