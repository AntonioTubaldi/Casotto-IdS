import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/SingleProdottoViewArgs.dart';
import '../models/Prodotto.dart';
import '../views/SingleProdotto.dart';

class ProdottiTab extends StatelessWidget {
  const ProdottiTab({Key? key, required this.child}) : super(key: key);

  final Prodotto child;

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
            SingleProdottoView.routeName,
            arguments: SingleProdottoViewArgs(child),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ' + child.getNome(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Prezzo: ' + child.getPrezzo().toString(),
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
