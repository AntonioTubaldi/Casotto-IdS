import '../models/SlotData.dart';

class AddPrenotazioneViewArgs {
  late String idUtente;
  late String idOmbrellone;
  late List<SlotData> dataPrenotazione;
  late int numeroLettini;
  late int numeroSdraio;

  AddPrenotazioneViewArgs(String idUtente, String idOmbrellone,
      List<SlotData> dataPrenotazione, int numeroLettini, int numeroSdraio) {
    this.idUtente = idUtente;
    this.idOmbrellone = idOmbrellone;
    this.dataPrenotazione = dataPrenotazione;
    this.numeroLettini = numeroLettini;
    this.numeroSdraio = numeroSdraio;
  }
}
