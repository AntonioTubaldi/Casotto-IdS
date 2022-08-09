import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/ProdottoService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class ProdottoEliminatoView extends StatefulWidget {
  const ProdottoEliminatoView({Key? key, required this.name}) : super(key: key);

  final String name;

  static const String routeName = "ProdottoEliminato";

  @override
  State<ProdottoEliminatoView> createState() => _ProdottoEliminatoViewState();
}

class _ProdottoEliminatoViewState extends State<ProdottoEliminatoView> {
  ProdottoService prodottoService = new ProdottoService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: prodottoService.rimuoviProdotto(widget.name),
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
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Prodotto Rimosso'),
                  ),
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.popUntil(
                          context, ModalRoute.withName(HomePage.routeName)),
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
