import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaProdottoViewArgs.dart';
import 'AddProdotto.dart';

class SceltaSpecificheProdottoView extends StatefulWidget {
  const SceltaSpecificheProdottoView({Key? key}) : super(key: key);

  static const String routeName = "SceltaSpecificheProdotto";

  @override
  State<SceltaSpecificheProdottoView> createState() =>
      _SceltaSpecificheProdottoViewState();
}

class _SceltaSpecificheProdottoViewState
    extends State<SceltaSpecificheProdottoView> {
  final _textController = TextEditingController();
  double prezzo = 1;
  String userPost = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Aggiungi un Prodotto"),
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
                  child: Text(
                    userPost,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Inserisci il nome del prodotto",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  userPost = _textController.text;
                });
              },
              color: Colors.blue,
              child: const Text(
                "Conferma nome",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text("Imposta il prezzo: "),
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
              items: <double>[1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AddProdottoView.routeName,
                  arguments: ModificaProdottoViewArgs(userPost, prezzo),
                );
              },
              child: Text("Aggiungi"),
            ),
          ],
        ),
      ),
    );
  }
}
