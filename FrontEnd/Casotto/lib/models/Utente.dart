import 'package:casotto/models/Evento.dart';

import 'Notifica.dart';
import 'Ruolo.dart';

class Utente {
  late String idUtente;
  late String _nome;
  late String _cognome;
  late List<Notifica> _notifiche;
  late Ruolo _ruolo;
  late List<Evento> eventiAderiti;

  Utente(String idUtente, String nome, String cognome, List<Notifica> notifiche,
      Ruolo ruolo, List<Evento> eventiAderiti) {
    this.idUtente = idUtente;
    this._nome = nome;
    this._cognome = cognome;
    this._notifiche = notifiche;
    this._ruolo = ruolo;
    this.eventiAderiti = eventiAderiti;
  }

  String getIdUtente() {
    return this.idUtente;
  }

  void setIdUtente(String idUtente) {
    this.idUtente = idUtente;
  }

  String getNome() {
    return this._nome;
  }

  void setNome(String nome) {
    this._nome = nome;
  }

  String getCognome() {
    return this._cognome;
  }

  void setCognome(String cognome) {
    this._cognome = cognome;
  }

  List<Notifica> getNotifiche() {
    return this._notifiche;
  }

  void setNotifiche(List<Notifica> notifiche) {
    this._notifiche = notifiche;
  }

  Ruolo getRuolo() {
    return this._ruolo;
  }

  String getRuoloString() {
    switch (this._ruolo) {
      case Ruolo.OSPITE:
        return "OSPITE";
      case Ruolo.REGISTRATO:
        return "REGISTRATO";
      case Ruolo.LOGGATO:
        return "LOGGATO";
      case Ruolo.GESTORE:
        return "GESTORE";
      case Ruolo.ADDETTO_SPIAGGIA:
        return "ADDETTO SPIAGGIA";
    }
  }

  void setRuolo(Ruolo ruolo) {
    this._ruolo = ruolo;
  }

  @override
  String toString() {
    return "id utente: " +
        this.idUtente +
        " nome " +
        this._nome +
        " cognome: " +
        this._cognome +
        " notifiche: " +
        this._notifiche.toString() +
        " ruolo_: " +
        this._ruolo.toString();
  }
}
