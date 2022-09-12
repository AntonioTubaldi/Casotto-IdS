import 'package:casotto/models/Promozione.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaPromozioneViewArgs.dart';
import 'HomePage.dart';
import 'ModificaPromozione.dart';

class SceltaModifichePromozioneView extends StatefulWidget {
  const SceltaModifichePromozioneView(
      {Key? key, required this.singlePromozione})
      : super(key: key);

  final Promozione singlePromozione;
  static const String routeName = "SceltaModifichePromozione";

  @override
  State<SceltaModifichePromozioneView> createState() =>
      _SceltaModifichePromozioneViewState();
}

class _SceltaModifichePromozioneViewState
    extends State<SceltaModifichePromozioneView> {
  double newPrezzo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("HOME"),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Modifica Promozione"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Prezzo originale del prodotto: " +
                widget.singlePromozione.getOriginalPrezzo().toString()),
            Text("Modifica la promozione: "),
            DropdownButton<double>(
              value: newPrezzo,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (double? newValue) {
                setState(() {
                  newPrezzo = newValue!;
                });
              },
              items: <double>[1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7]
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
                  ModificaPromozioneView.routeName,
                  arguments: ModificaPromozioneViewArgs(
                      widget.singlePromozione.getIdPromozione(), newPrezzo),
                  ModalRoute.withName(HomePage.routeName),
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
