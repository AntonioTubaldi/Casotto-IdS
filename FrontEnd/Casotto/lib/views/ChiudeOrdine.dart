import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Ordine.dart';
import '../services/OrdineService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class ChiudeOrdineView extends StatefulWidget {
  const ChiudeOrdineView({Key? key, required this.singleOrdine})
      : super(key: key);

  final Ordine singleOrdine;
  static const String routeName = "ChiudeOrdine";

  @override
  State<ChiudeOrdineView> createState() => _ChiudeOrdineViewState();
}

class _ChiudeOrdineViewState extends State<ChiudeOrdineView> {
  OrdineService ordineService = new OrdineService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: ordineService.chiudeOrdine(widget.singleOrdine.getIdOrdine()),
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
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
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Esito Operazione'),
                  ),
                  body: const Center(
                    child: const Text(
                      "L'ordine è stato chiuso ed eliminato",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
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
                    backgroundColor: Colors.teal,
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
