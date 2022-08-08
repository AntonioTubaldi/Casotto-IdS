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
   AddOmbrelloneView ({Key? key,
    required this.idOmbrellone,
    required this.prezzo,
    required this.posizione,
    required this.disponibilita,
    required this.prezzoLettini,
    required this.prezzoSdraio,
  })
      : super(key: key);
  final String idOmbrellone;
  final double prezzo;
  final int posizione;
  final List<SlotData> disponibilita;
  final double prezzoLettini;
  final double prezzoSdraio;

    final List<SlotData> ombrelloneLista = [SlotData(Giorno.MATTINA, DateTime(now.year, now.month, now.day+1))];
  static const String routeName = "AddOmbrellone";

  @override
  State<AddOmbrelloneView> createState() => _AddOmbrelloneViewState();


}




class _AddOmbrelloneViewState extends State<AddOmbrelloneView> {
  OmbrelloneService ombrelloneService = new OmbrelloneService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OmbrelloneService.addOmbrellone(
          Ombrellone('123', 10, 1, '', prezzoLettini, prezzoSdraio)
          ), builder: (context, snapshot) {
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
                title: const Text('Prenotazione Confermata'),
              ),
              floatingActionButton: RawMaterialButton(
                onPressed: () =>
                {
                  Navigator.popUntil(
                      context, ModalRoute.withName(HomePage.routeName)),
                },
                child: const Text(
                  "Home",
                  style: TextStyle(fontSize: 30),
                ),
              ),


            );
          }
        }
      }
    );
  }
}