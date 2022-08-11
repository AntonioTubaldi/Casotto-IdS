import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/ProdottoService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AddProdottoView extends StatefulWidget {
  const AddProdottoView({Key? key, required this.nome, required this.prezzo})
      : super(key: key);

  final String nome;
  final double prezzo;
  static const String routeName = "AddProdotto";

  @override
  State<AddProdottoView> createState() => _AddProdottoViewState();
}

class _AddProdottoViewState extends State<AddProdottoView> {
  ProdottoService prodottoService = new ProdottoService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prodottoService.addProdotto(widget.nome, widget.prezzo),
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
                      context,
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
                          Text("il prodotto è stato aggiunto correttamente")),
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
      },
    );
  }
}
