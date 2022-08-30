import 'package:casotto/models/Attrezzatura.dart';
import 'package:casotto/services/AttrezzaturaService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaAttrezzaturaView extends StatefulWidget {
  const ModificaAttrezzaturaView(
      {Key? key, required this.nome, required this.newQuantita})
      : super(key: key);

  final String nome;
  final int newQuantita;

  static const String routeName = "ModificaAttrezzatura";

  @override
  State<ModificaAttrezzaturaView> createState() =>
      _ModificaAttrezzaturaViewState();
}

class _ModificaAttrezzaturaViewState extends State<ModificaAttrezzaturaView> {
  AttrezzaturaService attrezzaturaService = new AttrezzaturaService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: attrezzaturaService.modificaAttrezzatura(
        widget.nome,
        widget.newQuantita,
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
                    Text("L'attrezzatura è stata modificata",
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
      },
    );
  }
}
