import 'package:casotto/models/Prodotto.dart';
import 'package:flutter/material.dart';
import '../arguments/ProdottoStringArgs.dart';
import '../arguments/SingleProdottoViewArgs.dart';
import 'ConfermaEliminazioneProdotto.dart';
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
          title: const Text("Scheda Prodotto"),
          backgroundColor: Colors.teal,
        ),
        floatingActionButton: RawMaterialButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(HomePage.routeName),
            );
          },
          fillColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          constraints: const BoxConstraints.tightFor(height: 50.0, width: 110),
          child: const Text(
            "HOME",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(width: 75.0),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Text("prodotto: ${singleProdotto.getNome()}",
                        style: const TextStyle(fontSize: 20)),
                    Text(
                      "prezzo: ${singleProdotto.getPrezzo()} Euro",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ] //children
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
                    ConfermaEliminazioneProdottoView.routeName,
                    arguments: SingleProdottoViewArgs(singleProdotto),
                    ModalRoute.withName(HomePage.routeName),
                  ),
                },
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints: const BoxConstraints.tightFor(height: 50.0, width: 200),
                child: const Text(
                  "Elimina Prodotto",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
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
                fillColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                constraints: const BoxConstraints.tightFor(height: 50.0, width: 200),
                child: const Text(
                  "Modifica Prodotto",
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
              ),
            ),
          ]),
        ));
  }
}
