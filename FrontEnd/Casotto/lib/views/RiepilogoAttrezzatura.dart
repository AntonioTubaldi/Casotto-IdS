import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaAttrezzaturaViewArgs.dart';
import 'AddAttrezzatura.dart';
import 'HomePage.dart';

class RiepilogoAttrezzaturaView extends StatelessWidget {
  const RiepilogoAttrezzaturaView(
      {Key? key, required this.nome, required this.quantita})
      : super(key: key);

  final String nome;
  final int quantita;
  static const String routeName = "RiepilogoAttrezzatura";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Attrezzatura")),
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
                    "Nome: ${nome}",
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
                    "Quantità: ${quantita}",
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
                  AddAttrezzaturaView.routeName,
                  arguments: ModificaAttrezzaturaViewArgs(nome, quantita),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 205),
              child: const Text(
                "Inserisci Attrezzatura",
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
