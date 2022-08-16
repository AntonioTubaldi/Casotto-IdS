

import '../models/Prodotto.dart';

class AddOrdineViewArgs {
 /* late String idOrdine;
  late String idUtente ;
  late double costoTotale;*/
  late List<Prodotto> prodotti;

  AddOrdineViewArgs(/*String idOrdine, String idUtente,
       double costoTotale,*/ List<Prodotto> prodotti,) {
    /*this.idOrdine = idOrdine;
    this.idUtente = idUtente;
    this.costoTotale = costoTotale;*/
    this.prodotti = prodotti;
  }
}
