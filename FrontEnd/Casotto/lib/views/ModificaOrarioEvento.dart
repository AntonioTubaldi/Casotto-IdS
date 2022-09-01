import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaEventoArgs.dart';
import 'HomePage.dart';
import 'ModificaEvento.dart';

class ModificaOrarioEventoView extends StatefulWidget {
  const ModificaOrarioEventoView(
      {Key? key,
      required this.idEvento,
      required this.data,
      required this.numeroMaxPartecipanti})
      : super(key: key);

  final String idEvento;
  final DateTime data;
  final int numeroMaxPartecipanti;

  static const String routeName = "ModificaOrarioEvento";

  @override
  State<ModificaOrarioEventoView> createState() =>
      _ModificaOrarioEventoViewState();
}

class _ModificaOrarioEventoViewState extends State<ModificaOrarioEventoView> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, "0");
    final minutes = time.minute.toString().padLeft(2, "0");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ModificaEventoView.routeName,
            arguments: ModificaEventoArgs(widget.idEvento, widget.data, time,
                widget.numeroMaxPartecipanti),
            ModalRoute.withName(HomePage.routeName),
          );
        }),
        child: Text("Aggiungi Evento"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${hours}:${minutes}",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text("Modifica l'orario di inizio"),
              onPressed: () async {
                TimeOfDay? newTime =
                    await showTimePicker(context: context, initialTime: time);
                if (newTime == null) return;
                setState(() => time = newTime);
              },
            ),
          ],
        ),
      ),
    );
  }
}
