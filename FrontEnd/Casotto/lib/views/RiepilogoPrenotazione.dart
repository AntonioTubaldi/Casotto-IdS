import 'package:flutter/material.dart';

import '../models/Giorno.dart';
import '../models/SlotData.dart';

class RiepilogoPrenotazioneView extends StatelessWidget {
  const RiepilogoPrenotazioneView({Key? key, required this.selezionati})
      : super(key: key);

  final List<SlotData> selezionati;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          selezionati.toString(),
          maxLines: 2,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
