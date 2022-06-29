import 'SlotData.dart';

class ParametriPrenotazione {
  late String idUtente;
  late String idOmbrellone;
  late double costoTotale;
  late List<SlotData> dataPrenotazione;

  ParametriPrenotazione(String idUtente, String idOmbrellone,
      double costoTotale, List<SlotData> dataPrenotazione) {
    this.idUtente = idUtente;
    this.idOmbrellone = idOmbrellone;
    this.costoTotale = costoTotale;
    this.dataPrenotazione = dataPrenotazione;
  }
}
