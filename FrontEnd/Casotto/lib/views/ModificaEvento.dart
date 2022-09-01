import 'package:casotto/services/EventoService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaEventoView extends StatefulWidget {
  const ModificaEventoView(
      {Key? key,
      required this.idEvento,
      required this.data,
      required this.orarioInizio,
      required this.numeroMaxPartecipanti})
      : super(key: key);

  final String idEvento;
  final DateTime data;
  final TimeOfDay orarioInizio;
  final int numeroMaxPartecipanti;

  static const String routeName = "ModificaEvento";

  @override
  State<ModificaEventoView> createState() => _ModificaEventoViewState();
}

class _ModificaEventoViewState extends State<ModificaEventoView> {
  EventoService eventoService = new EventoService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: eventoService.modificaEvento(widget.idEvento, widget.data,
            widget.orarioInizio, widget.numeroMaxPartecipanti),
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
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Riepilogo'),
                  ),
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.popUntil(
                          context, ModalRoute.withName(HomePage.routeName)),
                    },
                    child: const Text("Home",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    constraints:
                        BoxConstraints.tightFor(height: 50.0, width: 130),
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text("L'evento è stato modificato",
                          textAlign: TextAlign.center)
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Errore'),
                  ),
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              }
          }
        });
  }
}
