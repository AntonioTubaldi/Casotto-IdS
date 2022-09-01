import 'package:casotto/models/Struttura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ModificaParametriStrutturaArgs.dart';
import '../arguments/SingleStrutturaArgs.dart';
import 'ConfermaEliminazioneStruttura.dart';
import 'HomePage.dart';
import 'ModificaParametriStruttura.dart';

class SingleStrutturaView extends StatelessWidget {
  const SingleStrutturaView({Key? key, required this.singleStruttura})
      : super(key: key);

  final Struttura singleStruttura;

  static const String routeName = "SingleStruttura";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scheda Struttura"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        fillColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        constraints: const BoxConstraints.tightFor(height: 50.0, width: 110),
        child: const Text(
          "HOME",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 75.0),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text("Nome: ${singleStruttura.getNome()}",
                          style: const TextStyle(fontSize: 20)),
                      Text(
                        "Stato: ${singleStruttura.getStatoStrutturaString()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ] //children
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamed(
                    context,
                    ConfermaEliminazioneStrutturaView.routeName,
                    arguments: SingleStrutturaArgs(singleStruttura),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 200),
                child: const Text(
                  "Elimina Struttura",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamed(
                    context,
                    ModificaParametriStrutturaView.routeName,
                    arguments: ModificaParametriStrutturaArgs(
                      singleStruttura.getIdStruttura(),
                    ),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 200),
                child: const Text(
                  "Modifica Struttura",
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
