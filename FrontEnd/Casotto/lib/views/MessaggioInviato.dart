import 'package:casotto/models/Utente.dart';
import 'package:casotto/services/UtenteService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class MessaggioInviatoView extends StatefulWidget {
  const MessaggioInviatoView(
      {Key? key,
      required this.singleUtente,
      required this.titolo,
      required this.descrizione})
      : super(key: key);

  final Utente singleUtente;
  final String titolo;
  final String descrizione;

  static const String routeName = "MessaggioInviato";

  @override
  State<MessaggioInviatoView> createState() => _MessaggioInviatoViewState();
}

class _MessaggioInviatoViewState extends State<MessaggioInviatoView> {
  UtenteService utenteService = new UtenteService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: utenteService.inviaMessaggio(
          widget.singleUtente.getIdUtente(), widget.titolo, widget.descrizione),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const MessageScreen(status: MessageScreenStatus.LOADING);
          case ConnectionState.none:
            return const MessageScreen(status: MessageScreenStatus.ERROR);
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const MessageScreen(status: MessageScreenStatus.ERROR);
            } else if (snapshot.hasData) {
              bool risposta = snapshot.data!;
              if (risposta) {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    fillColor: Colors.teal,
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Esito Invio'),
                  ),
                  body: const Center(
                    child: Text(
                      "Messaggio Inviato",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    fillColor: Colors.teal,
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Invio'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Qualcosa è andato storto!",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              }
            }
        }

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
