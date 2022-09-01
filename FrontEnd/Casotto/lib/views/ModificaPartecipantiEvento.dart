import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaDataEventoArgs.dart';
import 'HomePage.dart';
import 'ModificaDataEvento.dart';

class ModificaPartecipantiEventoView extends StatefulWidget {
  const ModificaPartecipantiEventoView({Key? key, required this.idEvento})
      : super(key: key);

  final String idEvento;

  static const String routeName = "ModificaPartecipantiEvento";

  @override
  State<ModificaPartecipantiEventoView> createState() =>
      _ModificaPartecipantiEventoViewState();
}

class _ModificaPartecipantiEventoViewState
    extends State<ModificaPartecipantiEventoView> {
  int numeroMaxPartecipanti = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Modifica un Evento"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Inserisci un limite di partecipanti"),
            const Text("(o seleziona 999 per non impostarlo): "),
            DropdownButton<int>(
              value: numeroMaxPartecipanti,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  numeroMaxPartecipanti = newValue!;
                });
              },
              items: <int>[2, 5, 10, 15, 20, 999]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ModificaDataEventoView.routeName,
                  arguments: ModificaDataEventoArgs(
                      widget.idEvento, numeroMaxPartecipanti),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Avanti",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints.tightFor(height: 35.0, width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
