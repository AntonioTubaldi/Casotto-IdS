import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SceltaModificheOmbrelloneViewArgs.dart';
import 'HomePage.dart';
import 'ModificaOmbrellone.dart';

class SceltaModificheOmbrelloneView extends StatefulWidget {
  const SceltaModificheOmbrelloneView(
      {Key? key,
      required this.idOmbrellone,
      required this.prezzo,
      required this.posizione,
      required this.prezzoLettini,
      required this.prezzoSdraio})
      : super(key: key);

  final String idOmbrellone;
  final double prezzo;
  final int posizione;
  final double prezzoLettini;
  final double prezzoSdraio;

  static const String routeName = "SceltaModificheOmb";

  @override
  State<SceltaModificheOmbrelloneView> createState() =>
      _SceltaModificheOmbrelloneViewState();
}

class _SceltaModificheOmbrelloneViewState
    extends State<SceltaModificheOmbrelloneView> {
  double prezzo = 10;
  int posizione = 1;
  double prezzoLettini = 1;
  double prezzoSdraio = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Modifica Ombrellone")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Modifica il prezzo: "),
            DropdownButton<double>(
              value: prezzo,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (double? newValue) {
                setState(() {
                  prezzo = newValue!;
                });
              },
              items: <double>[10, 20, 30, 40]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            Text("Modifica la fila: "),
            DropdownButton<int>(
              value: posizione,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  posizione = newValue!;
                });
              },
              items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            Text("Modifica il prezzo dei lettini: "),
            DropdownButton<double>(
              value: prezzoLettini,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (double? newValue) {
                setState(() {
                  prezzoLettini = newValue!;
                });
              },
              items: <double>[1, 2, 2.5, 3]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            Text("Modifica il prezzo delle sdraio: "),
            DropdownButton<double>(
              value: prezzoSdraio,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (double? newValue) {
                setState(() {
                  prezzoSdraio = newValue!;
                });
              },
              items: <double>[1, 1.5, 2, 2.5]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            RawMaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
              constraints: BoxConstraints.expand(width: 100, height: 30),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ModificaOmbrelloneView.routeName,
                  arguments: SceltaModificheOmbrelloneViewArgs(
                      widget.idOmbrellone,
                      prezzo,
                      posizione,
                      prezzoLettini,
                      prezzoSdraio),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "CONFERMA",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RawMaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
              constraints: BoxConstraints.expand(width: 100, height: 30),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "HOME",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
