import 'package:flutter/material.dart';

class ModificaEventoArgs {
  late String idEvento;
  late DateTime data;
  late TimeOfDay orarioInizio;
  late int numeroMaxPartecipanti;

  ModificaEventoArgs(String idEvento, DateTime data, TimeOfDay orarioInizio,
      int numeroMaxPartecipanti) {
    this.idEvento = idEvento;
    this.data = data;
    this.orarioInizio = orarioInizio;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
  }
}
