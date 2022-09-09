class Promozione {
  late String idPromozione;
  late String idProdotto;
  late double originalPrezzo;
  late double newPrezzo;

  Promozione(String idPromozione, String idProdotto, double originalPrezzo,
      double newPrezzo) {
    this.idPromozione = idPromozione;
    this.idProdotto = idProdotto;
    this.originalPrezzo = originalPrezzo;
    this.newPrezzo = newPrezzo;
  }

  String getIdPromozione() {
    return this.idPromozione;
  }

  String getIdProdotto() {
    return this.idProdotto;
  }

  void setIdProdotto(String idProdotto) {
    this.idProdotto = idProdotto;
  }

  double getOriginalPrezzo() {
    return this.originalPrezzo;
  }

  void setOriginalPrezzo(double originalPrezzo) {
    this.originalPrezzo = originalPrezzo;
  }

  double getNewPrezzo() {
    return this.newPrezzo;
  }

  void setNewPrezzo(double newPrezzo) {
    this.newPrezzo = newPrezzo;
  }
}
