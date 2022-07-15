import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';

class ConfermaPrenotazione extends StatefulWidget {
  const ConfermaPrenotazione({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ConfermaPrenotazione> createState() => _ConfermaPrenotazioniState();
}

class _ConfermaPrenotazioniState extends State<ConfermaPrenotazione> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _prenotazioneService.confermaPrenotazione(widget.id),
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
              } else if (snapshot.hasData & snapshot.hasData == true) {
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
              } else
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
        });
  }
}
