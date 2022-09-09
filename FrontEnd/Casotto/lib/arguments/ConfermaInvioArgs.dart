import 'package:casotto/models/Utente.dart';

class ConfermaInvioArgs {
  late Utente singleUtente;
  late String titolo;
  late String descrizione;

  ConfermaInvioArgs(Utente singleUtente, String titolo, String descrizione) {
    this.singleUtente = singleUtente;
    this.titolo = titolo;
    this.descrizione = descrizione;
  }
}
