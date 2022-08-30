

class Attrezzatura{

  late String nome;
  late int quantita;

  Attrezzatura(String nome, int quantita){
    this.nome = nome;
    this.quantita = quantita;
  }

  String getNome(){
    return nome;
  }

  void setNome(String nome){
  this.nome = nome;
  }

  int getQuantita(){
    return quantita;
  }

  void setQuanita(int quantita){
    this.quantita = quantita;
  }

  String toString() {
    return "Attrezzatura{" +
        "Nome=" +
        nome +
        ", quantità= " +
        quantita.toString() +
        " }";

  }

}