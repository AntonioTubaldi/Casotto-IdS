import 'package:casotto/models/Prodotto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ProdottoStringArgs.dart';
import 'HomePage.dart';
import 'ProdottoEliminato.dart';
import 'SceltaPrezzoProdotto.dart';

class SingleProdottoView extends StatelessWidget {
  const SingleProdottoView({Key? key, required this.singleProdotto})
      : super(key: key);

  final Prodotto singleProdotto;
  static const String routeName = "SingleProdotto";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheda Prodotto"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                singleProdotto.getNome(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                singleProdotto.getPrezzo().toString(),
              ),
            ),
            RawMaterialButton(
              onPressed: () => {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ProdottoEliminatoView.routeName,
                  arguments: ProdottoStringArgs(
                    singleProdotto.getNome(),
                  ),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: const Text(
                "Elimina Prodotto",
                style: TextStyle(fontSize: 30),
              ),
            ),
            RawMaterialButton(
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  SceltaPrezzoProdottoView.routeName,
                  arguments: ProdottoStringArgs(
                    singleProdotto.getNome(),
                  ),
                ),
              },
              child: const Text(
                "Modifica Prodotto",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
