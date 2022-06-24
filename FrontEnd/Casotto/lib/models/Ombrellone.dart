import 'SlotData.dart';

class Ombrellone {
  late String idOmbrellone;
  late double _prezzo;
  late int _posizione;
  late List<SlotData> _disponibilita;

  Ombrellone(String idOmbrellone, double prezzo, int posizione,
      List<SlotData> disponibilita) {
    this.idOmbrellone = idOmbrellone;
    this._prezzo = prezzo;
    this._posizione = posizione;
    this._disponibilita = disponibilita;
  }

  Ombrellone.nienteId(
      double prezzo, int posizione, List<SlotData> disponibilita) {
    this._prezzo = prezzo;
    this._posizione = posizione;
    this._disponibilita = disponibilita;
  }

  String getIdOmbrellone() {
    return this.idOmbrellone;
  }

  void setIdOmbrellone(String idOmbrellone) {
    this.idOmbrellone = idOmbrellone;
  }

  double getPrezzo() {
    return this._prezzo;
  }

  void setPrezzo(double prezzo) {
    this._prezzo = prezzo;
  }

  int getPosizione() {
    return this._posizione;
  }

  void setPosizione(int posizione) {
    this._posizione = posizione;
  }

  List<SlotData> getDisponibilita() {
    return this._disponibilita;
  }

  void setDisponibilita(List<SlotData> disponibilita) {
    this._disponibilita = disponibilita;
  }

  @override
  String toString() {
    return "Ombrellone{" +
        "idOmbrellone='" +
        idOmbrellone +
        '\'' +
        ", prezzo=" +
        _prezzo.toString() +
        ", posizione=" +
        _posizione.toString() +
        ", disponibilita=" +
        _disponibilita.toString() +
        '}';
  }
}
