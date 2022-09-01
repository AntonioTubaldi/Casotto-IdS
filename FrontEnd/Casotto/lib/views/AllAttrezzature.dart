import 'package:casotto/models/Attrezzatura.dart';
import 'package:casotto/services/AttrezzaturaService.dart';
import 'package:casotto/views/SceltaSpecificheAttrezzature.dart';
import 'package:casotto/widgets/AttrezzatureTab.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllAttrezzatureView extends StatefulWidget {
  const AllAttrezzatureView({Key? key}) : super(key: key);

  static const String routeName = "AllAttrezzature";

  @override
  State<AllAttrezzatureView> createState() => _AllAttrezzatureViewState();
}

class _AllAttrezzatureViewState extends State<AllAttrezzatureView> {
  AttrezzaturaService _attrezzaturaService = new AttrezzaturaService();

  List<Widget> _getAttrezzatureTabs(List<Attrezzatura> attrezzature) {
    return attrezzature.map((Attrezzatura singleAttrezzatura) {
      return AttrezzatureTab(singleAttrezzatura: singleAttrezzatura);
    }).toList();
  }

  Widget _getScrollableView(List<Attrezzatura> attrezzaturaList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getAttrezzatureTabs(attrezzaturaList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Attrezzatura>>(
      future: _attrezzaturaService.getAll(),
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
                List<Attrezzatura> list = snapshot.data!;
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
                                  SceltaSpecificheAttrezzatureView.routeName);
                            }),
                        const Spacer(),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text('Visualizza Attrezzature'),
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
                    title: const Text("Visualizza Attrezzature"),
                  ),
                  body: Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Non ci sono attrezzature disponibili!"),
                      ),
                      RawMaterialButton(
                        onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            SceltaSpecificheAttrezzatureView.routeName,
                          ),
                        },
                        child: Text("Aggiungi Attrezzatura",
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
