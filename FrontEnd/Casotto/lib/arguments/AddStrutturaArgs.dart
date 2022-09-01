import '../models/StatoStruttura.dart';

class AddStrutturaArgs {
  late String nome;
  late StatoStruttura stato;

  AddStrutturaArgs(String nome, StatoStruttura stato) {
    this.nome = nome;
    this.stato = stato;
  }
}
