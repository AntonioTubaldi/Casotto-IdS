import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ProdottiSelezionabiliArgs.dart';
import '../models/Prodotto.dart';
import '../services/ProdottoService.dart';
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
    return FutureBuilder<List<Prodotto>>(
        future: _prodottoService.getAll(),
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
                  List<Prodotto> list = snapshot.data!;
                  return Scaffold(
                    floatingActionButton: Row(
                      children: [
                        const SizedBox(
                          width: 50.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ProdottiSelezionabiliView.routeName,
                              arguments: ProdottiSelezionabiliArgs(list),

                            );
                          },
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 110),
                          child: const Text("ORDINA", style: TextStyle(fontSize: 20.0,
                          color: Colors.white),
                          ),
                  ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SceltaSpecificheProdottoView.routeName,
                            );
                          },
          fillColor: Colors.teal,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          ),
          constraints:
          const BoxConstraints.tightFor(height: 50.0, width: 160),
                          child: const Text("AGGIUNGI PRODOTTO", style: TextStyle(fontSize: 13.0,
                              color: Colors.white),),
          ),

                      ],
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
                    floatingActionButton: RawMaterialButton(
                      onPressed: () => {
                        Navigator.popUntil(
                          context,
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
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Non ci sono prodotti nel menù!"),
                      ),
                    ),
                  );
                }
                ;
              }
          }
          return const MessageScreen(status: MessageScreenStatus.ERROR);
        });
  }
}
