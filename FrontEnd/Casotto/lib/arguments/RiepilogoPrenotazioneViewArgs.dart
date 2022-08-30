import 'package:casotto/models/SlotData.dart';

import '../models/Ombrellone.dart';

class RiepilogoPrenotazioneViewArgs {
  late Attrezzatura ombrellone1;
  late List<SlotData> lista;
  late int numeroLettini;
  late int numeroSdraio;

  RiepilogoPrenotazioneViewArgs(Attrezzatura ombr, List<SlotData> list,
      int numeroLettini, int numeroSdraio) {
    this.ombrellone1 = ombr;
    this.lista = list;
    this.numeroLettini = numeroLettini;
    this.numeroSdraio = numeroSdraio;
  }
}
