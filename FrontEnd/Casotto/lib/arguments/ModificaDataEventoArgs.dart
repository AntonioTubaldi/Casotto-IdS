class ModificaDataEventoArgs {
  late String idEvento;
  late int numeroMaxPartecipanti;

  ModificaDataEventoArgs(String idEvento, int numeroMaxPartecipanti) {
    this.idEvento = idEvento;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
  }
}
