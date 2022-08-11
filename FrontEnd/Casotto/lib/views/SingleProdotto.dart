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
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(width: 75.0),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text("prodotto: ${singleProdotto.getNome()}",
                          style: const TextStyle(fontSize: 20)),
                      Text(
                        "prezzo: ${singleProdotto.getPrezzo()} Euro",
                        style: TextStyle(fontSize: 20),
                      ),
                    ] //children
                        ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
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
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints: BoxConstraints.tightFor(height: 50.0, width: 200),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
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
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints: BoxConstraints.tightFor(height: 50.0, width: 200),
              ),
            ),
          ]),
        ));
  }
}
