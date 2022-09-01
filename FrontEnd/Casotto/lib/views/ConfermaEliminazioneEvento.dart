import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleEventoViewArgs.dart';
import '../models/Evento.dart';
import 'EventoEliminato.dart';
import 'HomePage.dart';

class ConfermaEliminazioneEventoView extends StatefulWidget {
  const ConfermaEliminazioneEventoView({Key? key, required this.singleEvento})
      : super(key: key);

  final Evento singleEvento;
  static const String routeName = "ConfermaEliminazioneEvento";

  @override
  State<ConfermaEliminazioneEventoView> createState() =>
      _ConfermaEliminazioneEventoViewState();
}

class _ConfermaEliminazioneEventoViewState
    extends State<ConfermaEliminazioneEventoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliminazione evento"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Stai per eliminare il seguente evento: "),
            Text(
              widget.singleEvento.getNome(),
            ),
            Text("Sei sicuro?"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  EventoEliminatoView.routeName,
                  arguments: SingleEventoViewArgs(widget.singleEvento),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA"),
            ),
          ],
        ),
      ),
    );
  }
}
