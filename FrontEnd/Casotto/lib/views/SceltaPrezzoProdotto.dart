import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaProdottoViewArgs.dart';
import 'HomePage.dart';
import 'ModificaProdotto.dart';

class SceltaPrezzoProdottoView extends StatefulWidget {
  const SceltaPrezzoProdottoView({Key? key, required this.nome})
      : super(key: key);

  final String nome;

  static const String routeName = "SceltaPrezzoProdotto";

  @override
  State<SceltaPrezzoProdottoView> createState() =>
      _SceltaPrezzoProdottoViewState();
}

class _SceltaPrezzoProdottoViewState extends State<SceltaPrezzoProdottoView> {
  double prezzo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Modifica Prezzo Prodotto")),
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
              items: <double>[1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
                  .map<DropdownMenuItem<double>>(
                (double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text(value.toString()),
                  );
                },
              ).toList(),
            ),
            RawMaterialButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
              constraints: const BoxConstraints.expand(width: 100, height: 30),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ModificaProdottoView.routeName,
                  arguments: ModificaProdottoViewArgs(widget.nome, prezzo),
                );
              },
              child: const Text(
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  arguments: const HomePage(),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: const Text(
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
