import 'package:casotto/arguments/AddPrenotazioneViewArgs.dart';
import 'package:casotto/models/SlotData.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPrenotazioneView extends StatefulWidget {
  const AddPrenotazioneView(
      {Key? key,
      required this.idUtente,
      required this.dataPrenotazione,
      required this.idOmbrellone})
      : super(key: key);
  final String idUtente;
  final String idOmbrellone;

  final List<SlotData> dataPrenotazione;

  static const String routeName = "AddPrenotazione";

  @override
  State<AddPrenotazioneView> createState() => _AddPrenotazioneViewState();
}

class _AddPrenotazioneViewState extends State<AddPrenotazioneView> {
  PrenotazioneService prenotazioneService = new PrenotazioneService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: prenotazioneService.addPrenotazione(
          widget.idUtente, widget.idOmbrellone, widget.dataPrenotazione),
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
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomePage.routeName)),
                  },
                  child: Text(
                    "H",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Prenotazione Confermata'),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "PRENOTAZIONE CONFERMATA",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomePage.routeName)),
                  },
                  child: Text(
                    "H",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Ops! Qualcosa è andato storto!'),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Qualcosa è andato storto",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
