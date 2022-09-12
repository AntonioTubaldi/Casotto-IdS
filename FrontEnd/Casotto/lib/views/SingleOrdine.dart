import 'package:casotto/models/Ordine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleOrdineArgs.dart';
import 'ChiudeOrdine.dart';
import 'GestisceOrdine.dart';
import 'HomePage.dart';

class SingleOrdineView extends StatelessWidget {
  const SingleOrdineView({Key? key, required this.singleOrdine})
      : super(key: key);

  final Ordine singleOrdine;
  static const String routeName = "SingleOrdine";

  @override
  Widget build(BuildContext context) {
    if (singleOrdine.getStatoString() == "DA GESTIRE") {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Il singolo ordine"),
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
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Ombrellone: ${singleOrdine.getIdOmbrellone()}",
                    style: const TextStyle(fontSize: 20)),
                Text(
                    "Prodotti: ${singleOrdine.getListaProdottiString(singleOrdine.prodotti)}",
                    style: const TextStyle(fontSize: 20)),
                Text(
                  "Stato: ${singleOrdine.getStatoString()}",
                  style: const TextStyle(fontSize: 20),
                ),
                //children

                Padding(
                  padding: EdgeInsets.all(10),
                  child: RawMaterialButton(
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        GestisceOrdineView.routeName,
                        arguments: SingleOrdineArgs(singleOrdine),
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    constraints:
                        const BoxConstraints.tightFor(height: 50.0, width: 200),
                    child: const Text(
                      "Gestisci Ordine",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else
      return Scaffold(
        appBar: AppBar(
          title: const Text("Il singolo ordine"),
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 75.0),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Text("Ombrellone: ${singleOrdine.getIdOmbrellone()}",
                            style: const TextStyle(fontSize: 20)),
                        Text(
                            "Prodotti: ${singleOrdine.getListaProdottiString(singleOrdine.prodotti)}",
                            style: const TextStyle(fontSize: 20)),
                        Text(
                          "Stato: ${singleOrdine.getStatoString()}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ] //children
                          ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ChiudeOrdineView.routeName,
                      arguments: SingleOrdineArgs(singleOrdine),
                      ModalRoute.withName(HomePage.routeName),
                    ),
                  },
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      const BoxConstraints.tightFor(height: 50.0, width: 200),
                  child: const Text(
                    "Chiudi Ordine",
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
