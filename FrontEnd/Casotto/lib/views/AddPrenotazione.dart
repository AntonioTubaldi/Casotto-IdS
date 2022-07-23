import 'package:casotto/models/ParametriPrenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPrenotazioneView extends StatefulWidget {
  const AddPrenotazioneView({Key? key, required this.parametri})
      : super(key: key);
  final ParametriPrenotazione parametri;

  @override
  State<AddPrenotazioneView> createState() => _AddPrenotazioneViewState();
}

class _AddPrenotazioneViewState extends State<AddPrenotazioneView> {
  PrenotazioneService prenotazioneService = new PrenotazioneService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: prenotazioneService.addPrenotazione(widget.parametri),
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
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Prenotazione Confermata'),
                ),
                body: Center(
                    child: Text(
                  "PRENOTAZIONE CONFERMATA",
                  style: TextStyle(fontSize: 30.0),
                )),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Ops! Qualcosa è andato storto!'),
                ),
                body: Center(
                    child: Text(
                  "La prenotazione non è stata confermata!",
                  style: TextStyle(fontSize: 30.0),
                )),
              );
            }
        }
      },
    );
  }
}
