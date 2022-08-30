import 'package:casotto/models/SlotData.dart';

import '../models/Ombrellone.dart';

class SceltaLettiniViewArgs {
  late Attrezzatura ombrellone1;
  late List<SlotData> lista;

  SceltaLettiniViewArgs(Attrezzatura ombr, List<SlotData> list) {
    this.ombrellone1 = ombr;
    this.lista = list;
  }

}
