import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SinglePromozioneArgs.dart';
import '../models/Promozione.dart';
import 'EliminaPromozione.dart';
import 'HomePage.dart';

class ConfermaEliminazionePromozioneView extends StatelessWidget {
  const ConfermaEliminazionePromozioneView(
      {Key? key, required this.singlePromozione})
      : super(key: key);

  final Promozione singlePromozione;
  static const String routeName = "ConfermaEliminazionePromozione";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Eliminazione promozione"),
      ),
      floatingActionButton: RawMaterialButton(
        fillColor: Colors.teal,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Stai per eliminare la seguente promozione: "),
            Text(singlePromozione.idProdotto +
                " da " +
                singlePromozione.getOriginalPrezzo().toString() +
                " euro a " +
                singlePromozione.getNewPrezzo().toString() +
                " euro"),
            SizedBox(height: 20),
            Text(
              "Sei sicuro?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            RawMaterialButton(
              fillColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  EliminaPromozioneView.routeName,
                  arguments: SinglePromozioneArgs(
                    singlePromozione,
                  ),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
