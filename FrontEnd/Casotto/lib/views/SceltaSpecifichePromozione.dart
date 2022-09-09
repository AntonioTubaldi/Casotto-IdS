import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddPromozioneArgs.dart';
import 'AddPromozione.dart';
import 'HomePage.dart';

class SceltaSpecifichePromozioneView extends StatefulWidget {
  const SceltaSpecifichePromozioneView({Key? key}) : super(key: key);

  static const String routeName = "SceltaSpecifichePromozione";

  @override
  State<SceltaSpecifichePromozioneView> createState() =>
      _SceltaSpecifichePromozioneViewState();
}

class _SceltaSpecifichePromozioneViewState
    extends State<SceltaSpecifichePromozioneView> {
  final _textController = TextEditingController();
  double prezzo = 0;
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
        title: const Text("Aggiungi una promozione"),
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
                      height: 10,
                    ),
                    Text(
                      userPost,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      prezzo.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Inserisci il nome del prodotto in promozione",
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
            Text("Imposta il nuovo prezzo: "),
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
              items: <double>[0, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AddPromozioneView.routeName,
                  arguments: AddPromozioneArgs(userPost, prezzo),
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
