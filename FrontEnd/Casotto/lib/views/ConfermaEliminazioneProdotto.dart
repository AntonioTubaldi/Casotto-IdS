import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/ProdottoStringArgs.dart';
import '../models/Prodotto.dart';
import 'HomePage.dart';
import 'ProdottoEliminato.dart';

class ConfermaEliminazioneProdottoView extends StatefulWidget {
  const ConfermaEliminazioneProdottoView(
      {Key? key, required this.singleProdotto})
      : super(key: key);

  final Prodotto singleProdotto;
  static const String routeName = "ConfermaEliminazioneProdotto";

  @override
  State<ConfermaEliminazioneProdottoView> createState() =>
      _ConfermaEliminazioneProdottoViewState();
}

class _ConfermaEliminazioneProdottoViewState
    extends State<ConfermaEliminazioneProdottoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Eliminazione prodotto"),
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
            Text("Stai per eliminare il seguente prodotto: "),
            Text(
              widget.singleProdotto.getNome(),
            ),
            Text(
              "Sei sicuro?",
              style: TextStyle(color: Colors.white),
            ),
            RawMaterialButton(
              fillColor: Colors.teal,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ProdottoEliminatoView.routeName,
                  arguments: ProdottoStringArgs(
                    widget.singleProdotto.getNome(),
                  ),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text("CONFERMA", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
