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
                  backgroundColor: Colors.teal,
                  title: const Text('Riepilogo'),
                ),
                body: const Center(
                  child: Text(
                    "Attrezzatura aggiunta all'elenco!",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        icon: Icon(color: Colors.teal, Icons.home),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomePage.routeName,
                            arguments: const HomePage(),
                            ModalRoute.withName(HomePage.routeName),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
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
