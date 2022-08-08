class AddOmbrelloneViewArgs {
  late double prezzo;
  late int posizione;
  late double prezzoLettini;
  late double prezzoSdraio;

  AddOmbrelloneViewArgs(
      double prezzo, int posizione, double prezzoLettini, double prezzoSdraio) {
    this.prezzo = prezzo;
    this.posizione = posizione;
    this.prezzoLettini = prezzoLettini;
    this.prezzoSdraio = prezzoSdraio;
  }
}
