class ModificaOrarioEventoArgs {
  late String idEvento;
  late DateTime data;
  late int numeroMaxPartecipanti;

  ModificaOrarioEventoArgs(
      String idEvento, DateTime data, int numeroMaxPartecipanti) {
    this.idEvento = idEvento;
    this.data = data;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
  }
}
