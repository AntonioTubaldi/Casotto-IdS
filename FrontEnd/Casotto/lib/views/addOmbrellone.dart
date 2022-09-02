import 'dart:ffi';

import 'package:casotto/models/Giorno.dart';
import 'package:casotto/models/Ombrellone.dart';
import 'package:casotto/services/OmbrelloneService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/SlotData.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AddOmbrelloneView extends StatefulWidget {
  AddOmbrelloneView({
    Key? key,
    required this.prezzo,
    required this.posizione,
    required this.prezzoLettini,
    required this.prezzoSdraio,
  }) : super(key: key);

  final double prezzo;
  final int posizione;
  final double prezzoLettini;
  final double prezzoSdraio;

  static const String routeName = "AddOmbrellone";

  @override
  State<AddOmbrelloneView> createState() => _AddOmbrelloneViewState();
}

class _AddOmbrelloneViewState extends State<AddOmbrelloneView> {
  OmbrelloneService ombrelloneService = new OmbrelloneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ombrelloneService.addOmbrellone(widget.prezzo, widget.posizione,
          widget.prezzoLettini, widget.prezzoSdraio),
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
                  backgroundColor: Colors.teal,
                  centerTitle: true,
                  title: const Text('Riepilogo'),
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
                body: const Center(
                  child: Text("L'ombrellone è stato aggiunto correttamente"),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  centerTitle: true,
                  title: const Text('Errore'),
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
              );
            }
        }
      },
    );
  }
}
