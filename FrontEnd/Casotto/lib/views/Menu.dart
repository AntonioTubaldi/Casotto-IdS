import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ProdottiSelezionabiliArgs.dart';
import '../models/Prodotto.dart';
import '../models/Ruolo.dart';
import '../services/ProdottoService.dart';
import '../services/UtenteService.dart';
import '../widgets/ProdottiTab.dart';
import '../widgets/SelectableProdottiTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';
import 'ProdottiSelezionabili.dart';
import 'SceltaSpecificheProdotto.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  static const String routeName = "Menu";

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  ProdottoService _prodottoService = new ProdottoService();
  UtenteService utenteService = new UtenteService();

  List<Widget> _getProdottiTabs(List<Prodotto> prodotti) {
    return prodotti.map((Prodotto singleProdotto) {
      return ProdottiTab(child: singleProdotto);
    }).toList();
  }

  Widget _getScrollableView(List<Prodotto> prodottoList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getProdottiTabs(prodottoList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Object>>(
      future: Future.wait([
        _prodottoService.getAll(),
        utenteService.getRuolo(FirebaseAuth.instance.currentUser!.uid),
      ]),
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
              List<Prodotto> list = snapshot.data![0] as List<Prodotto>;
              Ruolo ruolo = snapshot.data![1] as Ruolo;
              if (snapshot.data!.isNotEmpty) {
                if (ruolo == Ruolo.GESTORE) {
                  return Scaffold(
                    bottomNavigationBar: BottomAppBar(
                      color: Colors.white,
                      child: Row(
                        children: [
                          //crea uno spazio che si adatta automaticamente
                          const Spacer(),

                          IconButton(
                              icon: Icon(color: Colors.teal, Icons.add),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  SceltaSpecificheProdottoView.routeName,
                                );
                              }),

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
                        ],
                      ),
                    ),
                    appBar: AppBar(
                      title: Text("Menù"),
                      backgroundColor: Colors.teal,
                    ),
                    body: Center(
                      child: Column(
                        children: [
                          _getScrollableView(list),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    bottomNavigationBar: BottomAppBar(
                      color: Colors.white,
                      child: Row(
                        children: [
                          IconButton(
                              icon:
                                  Icon(color: Colors.teal, Icons.shopping_cart),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  ProdottiSelezionabiliView.routeName,
                                  arguments: ProdottiSelezionabiliArgs(list),
                                );
                              }),

                          //crea uno spazio che si adatta automaticamente
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
                        ],
                      ),
                    ),
                    appBar: AppBar(
                      title: Text("Menù"),
                      backgroundColor: Colors.teal,
                    ),
                    body: Center(
                      child: Column(
                        children: [
                          _getScrollableView(list),
                        ],
                      ),
                    ),
                  );
                }
              } else if (ruolo == Ruolo.GESTORE) {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      ),
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
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Menù"),
                  ),
                  body: Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Non ci sono prodotti nel menù!"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            SceltaSpecificheProdottoView.routeName,
                          );
                        },
                        child: Text("Aggiungi Prodotto"),
                      ),
                    ],
                  )),
                );
              } else {
                return Scaffold(
                  floatingActionButton: RawMaterialButton(
                    onPressed: () => {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      ),
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
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Menù"),
                  ),
                  body: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Non ci sono prodotti nel menù!"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
        }
        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
