import '../models/SlotData.dart';

class AddPrenotazioneViewArgs {
  late String idUtente;
  late String idOmbrellone;

  late List<SlotData> dataPrenotazione;

  AddPrenotazioneViewArgs(
      String idUtente, String idOmbrellone, List<SlotData> dataPrenotazione) {
    this.idUtente = idUtente;
    this.idOmbrellone = idOmbrellone;

    this.dataPrenotazione = dataPrenotazione;
  }
}
