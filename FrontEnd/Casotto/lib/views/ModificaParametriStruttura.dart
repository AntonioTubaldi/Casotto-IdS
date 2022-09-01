import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaStrutturaArgs.dart';
import '../models/StatoStruttura.dart';
import 'HomePage.dart';
import 'ModificaStruttura.dart';

class ModificaParametriStrutturaView extends StatefulWidget {
  const ModificaParametriStrutturaView({Key? key, required this.idStruttura})
      : super(key: key);

  final String idStruttura;
  static const String routeName = "ModificaParametriStruttura";

  @override
  State<ModificaParametriStrutturaView> createState() =>
      _ModificaParametriStrutturaViewState();
}

class _ModificaParametriStrutturaViewState
    extends State<ModificaParametriStrutturaView> {
  final _textController = TextEditingController();
  String userPost = "";
  StatoStruttura stato = StatoStruttura.LIBERA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
        title: const Text("Modifica la struttura"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userPost,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Inserisci il nome della struttura",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  userPost = _textController.text;
                });
              },
              child: const Text(
                "Conferma nome",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints.tightFor(height: 35.0, width: 150),
            ),
            const Text("Inserisci lo stato della struttura: "),
            DropdownButton<StatoStruttura>(
              value: stato,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (StatoStruttura? newValue) {
                setState(() {
                  stato = newValue!;
                });
              },
              items: <StatoStruttura>[
                StatoStruttura.LIBERA,
                StatoStruttura.OCCUPATA
              ].map<DropdownMenuItem<StatoStruttura>>((StatoStruttura value) {
                return DropdownMenuItem<StatoStruttura>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ModificaStrutturaView.routeName,
                  arguments: ModificaStrutturaArgs(
                      widget.idStruttura, userPost, stato),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Modifica struttura",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints.tightFor(height: 35.0, width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
