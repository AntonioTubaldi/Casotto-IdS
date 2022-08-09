import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/Prodotto.dart';
import '../widgets/SelectableProdottiTab.dart';
import 'HomePage.dart';

class ProdottiSelezionabiliView extends StatefulWidget {
  const ProdottiSelezionabiliView({Key? key, required this.lista})
      : super(key: key);

  final List<Prodotto> lista;

  static const String routeName = "ProdottiSelezionabili";

  @override
  State<ProdottiSelezionabiliView> createState() =>
      _ProdottiSelezionabiliViewState();
}

class _ProdottiSelezionabiliViewState extends State<ProdottiSelezionabiliView> {
  Set<Prodotto> _prodottiSelezionati = Set();

  List<Widget> _getProdottiTabs(List<Prodotto> disponibilita) {
    return disponibilita.map((Prodotto prodotti) {
      return SelectableProdottiTab(
        child: prodotti,
        isActivated: _prodottiSelezionati.contains(prodotti),
        onPressed: () => {
          setState(
            () => {
              if (_prodottiSelezionati.contains(prodotti))
                {_prodottiSelezionati.remove(prodotti)}
              else
                {_prodottiSelezionati.add(prodotti)}
            },
          )
        },
      );
    }).toList();
  }

  Widget _getScrollableView(List<Prodotto> disponibilita) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getProdottiTabs(disponibilita),
      ),
    );
  }

  Widget? _showPrenotazione() {
    if (_prodottiSelezionati.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () => {},
            child: Text(
              "PROCEDI ALL'ACQUISTO",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            fillColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            constraints: BoxConstraints.tightFor(height: 50.0, width: 160),
          ),
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showPrenotazione(),
      appBar: AppBar(
        title: Text("Schermata Prenotazione"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            _getScrollableView(widget.lista),
            RawMaterialButton(
              onPressed: () => {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                ),
              },
              child: const Text("Home",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              fillColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              constraints: BoxConstraints.tightFor(height: 50.0, width: 130),
            ),
          ],
        ),
      ),
    );
  }
}
