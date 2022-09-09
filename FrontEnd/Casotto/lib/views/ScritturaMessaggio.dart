import 'package:casotto/models/Utente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ConfermaInvioArgs.dart';
import 'ConfermaInvioMessaggio.dart';
import 'HomePage.dart';

class ScritturaMessaggioView extends StatefulWidget {
  const ScritturaMessaggioView({Key? key, required this.singleUtente})
      : super(key: key);

  final Utente singleUtente;

  static const String routeName = "ScritturaMessaggio";

  @override
  State<ScritturaMessaggioView> createState() => _ScritturaMessaggioViewState();
}

class _ScritturaMessaggioViewState extends State<ScritturaMessaggioView> {
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();
  String userPost = "";
  String userPost2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(color: Colors.teal, Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  arguments: const HomePage(),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Componi il messaggio"),
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
                hintText: "Inserisci il titolo del messaggio",
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
                "Conferma titolo",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints.tightFor(height: 35.0, width: 150),
            ),
            Text(
              userPost2,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _textController2,
              decoration: InputDecoration(
                hintText: "Inserisci la descrizione del messaggio",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController2.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  userPost2 = _textController2.text;
                });
              },
              child: const Text(
                "Conferma descrizione",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              constraints: BoxConstraints.tightFor(height: 35.0, width: 150),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ConfermaInvioMessaggioView.routeName,
                  arguments: ConfermaInvioArgs(
                      widget.singleUtente, userPost, userPost2),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Invia",
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
