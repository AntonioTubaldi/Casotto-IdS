import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/UtenteService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class IscrizioneAdEventoView extends StatefulWidget {
  const IscrizioneAdEventoView(
      {Key? key, required this.idUtente, required this.idEvento})
      : super(key: key);

  final String idUtente;
  final String idEvento;

  static const String routeName = "IscrizioneAdEvento";

  @override
  State<IscrizioneAdEventoView> createState() => _IscrizioneAdEventoViewState();
}

class _IscrizioneAdEventoViewState extends State<IscrizioneAdEventoView> {
  @override
  UtenteService utenteService = new UtenteService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: utenteService.iscrizioneEvento(widget.idUtente, widget.idEvento),
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
            } else if (snapshot.hasData && snapshot.hasData == true) {
              return Scaffold(
                floatingActionButton: RawMaterialButton(
                  onPressed: () => {
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomePage.routeName)),
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Riepilogo'),
                ),
                body: Center(
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Ti sei iscritto all'evento!",
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
                  child: const Text(
                    "Home",
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
                    child: const Text(
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
