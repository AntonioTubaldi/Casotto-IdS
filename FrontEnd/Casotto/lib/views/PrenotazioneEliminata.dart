import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrenotazioneEliminataView extends StatefulWidget {
  const PrenotazioneEliminataView({Key? key, required this.child})
      : super(key: key);
  final Prenotazione child;

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
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Prenotazione'),
                  ),
                  body: Text("Prenotazione Eliminata"),
                );
              } else
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Prenotazione'),
                  ),
                  body: Text("Qualcosa è andato storto"),
                );
            }
        }

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
