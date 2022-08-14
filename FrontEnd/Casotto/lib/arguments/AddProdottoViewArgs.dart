import 'package:casotto/models/Prodotto.dart';

import '../models/SlotData.dart';

class SceltaProdottiViewArgs {
  late Prodotto prodotto;
  late List<Prodotto> lista;

  SceltaProdottiViewArgs(Prodotto prodotto, List<Prodotto> lista) {
    this.prodotto = prodotto;
    this.lista = lista;
  }
}
