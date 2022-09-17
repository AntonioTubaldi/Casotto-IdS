import 'package:casotto/models/Attrezzatura.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../arguments/SingleAttrezzaturaViewArgs.dart';
import 'ConfermaEliminazioneAttrezzatura.dart';
import 'HomePage.dart';
import 'SceltaModificheAttrezzatura.dart';

class SingleAttrezzaturaView extends StatelessWidget {
  const SingleAttrezzaturaView({Key? key, required this.singleAttrezzatura})
      : super(key: key);

  final Attrezzatura singleAttrezzatura;
  static const String routeName = "SingleAttrezzatura";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scheda Attrezzatura"),
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
        constraints: const BoxConstraints.tightFor(height: 50.0, width: 90),
        child: const Text(
          "HOME",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("attrezzatura: ${singleAttrezzatura.getNome()}",
                  style: const TextStyle(fontSize: 20)),
              Text(
                "quantita: ${singleAttrezzatura.getQuantita()}",
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: RawMaterialButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      ConfermaEliminazioneAttrezzaturaView.routeName,
                      arguments: SingleAttrezzaturaViewArgs(singleAttrezzatura),
                    ),
                  },
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      const BoxConstraints.tightFor(height: 50.0, width: 250),
                  child: const Text(
                    "Elimina Attrezzatura",
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
                      SceltaModificheAttrezzaturaView.routeName,
                      arguments: SingleAttrezzaturaViewArgs(singleAttrezzatura),
                    ),
                  },
                  fillColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  constraints:
                      const BoxConstraints.tightFor(height: 50.0, width: 250),
                  child: const Text(
                    "Modifica Attrezzatura",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
