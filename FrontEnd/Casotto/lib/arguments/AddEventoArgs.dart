import 'package:flutter/material.dart';

class AddEventoArgs {
  late String nome;
  late DateTime data;
  late TimeOfDay orarioInizio;
  late int numeroMaxPartecipanti;

  AddEventoArgs(String nome, DateTime data, TimeOfDay orarioInizio,
      int numeroMaxPartecipanti) {
    this.nome = nome;
    this.data = data;
    this.orarioInizio = orarioInizio;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
  }
}
