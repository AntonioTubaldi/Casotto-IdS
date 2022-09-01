import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddEventoArgs.dart';
import 'AddEvento.dart';
import 'HomePage.dart';

class SceltaOrarioEventoView extends StatefulWidget {
  const SceltaOrarioEventoView(
      {Key? key,
      required this.nome,
      required this.data,
      required this.numeroMaxPartecipanti})
      : super(key: key);

  final String nome;
  final DateTime data;
  final int numeroMaxPartecipanti;

  static const String routeName = "SceltaOrarioEvento";

  @override
  State<SceltaOrarioEventoView> createState() => _SceltaOrarioEventoViewState();
}

class _SceltaOrarioEventoViewState extends State<SceltaOrarioEventoView> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, "0");
    final minutes = time.minute.toString().padLeft(2, "0");
    return Scaffold(
      floatingActionButton: Row(
        children: [
          ElevatedButton(
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
          FloatingActionButton(
            onPressed: (() {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AddEventoView.routeName,
                arguments: AddEventoArgs(widget.nome, widget.data, time,
                    widget.numeroMaxPartecipanti),
                ModalRoute.withName(HomePage.routeName),
              );
            }),
            child: Text("Aggiungi Evento"),
          ),
        ],
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
              child: Text("Seleziona l'orario di inizio"),
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
