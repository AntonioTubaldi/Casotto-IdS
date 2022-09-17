import 'package:casotto/services/AttrezzaturaService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class EliminaAttrezzaturaView extends StatefulWidget {
  const EliminaAttrezzaturaView({Key? key, required this.nome})
      : super(key: key);

  final String nome;

  static const String routeName = "EliminaAttrezzatura";

  @override
  State<EliminaAttrezzaturaView> createState() =>
      _EliminaAttrezzaturaViewState();
}

class _EliminaAttrezzaturaViewState extends State<EliminaAttrezzaturaView> {
  AttrezzaturaService attrezzaturaService = new AttrezzaturaService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: attrezzaturaService.rimuoviAttrezzatura(widget.nome),
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
            } else if (snapshot.hasData & snapshot.hasData == true) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Riepilogo'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Attrezzatura eliminata",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RawMaterialButton(
                        fillColor: Colors.teal,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomePage.routeName,
                            arguments: const HomePage(),
                            ModalRoute.withName(HomePage.routeName),
                          );
                        },
                        child: const Text("HOME",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Riepilogo'),
                ),
                body: Column(
                  children: [
                    const Text(
                      "Ops! Qualcosa è andato storto!",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          arguments: const HomePage(),
                          ModalRoute.withName(HomePage.routeName),
                        );
                      },
                      child: const Text("HOME"),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
