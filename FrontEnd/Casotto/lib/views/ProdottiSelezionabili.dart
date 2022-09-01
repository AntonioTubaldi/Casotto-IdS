import 'package:casotto/arguments/ProdottiSelezionabiliArgs.dart';
import 'package:casotto/views/RiepilogoOrdinazione.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../arguments/AddProdottoViewArgs.dart';
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

  Widget? _showOrdinazione() {
    if (_prodottiSelezionati.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(color: Colors.teal, Icons.shopping_cart),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RiepilogoOrdinazioneView.routeName,
                  arguments: ProdottiSelezionabiliArgs(
                    _prodottiSelezionati.toList(),
                  ),
                );
              }),
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showOrdinazione(),
      appBar: AppBar(
        title: Text("Schermata Ordinazione"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getScrollableView(widget.lista),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(color: Colors.teal, Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  arguments: const HomePage(),
                  ModalRoute.withName(HomePage.routeName),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
