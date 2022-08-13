import 'package:casotto/models/Prodotto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../arguments/RiepilogoOrdinazioneViewArgs.dart';
import 'RiepilogoOrdinazione.dart';

class SceltaProdottiView extends StatefulWidget {
  const SceltaProdottiView
      ({Key? key,
      required this.prodotto, required this.lista,
      required this.numeroProdotti})
      : super(key: key);

  @override
  State<SceltaProdottiView> createState() => _SceltaProdottiViewState();
  final Prodotto prodotto;
  final List<Prodotto> lista;
  final int numeroProdotti;
  static const String routeName = "SceltaProdotti";
}

class _SceltaProdottiViewState extends State<SceltaProdottiView> {
  int numeroProdotti = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Schermata Ordinazione")),
    body: Container(
    width: double.infinity,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(20),
    child: Column(
    children: [
    Text("Scegli quanti prodotti acquistare: "),
    DropdownButton<int>(
    value: numeroProdotti,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(color: Colors.black),
    underline: Container(
    height: 2,
    color: Colors.teal,
    ),
    onChanged: (int? newValue) {
    setState(() {
    numeroProdotti = newValue!;
    });
    },
    items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
    return DropdownMenuItem<int>(
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
    RiepilogoOrdinazioneView.routeName,
    arguments: RiepilogoOrdinazioneViewArgs(
      widget.prodotto,
      widget.lista,
      numeroProdotti
      ),
    );
    },
    child: Text(
    "CONFERMA",
    style: TextStyle(color: Colors.white),)
    )]
    ),
    ),
    );
  }
}
