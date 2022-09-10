import 'package:casotto/models/Promozione.dart';
import 'package:casotto/views/EliminaPromozione.dart';
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
      appBar: AppBar(
        title: const Text("Scheda Promozione"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("Prodotto: ${singlePromozione.getIdProdotto()}",
                        style: const TextStyle(fontSize: 20)),
                    Text(
                        "Prezzo originale: ${singlePromozione.getOriginalPrezzo()} Euro",
                        style: const TextStyle(fontSize: 20)),
                    Text(
                      "Nuovo prezzo: ${singlePromozione.getNewPrezzo()} Euro",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RawMaterialButton(
                onPressed: () => {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    EliminaPromozioneView.routeName,
                    arguments: SinglePromozioneGestoreView(
                        singlePromozione: singlePromozione),
                    ModalRoute.withName(HomePage.routeName),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints:
                    const BoxConstraints.tightFor(height: 50.0, width: 220),
                child: const Text(
                  "Elimina Promozione",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: () => {},
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints:
                  const BoxConstraints.tightFor(height: 50.0, width: 220),
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
