import 'package:casotto/arguments/AddStrutturaArgs.dart';
import 'package:casotto/models/StatoStruttura.dart';
import 'package:casotto/models/Struttura.dart';
import 'package:casotto/services/StrutturaService.dart';
import 'package:casotto/views/AddStruttura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/StrutturaTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';
import 'SceltaParametriStruttura.dart';

class AllStruttureView extends StatefulWidget {
  const AllStruttureView({Key? key}) : super(key: key);

  static const String routeName = "AllStrutture";

  @override
  State<AllStruttureView> createState() => _AllStruttureViewState();
}

class _AllStruttureViewState extends State<AllStruttureView> {
  StrutturaService strutturaService = new StrutturaService();

  List<Widget> _getStruttureTabs(List<Struttura> strutture) {
    return strutture.map((Struttura singleStruttura) {
      return StrutturaTabView(singleStruttura: singleStruttura);
    }).toList();
  }

  Widget _getScrollableView(List<Struttura> strutturaList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getStruttureTabs(strutturaList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Struttura>>(
      future: strutturaService.getAll(),
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
                List<Struttura> list = snapshot.data!;
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
                        IconButton(
                          icon: Icon(color: Colors.teal, Icons.add),
                          onPressed: () {
                            Navigator.pushNamed(context,
                                SceltaParametriStrutturaView.routeName);
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Strutture'),
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
                    title: const Text("Visualizza Strutture"),
                  ),
                  body: Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                            "Non ci sono strutture da poter visualizzare!"),
                      ),
                      RawMaterialButton(
                        onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            SceltaParametriStrutturaView.routeName,
                          ),
                        },
                        child: Text("Aggiungi Struttura",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        fillColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        constraints:
                            BoxConstraints.tightFor(height: 50.0, width: 200),
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
