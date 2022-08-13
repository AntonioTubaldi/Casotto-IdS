import '../models/Prodotto.dart';
import '../models/SlotData.dart';

class RiepilogoOrdinazioneViewArgs {
  late Prodotto prodotto;
  late List<Prodotto> lista;
  late int numeroProdotti;



  RiepilogoOrdinazioneViewArgs(Prodotto prodotto, List<Prodotto> lista,
      int numeroProdotti) {
   this.prodotto = prodotto;
    this.lista = lista;
    this.numeroProdotti = numeroProdotti;

  }
}