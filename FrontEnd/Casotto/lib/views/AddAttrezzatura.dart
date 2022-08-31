import 'package:casotto/services/AttrezzaturaService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class AddAttrezzaturaView extends StatefulWidget {
  const AddAttrezzaturaView(
      {Key? key, required this.nome, required this.quantita})
      : super(key: key);

  final String nome;
  final int quantita;
  static const String routeName = "AddAttrezzaturaView";

  @override
  State<AddAttrezzaturaView> createState() => _AddAttrezzaturaViewState();
}

class _AddAttrezzaturaViewState extends State<AddAttrezzaturaView> {
  AttrezzaturaService attrezzaturaService = new AttrezzaturaService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: attrezzaturaService.addAttrezzatura(widget.nome, widget.quantita),
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
                  centerTitle: true,
                  title: const Text('Riepilogo'),
                ),
                body: Center(
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Attrezzatura aggiunta all'elenco!",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),

                      const Spacer(),

                      MaterialButton(
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
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {
                    Navigator.popUntil(
                        context, ModalRoute.withName(HomePage.routeName)),
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Ops! Qualcosa è andato storto!'),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Qualcosa è andato storto",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
