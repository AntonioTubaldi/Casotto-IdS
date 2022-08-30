import 'package:flutter/material.dart';
import '../arguments/ModificaAttrezzaturaViewArgs.dart';
import 'AddAttrezzatura.dart';
import 'HomePage.dart';

class SceltaSpecificheAttrezzatureView extends StatefulWidget {
  const SceltaSpecificheAttrezzatureView({Key? key}) : super(key: key);

  static const String routeName = "SceltaSpecificheAttrezzature";

  @override
  State<SceltaSpecificheAttrezzatureView> createState() =>
      _SceltaSpecificheAttrezzatureViewState();
}

class _SceltaSpecificheAttrezzatureViewState
    extends State<SceltaSpecificheAttrezzatureView> {
  final _textController = TextEditingController();
  int quantita = 1;
  String userPost = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Aggiungi un'attrezzatura"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        userPost,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        quantita.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Inserisci il nome dell'attrezzatura",
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
            Text("Imposta la quantità: "),
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
              items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
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
                  AddAttrezzaturaView.routeName,
                  arguments: ModificaAttrezzaturaViewArgs(userPost, quantita),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Aggiungi",
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
