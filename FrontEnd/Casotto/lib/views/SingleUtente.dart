import 'package:casotto/models/Utente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleUtenteArgs.dart';
import 'HomePage.dart';
import 'ScritturaMessaggio.dart';

class SingleUtenteView extends StatelessWidget {
  const SingleUtenteView({Key? key, required this.singleUtente})
      : super(key: key);

  final Utente singleUtente;

  static const String routeName = "SingleUtente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scheda Utente"),
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
                      Text("Nome: ${singleUtente.getNome()}",
                          style: const TextStyle(fontSize: 20)),
                      Text(
                        "Cognome: ${singleUtente.getCognome()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Ruolo: ${singleUtente.getRuoloString()}",
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
                    ScritturaMessaggioView.routeName,
                    arguments: SingleUtenteArgs(singleUtente),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 200),
                child: const Text(
                  "Invia un messaggio",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
