import 'package:casotto/services/EventoService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class AddEventoView extends StatefulWidget {
  const AddEventoView(
      {Key? key,
      required this.nome,
      required this.numeroMaxPartecipanti,
      required this.data,
      required this.orarioInizio})
      : super(key: key);

  final String nome;
  final int numeroMaxPartecipanti;
  final DateTime data;
  final TimeOfDay orarioInizio;

  static const String routeName = "AddEvento";

  @override
  State<AddEventoView> createState() => _AddEventoViewState();
}

class _AddEventoViewState extends State<AddEventoView> {
  EventoService eventoService = new EventoService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: eventoService.addEvento(widget.nome, widget.data,
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
                      ModalRoute.withName(HomePage.routeName),
                    ),
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                body: const Center(
                  child: Text("L'evento è stato aggiunto correttamente"),
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
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
      },
    );
  }
}
