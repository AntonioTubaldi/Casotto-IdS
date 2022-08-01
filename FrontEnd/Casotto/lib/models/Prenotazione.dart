import 'dart:io';

import 'SlotData.dart';
import 'StatoPrenotazione.dart';

class Prenotazione {
  late String idPrenotazione;
  late String _idUtente;
  late String _idOmbrellone;
  late double _costoTotale;
  late List<SlotData> _dataPrenotazione;
  late StatoPrenotazione _statoPrenotazione;
  late int numeroLettini;
  late int numeroSdraio;

  Prenotazione(
      String idPrenotazione,
      String idUtente,
      String idOmbrellone,
      double costoTotale,
      List<SlotData> dataPrenotazione,
      StatoPrenotazione statoPrenotazione,
      int numeroLettini,
      int numeroSdraio) {
    this.idPrenotazione = idPrenotazione;
    this._idUtente = idUtente;
    this._idOmbrellone = idOmbrellone;
    this._costoTotale = costoTotale;
    this._dataPrenotazione = dataPrenotazione;
    this._statoPrenotazione = statoPrenotazione;
    this.numeroLettini = numeroLettini;
    this.numeroSdraio = numeroSdraio;
  }
  Prenotazione.nienteId(
      String idUtente,
      String idOmbrellone,
      double costoTotale,
      List<SlotData> dataPrenotazione,
      StatoPrenotazione statoPrenotazione,
      int numeroLettini,
      int numeroSdraio) {
    this._idUtente = idUtente;
    this._idOmbrellone = idOmbrellone;
    this._costoTotale = costoTotale;
    this._dataPrenotazione = dataPrenotazione;
    this._statoPrenotazione = statoPrenotazione;
    this.numeroLettini = numeroLettini;
    this.numeroSdraio = numeroSdraio;
  }

  String getIdPrenotazione() {
    return this.idPrenotazione;
  }

  void setIdPrenotazione(String idPrenotazione) {
    this.idPrenotazione = idPrenotazione;
  }

  String getIdUtente() {
    return this._idUtente;
  }

  void setIdUtente(String idUtente) {
    this._idUtente = idUtente;
  }

  String getIdOmbrellone() {
    return this._idOmbrellone;
  }

  void setIdOmbrellone(String idOmbrellone) {
    this._idOmbrellone = idOmbrellone;
  }

  double getCostoTotale() {
    return this._costoTotale;
  }

  void setCostoTotale(double costoTotale) {
    this._costoTotale = costoTotale;
  }

  List<SlotData> getDataPrenotazione() {
    return this._dataPrenotazione;
  }

  void setDataPrenotazione(List<SlotData> dataPrenotazione) {
    this._dataPrenotazione = dataPrenotazione;
  }

  StatoPrenotazione getStatoPrenotazione() {
    return this._statoPrenotazione;
  }

  void setStatoPrenotazione(StatoPrenotazione statoPrenotazione) {
    this._statoPrenotazione = statoPrenotazione;
  }

  int getNumeroLettini() {
    return this.numeroLettini;
  }

  void setNumeroLettini(int numeroLettini) {
    this.numeroLettini = numeroLettini;
  }

  int getNumeroSdraio() {
    return this.numeroSdraio;
  }

  void setNumeroSdraio(int numeroSdraio) {
    this.numeroSdraio = numeroSdraio;
  }

  String getStatoPrenotazioneString() {
    switch (this._statoPrenotazione) {
      case StatoPrenotazione.APERTA:
        return "APERTA";
      case StatoPrenotazione.CONFERMATA:
        return "CONFERMATA";
    }
  }

  @override
  String toString() {
    return "Id Prenotazione: " +
        this.idPrenotazione +
        " id utente: " +
        this._idUtente +
        " id ombrellone: " +
        this._idOmbrellone +
        " costo totale: " +
        this._costoTotale.toString() +
        " data prenotazione: " +
        this._dataPrenotazione.toString() +
        " stato prenotazione: " +
        this._statoPrenotazione.toString();
  }
}
