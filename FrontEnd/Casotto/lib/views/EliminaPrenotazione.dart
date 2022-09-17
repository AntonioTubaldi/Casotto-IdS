import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

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
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
                      ModalRoute.withName(HomePage.routeName),
                    );
                  },
                  child: Text("HOME"),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Riepilogo'),
                ),
                body: const Center(
                  child: Text(
                    "Prenotazione eliminata",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              );
            } else {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
                      ModalRoute.withName(HomePage.routeName),
                    );
                  },
                  child: Text("HOME"),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Ops! Qualcosa è andato storto!'),
                ),
                body: const Center(
                  child: Text(
                    "La prenotazione non è stata eliminata!",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
