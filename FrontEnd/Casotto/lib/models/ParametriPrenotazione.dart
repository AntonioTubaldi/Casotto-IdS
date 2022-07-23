import 'SlotData.dart';

class ParametriPrenotazione {
  late String idUtente;
  late String idOmbrellone;

  late List<SlotData> dataPrenotazione;

  ParametriPrenotazione(
      String idUtente, String idOmbrellone, List<SlotData> dataPrenotazione) {
    this.idUtente = idUtente;
    this.idOmbrellone = idOmbrellone;

    this.dataPrenotazione = dataPrenotazione;
  }
}
