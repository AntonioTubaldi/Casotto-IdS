import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SinglePrenotazioneViewArgs.dart';
import '../models/Prenotazione.dart';
import 'HomePage.dart';
import 'PrenotazioneEliminata.dart';

class SinglePrenotazioneUtenteView extends StatelessWidget {
  const SinglePrenotazioneUtenteView(
      {Key? key, required this.singlePrenotazione})
      : super(key: key);

  final Prenotazione singlePrenotazione;
  static const String routeName = "SinglePrenotazioneUtente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("La tua prenotazione"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: RawMaterialButton(
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        constraints: const BoxConstraints.tightFor(height: 50.0, width: 110),
        child: const Text(
          "HOME",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Stato: ${singlePrenotazione.getStatoPrenotazioneString()}",
                style: const TextStyle(fontSize: 20)),
            Text(
              "Costo: ${singlePrenotazione.getCostoTotale()} Euro",
              style: const TextStyle(fontSize: 20),
            ),
            //children

            Padding(
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PrenotazioneEliminataView.routeName,
                    arguments: SinglePrenotazioneViewArgs(singlePrenotazione),
                    ModalRoute.withName(HomePage.routeName),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 250),
                child: const Text(
                  "Elimina Prenotazione",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
