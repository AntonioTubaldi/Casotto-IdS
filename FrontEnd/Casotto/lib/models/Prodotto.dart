class Prodotto {
  late String nome;
  late double prezzo;

  Prodotto(String nome, double prezzo) {
    this.nome = nome;
    this.prezzo = prezzo;
  }

  String getNome() {
    return this.nome;
  }

  double getPrezzo() {
    return this.prezzo;
  }

  void setPrezzo(double newPrezzo) {
    this.prezzo = newPrezzo;
  }
}
