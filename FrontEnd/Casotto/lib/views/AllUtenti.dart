import 'package:casotto/services/UtenteService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Utente.dart';
import '../widgets/UtenteTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllUtentiView extends StatefulWidget {
  const AllUtentiView({Key? key}) : super(key: key);

  static const String routeName = "AllUtenti";

  @override
  State<AllUtentiView> createState() => _AllUtentiViewState();
}

class _AllUtentiViewState extends State<AllUtentiView> {
  UtenteService utenteService = new UtenteService();

  List<Widget> _getUtentiTabs(List<Utente> utenti) {
    return utenti.map((Utente singleUtente) {
      return UtenteTab(singleUtente: singleUtente);
    }).toList();
  }

  Widget _getScrollableView(List<Utente> utenteList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getUtentiTabs(utenteList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Utente>>(
      future: utenteService.getAll(),
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
                List<Utente> list = snapshot.data!;
                return Scaffold(
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
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Utenti'),
                  ),
                  body: _getScrollableView(list),
                  floatingActionButton: Row(
                    children: [
                      SizedBox(width: 40.0),
                      Container(
                        child: RawMaterialButton(
                          onPressed: () => {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              arguments: const HomePage(),
                              ModalRoute.withName(HomePage.routeName),
                            ),
                          },
                        ),
                      ),
                    ],
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
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Visualizza Utenti"),
                  ),
                  body: Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child:
                            Text("Non ci sono utenti da poter visualizzare!"),
                      ),
                    ],
                  )),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
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
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
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
