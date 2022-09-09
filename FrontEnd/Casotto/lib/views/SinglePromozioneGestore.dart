import 'package:casotto/models/Promozione.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomePage.dart';

class SinglePromozioneGestoreView extends StatelessWidget {
  const SinglePromozioneGestoreView({Key? key, required this.singlePromozione})
      : super(key: key);

  final Promozione singlePromozione;
  static const String routeName = "SinglePromozioneGestore";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scheda Promozione"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.routeName,
            arguments: const HomePage(),
            ModalRoute.withName(HomePage.routeName),
          );
        },
        child: const Text(
          "HOME",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Prodotto: ${singlePromozione.getIdProdotto()}",
                style: const TextStyle(fontSize: 20)),
            Text(
              "Prezzo originale: ${singlePromozione.getOriginalPrezzo()} Euro",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Nuovo prezzo: ${singlePromozione.getNewPrezzo()} Euro",
              style: const TextStyle(fontSize: 20),
            ),
            //children

            RawMaterialButton(
              onPressed: () => {},
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints:
                  const BoxConstraints.tightFor(height: 50.0, width: 200),
              child: const Text(
                "Elimina Promozione",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),

            RawMaterialButton(
              onPressed: () => {},
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints:
                  const BoxConstraints.tightFor(height: 50.0, width: 200),
              child: const Text(
                "Modifica Promozione",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
