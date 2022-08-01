import 'SlotData.dart';

class Ombrellone {
  late String idOmbrellone;
  late double _prezzo;
  late int _posizione;
  late List<SlotData> _disponibilita;
  late double prezzoLettini;
  late double prezzoSdraio;

  Ombrellone(String idOmbrellone, double prezzo, int posizione,
      List<SlotData> disponibilita, double prezzoLettini, double prezzoSdraio) {
    this.idOmbrellone = idOmbrellone;
    this._prezzo = prezzo;
    this._posizione = posizione;
    this._disponibilita = disponibilita;
    this.prezzoLettini = prezzoLettini;
    this.prezzoSdraio = prezzoSdraio;
  }

  Ombrellone.nienteId(double prezzo, int posizione,
      List<SlotData> disponibilita, double prezzoLettini, double prezzoSraio) {
    this._prezzo = prezzo;
    this._posizione = posizione;
    this._disponibilita = disponibilita;
    this.prezzoLettini = prezzoLettini;
    this.prezzoSdraio = prezzoSdraio;
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

  double getPrezzoLettini() {
    return this.prezzoLettini;
  }

  void setPrezzoLettini(double prezzoLettini) {
    this.prezzoLettini = prezzoLettini;
  }

  double getPrezzoSdraio() {
    return this.prezzoSdraio;
  }

  void setPrezzoSdraio(double prezzoSdraio) {
    this.prezzoSdraio = prezzoSdraio;
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
        ", prezzo lettini: " +
        prezzoLettini.toString() +
        ", prezzo Sdraio: " +
        prezzoSdraio.toString() +
        '}';
  }
}
