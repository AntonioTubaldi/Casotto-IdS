import 'dart:ffi';

import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrenotazioneConfermataView extends StatefulWidget {
  const PrenotazioneConfermataView({Key? key, required this.child})
      : super(key: key);
  final Prenotazione child;

  @override
  State<PrenotazioneConfermataView> createState() =>
      _PrenotazioneConfermataViewState();
}

class _PrenotazioneConfermataViewState
    extends State<PrenotazioneConfermataView> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _prenotazioneService
          .confermaPrenotazione(widget.child.getIdPrenotazione()),
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
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()))
                    },
                    child: Text(
                      "H",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Operazione'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Prenotazione Confermata",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              } else
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Operazione'),
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

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
