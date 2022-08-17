import 'Prodotto.dart';
import 'StatoOrdine.dart';

class Ordine {
  late String idOrdine;
  late String idUtente;
  late double costoTotale;
  late List<Prodotto> prodotti;
  late StatoOrdine stato;

  Ordine(String idOrdine, String idUtente, double costoTotale,
      List<Prodotto> prodotti, StatoOrdine stato) {
    this.idOrdine = idOrdine;
    this.idUtente = idUtente;
    this.costoTotale = costoTotale;
    this.prodotti = prodotti;
    this.stato = stato;
  }

  String getIdOrdine() {
    return idOrdine;
  }

  String getIdUtente() {
    return idUtente;
  }

  double getCostoTotale() {
    return costoTotale;
  }

  List<Prodotto> getListProdotti() {
    return prodotti;
  }

  void setIdOrdine(String idOrdine) {
    this.idOrdine = idOrdine;
  }

  void setIdUtente(String idUtente) {
    this.idUtente = idUtente;
  }

  void setCostoTotale(double costoTotale) {
    this.costoTotale = costoTotale;
  }

  void setListProdotti(List<Prodotto> prodotti) {
    this.prodotti = prodotti;
  }

  StatoOrdine getStato() {
    return stato;
  }

  void setStato(StatoOrdine newStato) {
    this.stato = newStato;
  }

  String getStatoString() {
    switch (this.stato) {
      case StatoOrdine.DA_GESTIRE:
        return "DA_GESTIRE";
      case StatoOrdine.CHIUSO:
        return "CHIUSO";
    }
  }

  @override
  String toString() {
    return "Ordine{" +
        "idOrdine=" +
        idOrdine +
        ", idUtente=" +
        idUtente +
        ", prezzo=" +
        costoTotale.toString() +
        "${"Lista prodotti ordinati: $prodotti"}; " +
        "StatoOrdine:" +
        stato.toString();
  }
}
