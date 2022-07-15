import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';

class EliminaPrenotazione extends StatefulWidget {
  const EliminaPrenotazione({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<EliminaPrenotazione> createState() => _EliminaPrenotazioniState();
}

class _EliminaPrenotazioniState extends State<EliminaPrenotazione> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _prenotazioneService.eliminaPrenotazione(widget.id),
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
                    title: const Text('Prenotazione Eliminata'),
                  ),
                  body: Center(
                      child: Text(
                    "PRENOTAZIONE ELIMINATA",
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
                    "La prenotazione non è stata eliminata!",
                    style: TextStyle(fontSize: 30.0),
                  )),
                );
          }
        });
  }
}
