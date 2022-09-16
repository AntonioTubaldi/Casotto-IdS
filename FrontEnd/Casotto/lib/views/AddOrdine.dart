import 'package:casotto/services/OrdineService.dart';
import 'package:flutter/material.dart';

import '../models/Prodotto.dart';
import 'HomePage.dart';
import 'MessageScreen.dart';

class AddOrdineView extends StatefulWidget {
  const AddOrdineView({
    Key? key,
    required this.idUtente,
    required this.idOmbrellone,
    required this.costoTotale,
    required this.prodotti,
  }) : super(key: key);

  final String idUtente;
  final String idOmbrellone;
  final double costoTotale;
  final List<Prodotto> prodotti;

  static const String routeName = "AddOrdine";

  @override
  State<AddOrdineView> createState() => _AddOrdineViewState();
}

class _AddOrdineViewState extends State<AddOrdineView> {
  OrdineService ordineService = new OrdineService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: ordineService.addOrdine(widget.idUtente, widget.idOmbrellone,
          widget.costoTotale, widget.prodotti),
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
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.teal,
                  title: const Text('Riepilogo'),
                ),
                body: Center(
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Ordinazione Confermata",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
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
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Ops! Qualcosa è andato storto!'),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Qualcosa è andato storto",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
