import 'StatoStruttura.dart';

class Struttura {
  late String idStruttura;
  late String nome;
  late StatoStruttura stato;

  Struttura(String idStruttura, String nome, StatoStruttura stato) {
    this.idStruttura = idStruttura;
    this.nome = nome;
    this.stato = stato;
  }

  String getIdStruttura() {
    return this.idStruttura;
  }

  String getNome() {
    return this.nome;
  }

  void setNome(String newNome) {
    this.nome = newNome;
  }

  StatoStruttura getStatoStruttura() {
    return this.stato;
  }

  void setStatoStruttura(StatoStruttura newStatoStruttura) {
    this.stato = newStatoStruttura;
  }

  String getStatoStrutturaString() {
    switch (this.stato) {
      case StatoStruttura.LIBERA:
        return "LIBERA";
      case StatoStruttura.OCCUPATA:
        return "OCCUPATA";
    }
  }

  @override
  String toString() {
    return "Struttura{" +
        "idStruttura='" +
        idStruttura +
        '\'' +
        ", nome=" +
        nome +
        ", stato" +
        stato.toString() +
        '}';
  }
}
