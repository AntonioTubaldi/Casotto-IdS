import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/ProdottoService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaProdottoView extends StatefulWidget {
  const ModificaProdottoView(
      {Key? key, required this.nome, required this.newPrezzo})
      : super(key: key);

  final String nome;
  final double newPrezzo;

  static const String routeName = "ModificaProdotto";

  @override
  State<ModificaProdottoView> createState() => _ModificaProdottoViewState();
}

class _ModificaProdottoViewState extends State<ModificaProdottoView> {
  ProdottoService prodottoService = new ProdottoService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prodottoService.modificaProdotto(widget.nome, widget.newPrezzo),
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
                  title: const Text('Prodotto Modificato'),
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
                  child: Text("Il prodotto è stato modificato"),
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
