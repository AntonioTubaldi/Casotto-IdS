import 'package:casotto/models/Ordine.dart';
import 'package:flutter/material.dart';

import '../services/OrdineService.dart';
import '../widgets/OrdiniTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllOrdiniView extends StatefulWidget {
  AllOrdiniView({Key? key}) : super(key: key);

  static const String routeName = "AllOrdini";

  @override
  State<AllOrdiniView> createState() => _AllOrdiniViewState();
}

class _AllOrdiniViewState extends State<AllOrdiniView> {
  OrdineService _ordineService = new OrdineService();

  List<Widget> _getOrdiniTabs(List<Ordine> ordini) {
    return ordini.map((Ordine singleOrdine) {
      return OrdiniTab(child: singleOrdine);
    }).toList();
  }

  Widget _getScrollableView(List<Ordine> ordineList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getOrdiniTabs(ordineList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ordine>>(
      future: _ordineService.getAll(),
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
                List<Ordine> list = snapshot.data!;
                print("Lista: " + list.toString());
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Visualizza Ordini'),
                    backgroundColor: Colors.teal,
                  ),
                  body: _getScrollableView(list),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.white,
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(color: Colors.white, Icons.menu),
                            onPressed: () {}),
                        const Spacer(),
                        // IconButton(icon: Icon(Icons.search), onPressed: () {}),
                        // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    child: Icon(color: Colors.teal, Icons.home),
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      );
                    },
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text("Visualizza Ordini"),
                  ),
                  floatingActionButton: RawMaterialButton(
                    constraints: BoxConstraints.expand(width: 120, height: 50),
                    fillColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
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
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  body: Center(
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text("Non ci sono ordini da visualizzare"),
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
