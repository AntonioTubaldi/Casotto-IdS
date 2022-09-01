import 'package:casotto/services/StrutturaService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Struttura.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class EliminaStrutturaView extends StatefulWidget {
  const EliminaStrutturaView({Key? key, required this.singleStruttura})
      : super(key: key);

  final Struttura singleStruttura;
  static const String routeName = "EliminaStruttura";

  @override
  State<EliminaStrutturaView> createState() => _EliminaStrutturaViewState();
}

class _EliminaStrutturaViewState extends State<EliminaStrutturaView> {
  StrutturaService strutturaService = new StrutturaService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: strutturaService.rimuoviStruttura(
        widget.singleStruttura.getIdStruttura(),
      ),
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
                      ModalRoute.withName(HomePage.routeName),
                    ),
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                body: Center(
                  child: Container(
                      child:
                          Text("La struttura è stata eliminata correttamente")),
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routeName,
                      arguments: const HomePage(),
                      ModalRoute.withName(HomePage.routeName),
                    ),
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                body: Center(
                  child: Container(child: Text("Qualcosa è andato storto")),
                ),
              );
            }
        }
      },
    );
  }
}
