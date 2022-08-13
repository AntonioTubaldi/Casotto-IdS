import 'package:casotto/models/SlotData.dart';

import '../models/Ombrellone.dart';

class SceltaLettiniViewArgs {
  late Ombrellone ombrellone1;
  late List<SlotData> lista;

  SceltaLettiniViewArgs(Ombrellone ombr, List<SlotData> list) {
    this.ombrellone1 = ombr;
    this.lista = list;
  }

}
