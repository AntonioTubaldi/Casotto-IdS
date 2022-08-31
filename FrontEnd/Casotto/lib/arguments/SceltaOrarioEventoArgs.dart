class SceltaOrarioEventoArgs {
  late String nome;
  late int numeroMaxPartecipanti;
  late DateTime data;

  SceltaOrarioEventoArgs(
      String nome, int numeroMaxPartecipanti, DateTime data) {
    this.nome = nome;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
    this.data = data;
  }
}
