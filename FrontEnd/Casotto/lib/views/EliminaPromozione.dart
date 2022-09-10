import 'package:casotto/services/PromozioneService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';
import 'MessageScreen.dart';

class EliminaPromozioneView extends StatefulWidget {
  const EliminaPromozioneView({Key? key, required this.idPromozione})
      : super(key: key);

  static const String routeName = "EliminaPromozione";
  final String idPromozione;

  @override
  State<EliminaPromozioneView> createState() => _EliminaPromozioneViewState();
}

class _EliminaPromozioneViewState extends State<EliminaPromozioneView> {
  PromozioneService promozioneService = new PromozioneService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: promozioneService.rimuoviPromozione(widget.idPromozione),
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
            } else if (snapshot.hasData & snapshot.hasData == true) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Riepilogo'),
                ),
                body: Column(
                  children: [
                    const Text(
                      "Promozione eliminata",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          arguments: const HomePage(),
                          ModalRoute.withName(HomePage.routeName),
                        );
                      },
                      child: const Text("HOME"),
                    ),
                  ],
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Riepilogo'),
                ),
                body: Column(
                  children: [
                    const Text(
                      "Ops! Qualcosa è andato storto!",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          arguments: const HomePage(),
                          ModalRoute.withName(HomePage.routeName),
                        );
                      },
                      child: const Text("HOME"),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
