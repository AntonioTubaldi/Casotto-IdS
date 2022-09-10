import 'package:casotto/services/PromozioneService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class ModificaPromozioneView extends StatefulWidget {
  const ModificaPromozioneView(
      {Key? key, required this.idPromozione, required this.newPrezzo})
      : super(key: key);

  static const String routeName = "ModificaPromozione";
  final String idPromozione;
  final double newPrezzo;

  @override
  State<ModificaPromozioneView> createState() => _ModificaPromozioneViewState();
}

class _ModificaPromozioneViewState extends State<ModificaPromozioneView> {
  PromozioneService promozioneService = new PromozioneService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: promozioneService.modificaPromozione(
          widget.idPromozione, widget.newPrezzo),
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
                  title: const Text('Prodotto Modificato'),
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
                body: const Center(
                  child: Text("La promozione è stata modificata"),
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
