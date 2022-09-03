import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddEventoArgs.dart';
import 'AddEvento.dart';
import 'HomePage.dart';
import 'RiepilogoEvento.dart';

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

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(color: Colors.teal, Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  arguments: const HomePage(),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
            ),
            const Spacer(),
            IconButton(
                icon: Icon(color: Colors.teal, Icons.add),
                onPressed: () { Navigator.pushNamedAndRemoveUntil(
                  context,
                  AddEventoView.routeName,
                  arguments: AddEventoArgs(widget.nome, widget.data, time,
                      widget.numeroMaxPartecipanti),
                  ModalRoute.withName(HomePage.routeName),
                );
                }),
            const Spacer(),
          ],
        ),
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
            RawMaterialButton(
              constraints: BoxConstraints.expand(width: 200, height: 50),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("Seleziona l'orario di inizio", style: TextStyle(color: Colors.white),),
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
