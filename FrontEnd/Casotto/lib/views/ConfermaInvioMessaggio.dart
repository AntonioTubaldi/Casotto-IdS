import 'package:casotto/models/Utente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ConfermaInvioArgs.dart';
import 'HomePage.dart';
import 'MessaggioInviato.dart';

class ConfermaInvioMessaggioView extends StatefulWidget {
  const ConfermaInvioMessaggioView(
      {Key? key,
      required this.singleUtente,
      required this.titolo,
      required this.descrizione})
      : super(key: key);

  final Utente singleUtente;
  final String titolo;
  final String descrizione;

  static const String routeName = "ConfermaInvio";
  @override
  State<ConfermaInvioMessaggioView> createState() =>
      _ConfermaInvioMessaggioViewState();
}

class _ConfermaInvioMessaggioViewState
    extends State<ConfermaInvioMessaggioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Invio Messaggio"),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Stai per inviare questo messaggio: "),
            Text(
              "Titolo: " + widget.titolo,
            ),
            Text(
              "Descrizione: " + widget.descrizione,
            ),
            Text("All'utente: "),
            Text(
              "${widget.singleUtente.getNome()}" +
                  " " +
                  "${widget.singleUtente.getCognome()}",
            ),
            SizedBox(height: 10),
            Text(
              "Sei sicuro?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            RawMaterialButton(
              fillColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MessaggioInviatoView.routeName,
                  arguments: ConfermaInvioArgs(
                      widget.singleUtente, widget.titolo, widget.descrizione),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
