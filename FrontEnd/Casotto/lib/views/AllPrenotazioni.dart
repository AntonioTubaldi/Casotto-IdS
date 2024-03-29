import 'dart:ffi';

import 'package:casotto/models/Prenotazione.dart';
import 'package:casotto/services/PrenotazioneService.dart';
import 'package:casotto/views/MessageScreen.dart';
import 'package:casotto/widgets/PrenotazioniTab.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class AllPrenotazioniView extends StatefulWidget {
  AllPrenotazioniView({Key? key, required this.dataSelezionata})
      : super(key: key);
  DateTime dataSelezionata;
  static const String routeName = "AllPrenotazioni";

  @override
  State<AllPrenotazioniView> createState() => _AllPrenotazioniViewState();
}

class _AllPrenotazioniViewState extends State<AllPrenotazioniView> {
  PrenotazioneService _prenotazioneService = new PrenotazioneService();

  List<Widget> _getPrenotazioniTabs(List<Prenotazione> prenotazioni) {
    return prenotazioni.map((Prenotazione singlePrenotazione) {
      return PrenotazioniTab(child: singlePrenotazione);
    }).toList();
  }

  Widget _getScrollableView(List<Prenotazione> prenotazioneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getPrenotazioniTabs(prenotazioneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Prenotazione>>(
      future:
          _prenotazioneService.getPrenotazioneByData(widget.dataSelezionata),
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
                List<Prenotazione> list = snapshot.data!;
                print("Lista: " + list.toString());
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.teal,
                    title: const Text('Visualizza Prenotazioni'),
                  ),
                  body: _getScrollableView(list),
                  floatingActionButton: FloatingActionButton(
                    onPressed: (() {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomePage.routeName,
                        arguments: const HomePage(),
                        ModalRoute.withName(HomePage.routeName),
                      );
                    }),
                    child: Text("HOME"),
                  ),
                );
              } else {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: const Text("Visualizza Prenotazioni"),
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
                      child: Text(
                          "Non ci sono prenotazioni per il giorno selezionato"),
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
