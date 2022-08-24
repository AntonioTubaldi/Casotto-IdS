import '../models/Prodotto.dart';

class AddOrdineViewArgs {
  late String idUtente;
  late String idOmbrellone;
  late double costoTotale;
  late List<Prodotto> prodotti;

  AddOrdineViewArgs(
    String idUtente,
    String idOmbrellone,
    double costoTotale,
    List<Prodotto> prodotti,
  ) {
    this.idUtente = idUtente;
    this.idOmbrellone = idOmbrellone;
    this.costoTotale = costoTotale;
    this.prodotti = prodotti;
  }
}
