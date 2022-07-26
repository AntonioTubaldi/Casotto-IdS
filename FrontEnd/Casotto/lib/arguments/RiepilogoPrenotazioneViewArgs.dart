import 'package:casotto/models/SlotData.dart';

import '../models/Ombrellone.dart';

class RiepilogoPrenotazioneViewArgs {
  late Ombrellone ombrellone1;
  late List<SlotData> lista;

  RiepilogoPrenotazioneViewArgs(Ombrellone ombr, List<SlotData> list) {
    this.ombrellone1 = ombr;
    this.lista = list;
  }
}
