import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

class PrenotazioneEliminataView extends StatefulWidget {
  const PrenotazioneEliminataView({Key? key, required this.child})
      : super(key: key);
  final Prenotazione child;
  static const String routeName = "PrenotazioneEliminata";

  @override
  State<PrenotazioneEliminataView> createState() =>
      _PrenotazioneEliminataViewState();
}

class _PrenotazioneEliminataViewState extends State<PrenotazioneEliminataView> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _prenotazioneService
          .eliminaPrenotazione(widget.child.getIdPrenotazione()),
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
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "H",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Eliminazione'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Prenotazione Eliminata",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              } else
                return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "H",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Eliminazione'),
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
