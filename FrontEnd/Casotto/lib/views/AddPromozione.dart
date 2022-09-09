import 'package:casotto/services/PromozioneService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class AddPromozioneView extends StatefulWidget {
  const AddPromozioneView(
      {Key? key, required this.idProdotto, required this.newPrezzo})
      : super(key: key);

  final String idProdotto;
  final double newPrezzo;

  static const String routeName = "AddPromozione";

  @override
  State<AddPromozioneView> createState() => _AddPromozioneViewState();
}

class _AddPromozioneViewState extends State<AddPromozioneView> {
  PromozioneService promozioneService = new PromozioneService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          promozioneService.addPromozione(widget.idProdotto, widget.newPrezzo),
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
                          Text("La promozione è stata aggiunta correttamente")),
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
