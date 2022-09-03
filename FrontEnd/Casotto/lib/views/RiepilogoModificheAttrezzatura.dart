import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaAttrezzaturaViewArgs.dart';
import 'HomePage.dart';
import 'ModificaAttrezzatura.dart';

class RiepilogoModificheAttrezzaturaView extends StatelessWidget {
  const RiepilogoModificheAttrezzaturaView(
      {Key? key, required this.nome, required this.newQuantita})
      : super(key: key);

  final String nome;
  final int newQuantita;

  static const String routeName = "RiepilogoModificaAttrezzatura";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Modifiche Attrezzatura")),
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
                    "Nuova quantità: ${newQuantita}",
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
                  ModificaAttrezzaturaView.routeName,
                  arguments: ModificaAttrezzaturaViewArgs(nome, newQuantita),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 205),
              child: const Text(
                "Conferma Modifiche",
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
