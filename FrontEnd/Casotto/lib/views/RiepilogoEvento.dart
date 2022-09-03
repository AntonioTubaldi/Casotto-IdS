import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddEventoArgs.dart';
import 'AddEvento.dart';
import 'HomePage.dart';

class RiepilogoEventoView extends StatefulWidget {
  const RiepilogoEventoView(
      {Key? key,
      required this.nome,
      required this.numeroMaxPartecipanti,
      required this.data,
      required this.orarioInizio})
      : super(key: key);

  final String nome;
  final int numeroMaxPartecipanti;
  final DateTime data;
  final TimeOfDay orarioInizio;

  static const String routeName = "RiepilogoEvento";

  @override
  State<RiepilogoEventoView> createState() => _RiepilogoEventoViewState();
}

class _RiepilogoEventoViewState extends State<RiepilogoEventoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Evento")),
      body: Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Nome: ${widget.nome}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Data: ${widget.data}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Orario di inizio: ${widget.orarioInizio}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Numero massimo di partecipanti: ${widget.numeroMaxPartecipanti}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
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
                  AddEventoView.routeName,
                  arguments: AddEventoArgs(widget.nome, widget.data,
                      widget.orarioInizio, widget.numeroMaxPartecipanti),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 205),
              child: const Text(
                "Conferma Evento",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  arguments: const HomePage(),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
              child: const Text(
                "Torna alla Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
