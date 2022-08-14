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
  const RiepilogoOrdinazioneView({Key? key, required this.lista})
      : super(key: key);

  static const String routeName = "RiepilogoOrdinazione";

  final List<Prodotto> lista;

  double contaPrezzo(List<Prodotto> lista) {
    double totale = 0;
    lista.forEach((element) {
      totale += element.getPrezzo();
    });
    return totale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text("Riepilogo Ordinazione")),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Costo Ordinazione:  ${contaPrezzo(lista)}  euro",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RawMaterialButton(
              onPressed: () => {},
              child: Text(
                "Conferma Ordinazione",
                style: TextStyle(color: Colors.white),
              ),
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
}
