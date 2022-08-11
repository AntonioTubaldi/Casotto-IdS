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
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          SizedBox(width: 100.0),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child:
                Container(
                  child: Padding(
                    
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "prodotto: ${singleProdotto.getNome()}",
                            style: const TextStyle(fontSize: 20)
                        ),
                     Text(
                      "prezzo: ${singleProdotto.getPrezzo()} euro",
                      style: TextStyle(fontSize: 20),
                    ),
                     ] //children
                       ),
                  ),
              ),
        )
        ]
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
            ),
              const Text(
                "Elimina Prodotto",
                style: TextStyle(fontSize: 30),
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

     ] ),
    ));
  }
}
