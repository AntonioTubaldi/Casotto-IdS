import 'package:casotto/services/OrdineService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Ordine.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class OrdinazioneConfermataView extends StatefulWidget {
  const OrdinazioneConfermataView({Key? key, required this.child}) : super(key: key);
  final Ordine child;
  static const String routeName = "Ordinazione Confermata";

  @override
  State<OrdinazioneConfermataView> createState() => _OrdinazioneConfermataViewState();
}

class _OrdinazioneConfermataViewState extends State<OrdinazioneConfermataView> {
  OrdineService _ordinazioneConfermata = new OrdineService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _ordinazioneConfermata
          .addOrdine(widget.child.getListProdotti()),
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
              bool risposta = snapshot.data!;
              if (risposta) {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    constraints:
                    BoxConstraints.tightFor(height: 50.0, width: 100),
                    child: const Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Operazione'),
                  ),
                  body: Center(
                    child: RawMaterialButton(
                      onPressed: () {
                      },
                      child: const Text(
                        "Ordinazione Confermata",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 100),
                    child: const Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Esito Operazione'),
                  ),
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Qualcosa è andato storto!",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              }
            }
        }

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
