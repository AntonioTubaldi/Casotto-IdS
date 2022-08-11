import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/OmbrelloneService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaOmbrelloneView extends StatefulWidget {
  const ModificaOmbrelloneView({
    Key? key,
    required this.idOmbrellone,
    required this.prezzo,
    required this.posizione,
    required this.prezzoLettini,
    required this.prezzoSdraio,
  }) : super(key: key);
  final String idOmbrellone;
  final double prezzo;
  final int posizione;
  final double prezzoLettini;
  final double prezzoSdraio;

  static const String routeName = "ModificaOmbrellone";

  @override
  State<ModificaOmbrelloneView> createState() => _ModificaOmbrelloneViewState();
}

class _ModificaOmbrelloneViewState extends State<ModificaOmbrelloneView> {
  OmbrelloneService ombrelloneService = new OmbrelloneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ombrelloneService.modificaOmbrellone(
            widget.idOmbrellone,
            widget.prezzo,
            widget.posizione,
            widget.prezzoLettini,
            widget.prezzoSdraio),
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
                      Text("L'ombrellone è stato modificato",
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
