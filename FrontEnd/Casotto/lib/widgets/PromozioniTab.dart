import 'package:casotto/models/Promozione.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SinglePromozioneArgs.dart';
import '../views/SinglePromozioneGestore.dart';

class PromozioniTab extends StatelessWidget {
  const PromozioniTab({Key? key, required this.singlePromozione})
      : super(key: key);

  final Promozione singlePromozione;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushNamed(
            context,
            SinglePromozioneGestoreView.routeName,
            arguments: SinglePromozioneArgs(singlePromozione),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prodotto: ' + singlePromozione.getIdProdotto(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Prezzo originale: ' +
                  singlePromozione.getOriginalPrezzo().toString(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Nuovo prezzo: ' + singlePromozione.getNewPrezzo().toString(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
