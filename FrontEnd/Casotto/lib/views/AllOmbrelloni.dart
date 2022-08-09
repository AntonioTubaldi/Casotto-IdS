import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/views/SceltaSpecificheOmb.dart';
import 'package:casotto/views/addOmbrellone.dart';
import 'package:flutter/material.dart';
import '../services/OmbrelloneService.dart';
import '../widgets/OmbrelloniTab.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AllOmbrelloniView extends StatefulWidget {
  const AllOmbrelloniView({Key? key}) : super(key: key);

  static const String routeName = "AllOmbrelloni";

  @override
  State<AllOmbrelloniView> createState() => _AllOmbrelloniViewState();
}

class _AllOmbrelloniViewState extends State<AllOmbrelloniView> {
  OmbrelloneService _ombrelloneService = new OmbrelloneService();

  List<Widget> _getOmbrelloniTabs(List<Ombrellone> ombrelloni) {
    return ombrelloni.map((Ombrellone singleOmbrellone) {
      return OmbrelloniTab(child: singleOmbrellone);
    }).toList();
  }

  Widget _getScrollableView(List<Ombrellone> ombrelloneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getOmbrelloniTabs(ombrelloneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ombrellone>>(
      future: _ombrelloneService.getAllOmbrelloni(),
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
                List<Ombrellone> list = snapshot.data!;
                return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.teal,
                      centerTitle: true,
                      title: const Text('Visualizza Spiaggia'),
                    ),
                    body: _getScrollableView(list),
                    floatingActionButton: Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () => {
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(HomePage.routeName),
                            ),
                          },
                          child: Text("Home",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                          fillColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          constraints:
                              BoxConstraints.tightFor(height: 50.0, width: 130),
                        ),
                        RawMaterialButton(
                          onPressed: () => {
                            Navigator.pushNamed(
                              context,
                              SceltaSpecificheOmbView.routeName,
                            ),
                          },
                          child: Text("Aggiungi Ombrellone",
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
                    ));
              } else
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
                    title: const Text("Visualizza Spiaggia"),
                  ),
                  body: Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Non ci sono ombrelloni disponibili!"),
                      ),
                      RawMaterialButton(
                        onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            SceltaSpecificheOmbView.routeName,
                          ),
                        },
                        child: Text("Aggiungi Ombrellone",
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
                );
            }
            return const MessageScreen(status: MessageScreenStatus.ERROR);
        }
      },
    );
  }
}
