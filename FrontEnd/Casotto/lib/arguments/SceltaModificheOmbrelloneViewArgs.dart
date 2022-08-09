class SceltaModificheOmbrelloneViewArgs {
  late String idOmbrellone;
  late double prezzo;
  late int posizione;
  late double prezzoLettini;
  late double prezzoSdraio;

  SceltaModificheOmbrelloneViewArgs(String idOmbrellone, double prezzo,
      int posizione, double prezzoLettini, double prezzoSdraio) {
    this.idOmbrellone = idOmbrellone;
    this.prezzo = prezzo;
    this.posizione = posizione;
    this.prezzoLettini = prezzoLettini;
    this.prezzoSdraio = prezzoSdraio;
  }
}
