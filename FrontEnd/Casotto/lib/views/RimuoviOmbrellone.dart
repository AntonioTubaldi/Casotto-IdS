import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/OmbrelloneService.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class RimuoviOmbrelloneView extends StatefulWidget {
  const RimuoviOmbrelloneView({Key? key, required this.idOmbrellone})
      : super(key: key);

  final String idOmbrellone;

  static const String routeName = "RimuoviOmbrellone";

  @override
  State<RimuoviOmbrelloneView> createState() => _RimuoviOmbrelloneViewState();
}

class _RimuoviOmbrelloneViewState extends State<RimuoviOmbrelloneView> {
  OmbrelloneService ombrelloneService = new OmbrelloneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ombrelloneService.rimuoviOmbrellone(widget.idOmbrellone),
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
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  centerTitle: true,
                  title: const Text('Riepilogo'),
                ),
                floatingActionButton: RawMaterialButton(
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
                body: Center(
                  child: Container(
                      child:
                          Text("L'ombrellone è stato eliminato correttamente")),
                ),
              );
            }
        }
      },
    );
  }
}
