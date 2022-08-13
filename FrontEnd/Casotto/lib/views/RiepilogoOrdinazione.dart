import 'package:casotto/arguments/RiepilogoOrdinazioneViewArgs.dart';
import 'package:casotto/widgets/SelectableProdottiTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../arguments/AddProdottoViewArgs.dart';
import '../models/Prodotto.dart';
import '../models/SlotData.dart';
import '../widgets/SelectableSlotDataTab.dart';
import 'AddProdotto.dart';
import 'HomePage.dart';

class RiepilogoOrdinazioneView extends StatelessWidget {
  const RiepilogoOrdinazioneView({Key? key,
    required this.prodotto,
    required this.lista,

    required this.numeroProdotti
  })
      : super(key: key);

  static const String routeName = "RiepilogoOrdinazione";


  final Prodotto prodotto;
  final List<Prodotto> lista;
  final int numeroProdotti;

  Widget _getRiepilogoOrdinazione(Prodotto prodotto,
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Ordinazione")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Costo Ordinazione: ${(prodotto.getPrezzo() *
                      lista.length) +
                      (prodotto.getPrezzo() * numeroProdotti)} euro",
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            _getScrollableView(lista)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RawMaterialButton(
              onPressed: () =>
              {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AddProdottoView.routeName,
                  arguments: SceltaProdottiViewArgs(
                    prodotto,
                    lista,
                    numeroProdotti
                    ),
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: Text("Conferma Ordinazione",
                  style: TextStyle(color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 205),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                );
              },
              child: Text(
                "Torna alla Home",
                style: TextStyle(color: Colors.white),
              ),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getProdottiTabs(List<Prodotto> lista) {
    return lista.map((Prodotto prodotto) {
      return SelectableProdottiTab(
        child: prodotto,
        isActivated: true,
        onPressed: null,
      );
    }).toList();
  }

  Widget _getScrollableView(List<Prodotto> lista) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getProdottiTabs(lista),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getRiepilogoOrdinazione(prodotto, context);
  }
}