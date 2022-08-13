import 'package:casotto/models/Prodotto.dart';
import 'package:casotto/views/SceltaProdotti.dart';

import '../models/SlotData.dart';

class SceltaProdottiViewArgs {
  late Prodotto prodotto;
  late List<Prodotto> lista;
  late int numeroProdotti;

  SceltaProdottiViewArgs(Prodotto prodotto, List<Prodotto> lista, int numeroProdotti) {
    this.prodotto = prodotto;
    this.lista = lista;
    this.numeroProdotti = numeroProdotti;
  }
  }