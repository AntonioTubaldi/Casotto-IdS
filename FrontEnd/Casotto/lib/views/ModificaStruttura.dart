import 'package:casotto/models/StatoStruttura.dart';
import 'package:casotto/services/StrutturaService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaStrutturaView extends StatefulWidget {
  const ModificaStrutturaView(
      {Key? key,
      required this.idStruttura,
      required this.nome,
      required this.stato})
      : super(key: key);

  final String idStruttura;
  final String nome;
  final StatoStruttura stato;
  static const String routeName = "ModificaStrutturaView";

  @override
  State<ModificaStrutturaView> createState() => _ModificaStrutturaViewState();
}

class _ModificaStrutturaViewState extends State<ModificaStrutturaView> {
  StrutturaService strutturaService = new StrutturaService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: strutturaService.modificaStruttura(
          widget.idStruttura, widget.nome, widget.stato),
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
                  title: const Text('Struttura Modificata'),
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
                  child: Text("La struttura è stata modificata"),
                ),
              );
            } else
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
              );
        }
      },
    );
  }
}
