import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../arguments/RiepilogoPrenotazioneViewArgs.dart';
import 'RiepilogoPrenotazione.dart';

class SceltaLettiniView extends StatefulWidget {
  const SceltaLettiniView(
      {Key? key, required this.selezionati, required this.singleOmbrellone})
      : super(key: key);
  final List<SlotData> selezionati;
  final Ombrellone singleOmbrellone;
  static const String routeName = "SceltaLettini";

  @override
  State<SceltaLettiniView> createState() => _SceltaLettiniViewState();
}

class _SceltaLettiniViewState extends State<SceltaLettiniView> {
  int numeroLettini = 1;
  int numeroSdraio = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Riepilogo Prenotazione")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Scegli quanti lettini prenotare: "),
            DropdownButton<int>(
              value: numeroLettini,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  numeroLettini = newValue!;
                });
              },
              items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            Text("Scegli quante sdraio prenotare: "),
            DropdownButton<int>(
              value: numeroSdraio,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  numeroSdraio = newValue!;
                });
              },
              items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RiepilogoPrenotazioneView.routeName,
                  arguments: RiepilogoPrenotazioneViewArgs(
                      widget.singleOmbrellone,
                      widget.selezionati,
                      numeroLettini,
                      numeroSdraio),
                );
              },
              child: Text("CONFERMA"),
            ),
          ],
        ),
      ),
    );
  }
}
