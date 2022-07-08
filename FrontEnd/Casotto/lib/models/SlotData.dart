import 'Giorno.dart';

class SlotData {
  late Giorno _durata;
  late DateTime _data;

  SlotData(Giorno durata, DateTime data) {
    this._durata = durata;
    this._data = data;
  }

  Giorno getDurata() {
    return this._durata;
  }

  void setDurata(Giorno durata) {
    this._durata = durata;
  }

  DateTime getData() {
    return this._data;
  }

  void setData(DateTime data) {
    this._data = data;
  }

  String getDurataString() {
    switch (this._durata) {
      case Giorno.MATTINA:
        return "MATTINA";
      case Giorno.POMERIGGIO:
        return "POMERIGGIO";
    }
  }

  String getDataString() {
    return "${this._data.day}/${this._data.month}/${this._data.year}";
  }

  @override
  String toString() {
    return "SlotData{" +
        " durata= " +
        _durata.toString() +
        ", data= " +
        _data.toString() +
        "}";
  }
}
