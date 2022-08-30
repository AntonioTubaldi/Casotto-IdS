import 'package:casotto/models/Attrezzatura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaAttrezzaturaViewArgs.dart';
import 'HomePage.dart';
import 'ModificaAttrezzatura.dart';

class SceltaModificheAttrezzaturaView extends StatefulWidget {
  const SceltaModificheAttrezzaturaView(
      {Key? key, required this.singleAttrezzatura})
      : super(key: key);

  final Attrezzatura singleAttrezzatura;

  static const String routeName = "SceltaModificheAttrezzatura";

  @override
  State<SceltaModificheAttrezzaturaView> createState() =>
      _SceltaModificheAttrezzaturaViewState();
}

class _SceltaModificheAttrezzaturaViewState
    extends State<SceltaModificheAttrezzaturaView> {
  int quantita = 1;

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
            Text("Modifica la quantita disponibile: "),
            DropdownButton<int>(
              value: quantita,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  quantita = newValue!;
                });
              },
              items: <int>[1, 2, 3, 4, 5, 6]
                  .map<DropdownMenuItem<int>>((int value) {
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ModificaAttrezzaturaView.routeName,
                  arguments: ModificaAttrezzaturaViewArgs(
                      widget.singleAttrezzatura.getNome(), quantita),
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
