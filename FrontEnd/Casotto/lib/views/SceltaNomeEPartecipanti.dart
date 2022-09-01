import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SceltaDataEventoArgs.dart';
import 'HomePage.dart';
import 'SceltaDataEvento.dart';

class SceltaNomeEPartecipantiView extends StatefulWidget {
  const SceltaNomeEPartecipantiView({Key? key}) : super(key: key);

  static const String routeName = "SceltaNomeEPartecipanti";

  @override
  State<SceltaNomeEPartecipantiView> createState() =>
      _SceltaNomeEPartecipantiViewState();
}

class _SceltaNomeEPartecipantiViewState
    extends State<SceltaNomeEPartecipantiView> {
  final _textController = TextEditingController();
  int numeroMaxPartecipanti = 2;
  String userPost = "";

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
        title: const Text("Aggiungi un Evento"),
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
                hintText: "Inserisci il nome dell'evento",
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
            const Text("Inserisci un limite di partecipanti: "),
            const Text("(o seleziona 999 per non impostarlo): "),
            DropdownButton<int>(
              value: numeroMaxPartecipanti,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  numeroMaxPartecipanti = newValue!;
                });
              },
              items: <int>[2, 5, 10, 15, 20, 999]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SceltaDataEventoView.routeName,
                  arguments:
                      SceltaDataEventoArgs(userPost, numeroMaxPartecipanti),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Avanti",
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
