import 'package:flutter/material.dart';

import '../models/Giorno.dart';
import '../models/Ombrellone.dart';
import '../models/SlotData.dart';

class RiepilogoPrenotazioneView extends StatelessWidget {
  const RiepilogoPrenotazioneView({
    Key? key,
    required this.selezionati,
  }) : super(key: key);

  final List<SlotData> selezionati;

  Widget _getRiepilogoData(List<SlotData> selezionati1) {
    List<SlotData> dataToReturn = [];
    for (var dataObject in selezionati1) {
      Giorno durata = Giorno.values.firstWhere(
          (e) => e.toString() == "Giorno." + dataObject.getDurataString());
      DateTime data = dataObject.getData();
      SlotData slotDataToAdd = SlotData(durata, data);
      dataToReturn.add(slotDataToAdd);
    }
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text(
          "Riepilogo prenotazione:  + $dataToReturn",
        ),
      ),
    );
  }

  /* List<Widget> _getSlotDataTabs(List<SlotData> selezionati) {
    return selezionati.map(SlotData daRitornare) {
      return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ElevatedButton(onPressed: () => {}, child: Text("Riepilogo prenotazione: " +  daRitornare.getDataString() + daRitornare.getDurataString()),),
         ElevatedButton(onPressed: () => {}, child: Text("Costo totale: 50")),
         ],
         ),

      );
    };
  }
  */

  @override
  Widget build(BuildContext context) {
    return _getRiepilogoData(selezionati);
  }
}
