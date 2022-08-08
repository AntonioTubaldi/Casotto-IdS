import 'package:casotto/views/addOmbrellone.dart';
import 'package:flutter/material.dart';

import '../arguments/AddOmbrelloneViewArgs.dart';

class SceltaSpecificheOmbView extends StatefulWidget {
  const SceltaSpecificheOmbView({Key? key}) : super(key: key);

  static const String routeName = "SceltaSpecificheOmb";

  @override
  State<SceltaSpecificheOmbView> createState() =>
      _SceltaSpecificheOmbViewState();
}

class _SceltaSpecificheOmbViewState extends State<SceltaSpecificheOmbView> {
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
          title: const Text("Ombrellone Manager")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Imposta il prezzo: "),
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
            Text("Scegli la fila: "),
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
            Text("Imposta il prezzo dei lettini: "),
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
            Text("Imposta il prezzo delle sdraio: "),
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
                Navigator.pushNamed(
                  context,
                  AddOmbrelloneView.routeName,
                  arguments: AddOmbrelloneViewArgs(
                      prezzo, posizione, prezzoLettini, prezzoSdraio),
                );
              },
              child: Text(
                "CONFERMA",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
