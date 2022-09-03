import 'package:casotto/models/StatoStruttura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddStrutturaArgs.dart';
import 'AddStruttura.dart';
import 'HomePage.dart';
import 'RiepilogoStruttura.dart';

class SceltaParametriStrutturaView extends StatefulWidget {
  const SceltaParametriStrutturaView({Key? key}) : super(key: key);

  static const String routeName = "SceltaParametriStruttura";

  @override
  State<SceltaParametriStrutturaView> createState() =>
      _SceltaParametriStrutturaViewState();
}

class _SceltaParametriStrutturaViewState
    extends State<SceltaParametriStrutturaView> {
  final _textController = TextEditingController();
  String userPost = "";
  StatoStruttura stato = StatoStruttura.LIBERA;

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
        title: const Text("Aggiungi una struttura"),
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
                  RiepilogoStrutturaView.routeName,
                  arguments: AddStrutturaArgs(userPost, stato),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Aggiungi struttura",
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
