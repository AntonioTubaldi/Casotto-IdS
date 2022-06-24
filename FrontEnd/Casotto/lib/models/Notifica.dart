class Notifica {
  late String titolo;
  late String descrizione;

  Notifica(String titolo, String descrizione) {
    this.titolo = titolo;
    this.descrizione = descrizione;
  }

  String getTitolo() {
    return this.titolo;
  }

  void setTitolo(String titolo) {
    this.titolo = titolo;
  }

  String getDescrizione() {
    return this.descrizione;
  }

  void setDescrizione(String descrizione) {
    this.descrizione = descrizione;
  }
}
