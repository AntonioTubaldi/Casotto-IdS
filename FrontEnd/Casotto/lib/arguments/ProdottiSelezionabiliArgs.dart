import '../models/Prodotto.dart';

class ProdottiSelezionabiliArgs {
  late List<Prodotto> lista;

  ProdottiSelezionabiliArgs(List<Prodotto> lista) {
    this.lista = lista;
  }
}
