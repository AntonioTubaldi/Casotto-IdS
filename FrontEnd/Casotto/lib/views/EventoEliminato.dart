import 'package:casotto/services/EventoService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Evento.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class EventoEliminatoView extends StatefulWidget {
  const EventoEliminatoView({Key? key, required this.singleEvento})
      : super(key: key);

  final Evento singleEvento;
  static const String routeName = "EventoEliminato";

  @override
  State<EventoEliminatoView> createState() => _EventoEliminatoViewState();
}

class _EventoEliminatoViewState extends State<EventoEliminatoView> {
  EventoService eventoService = new EventoService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: eventoService.eliminaEvento(
        widget.singleEvento.getIdEvento(),
      ),
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
                body: Center(
                  child: Container(
                      child: Text("L'evento è stato eliminato correttamente")),
                ),
              );
            } else {
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
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                body: Center(
                  child:
                      Container(child: Text("Ops! Qualcosa è andato storto!")),
                ),
              );
            }
        }
      },
    );
  }
}
