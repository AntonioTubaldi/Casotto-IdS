import 'Prodotto.dart';

class Ordine{

  /*late String idOrdine;
  late String idUtente;
  late double costoTotale;*/
  late List<Prodotto> prodotti;
  // late StatoOrdine stato;

 Ordine(
    /* String idOrdine,
     String idUtente,
     double costoTotale,*/
     List<Prodotto> prodotti
     //StatoOrdine stato
     ){
  /* this.idOrdine = idOrdine;
   this.idUtente = idUtente;
   this.costoTotale = costoTotale;*/
   this.prodotti = prodotti;
   // this.stato = stato;
 }
/*
String getIdOrdine(){
   return idOrdine;
}

String getIdUtente(){
   return idUtente;
}

double getCostoTotale(){
   return costoTotale;
}
*/
List<Prodotto> getListProdotti(){
   return prodotti;
}

/*void setIdOrdine(String idOrdine){
   this.idOrdine = idOrdine;
}

void setIdUtente(String idUtente){
   this.idUtente = idUtente;
}

void setCostoTotale(double costoTotale){
   this.costoTotale = costoTotale;
}

void setListProdotti(List<Prodotto> prodotti ){
   this.prodotti = prodotti;
}*/

 @override
  String toString() {
    // TODO: implement toString
    return "${"Lista prodotti ordinati: $prodotti"}; ";
  }





}