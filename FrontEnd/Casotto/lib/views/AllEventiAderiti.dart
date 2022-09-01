import 'package:casotto/services/UtenteService.dart';
import 'package:casotto/widgets/EventiTab2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Evento.dart';
import '../widgets/EventiTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllEventiAderitiView extends StatefulWidget {
  const AllEventiAderitiView({Key? key, required this.idUtente})
      : super(key: key);

  final String idUtente;

  static const String routeName = "AllEventiAderiti";

  @override
  State<AllEventiAderitiView> createState() => _AllEventiAderitiViewState();
}

class _AllEventiAderitiViewState extends State<AllEventiAderitiView> {
  UtenteService utenteService = new UtenteService();

  List<Widget> _getEventiTabs(List<Evento> evento) {
    return evento.map((Evento singleEvento) {
      return EventiTab2View(singleEvento: singleEvento);
    }).toList();
  }

  Widget _getScrollableView(List<Evento> eventoList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getEventiTabs(eventoList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Evento>>(
      future: utenteService.visualizzaEventiAderiti(widget.idUtente),
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
              if (snapshot.data!.isNotEmpty) {
                List<Evento> list = snapshot.data!;
                return Scaffold(
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            icon: Icon(color: Colors.teal, Icons.home),
                            onPressed: () {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(HomePage.routeName),
                              );
                            }),
                        const Spacer(),
                        IconButton(
                            icon: Icon(color: Colors.teal, Icons.add),
                            onPressed: () {}),
                        const Spacer(),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Eventi Aderiti'),
                  ),
                  body: _getScrollableView(list),
                  floatingActionButton: Row(children: [
                    SizedBox(width: 40.0),
                    Container(
                      child: RawMaterialButton(
                        onPressed: () => {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName(HomePage.routeName),
                          ),
                        },
                      ),
                    ),
                  ]),
                );
              } else {
                return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(HomePage.routeName),
                      ),
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Visualizza Eventi Aderiti"),
                  ),
                  body: Center(
                    child: const Text("Non sei iscritto a nessun evento!"),
                  ),
                );
              }
            }
            return const MessageScreen(status: MessageScreenStatus.ERROR);
        }
      },
    );
  }
}
