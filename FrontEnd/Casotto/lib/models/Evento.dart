import 'package:flutter/material.dart';

class Evento {
  late String idEvento;
  late String nome;
  late DateTime data;
  late TimeOfDay orarioInizio;
  late int numeroMaxPartecipanti;
  late int numeroPartecipanti;

  Evento(String idEvento, String nome, DateTime data, TimeOfDay orarioInizio,
      int numeroMaxPartecipanti, int numeroPartecipanti) {
    this.idEvento = idEvento;
    this.nome = nome;
    this.data = data;
    this.orarioInizio = orarioInizio;
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
    this.numeroPartecipanti = numeroPartecipanti;
  }

  getIdEvento() {
    return idEvento;
  }

  void setIdEvento(String idEvento) {
    this.idEvento = idEvento;
  }

  String getNome() {
    return nome;
  }

  void setNome(String nome) {
    this.nome = nome;
  }

  DateTime getData() {
    return data;
  }

  String getDataString() {
    return "${this.data.day}-${this.data.month}-${this.data.year}";
  }

  void setData(DateTime data) {
    this.data = data;
  }

  TimeOfDay getOrarioInizio() {
    return orarioInizio;
  }

  String getOrarioInizioString() {
    return "${this.orarioInizio.hour}:${this.orarioInizio.minute}";
  }

  void setOrarioInizio(TimeOfDay orarioInizio) {
    this.orarioInizio = orarioInizio;
  }

  int getNumeroPartecipanti() {
    return numeroPartecipanti;
  }

  void setNumeroPartecipanti(int numeroPartecipanti) {
    this.numeroPartecipanti = numeroPartecipanti;
  }

  int getNumeroMaxPartecipanti() {
    return numeroMaxPartecipanti;
  }

  void setNumeroMaxPartecipanti(int numeroMaxPartecipanti) {
    this.numeroMaxPartecipanti = numeroMaxPartecipanti;
  }

  @override
  String toString() {
    return "Evento{" +
        "idEvento=" +
        idEvento +
        ", nome=" +
        nome +
        ", Data=" +
        data.toString() +
        "Orario inizio: " +
        orarioInizio.toString() +
        "numero max partecipanti" +
        numeroMaxPartecipanti.toString() +
        "numero partecipanti: " +
        numeroPartecipanti.toString() +
        " }";
  }
}
