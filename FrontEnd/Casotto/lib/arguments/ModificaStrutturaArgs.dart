import 'package:casotto/models/StatoStruttura.dart';

class ModificaStrutturaArgs {
  late String idStruttura;
  late String nome;
  late StatoStruttura stato;

  ModificaStrutturaArgs(String idStruttura, String nome, StatoStruttura stato) {
    this.idStruttura = idStruttura;
    this.nome = nome;
    this.stato = stato;
  }
}
