import '../models/Prodotto.dart';

class AddOrdineViewArgs {
  late String idUtente;
  late double costoTotale;
  late List<Prodotto> prodotti;

  AddOrdineViewArgs(
    String idUtente,
    double costoTotale,
    List<Prodotto> prodotti,
  ) {
    this.idUtente = idUtente;
    this.costoTotale = costoTotale;
    this.prodotti = prodotti;
  }
}
