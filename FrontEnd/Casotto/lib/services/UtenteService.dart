import 'dart:convert';
import 'package:casotto/models/Notifica.dart';
import 'package:casotto/models/Ruolo.dart';
import 'package:casotto/models/Utente.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/Evento.dart';

class UtenteService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/utente";

  Future<List<Utente>> getAll() async {
    Uri url = Uri.parse(_baseUrl + "/all");
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Utente> toReturn = [];

    for (var utenteObject in responseBody) {
      String idUtente = utenteObject["idUtente"];
      String nome = utenteObject["nome"];
      String cognome = utenteObject["cognome"];

      List<Notifica> notificaToReturn = [];
      for (var notificaObject in utenteObject["notifiche"]) {
        String titolo = notificaObject["titolo"];
        String descrizione = notificaObject["descrizione"];

        Notifica notificaToAdd = Notifica(titolo, descrizione);
        notificaToReturn.add(notificaToAdd);
      }

      Ruolo ruolo = Ruolo.values
          .firstWhere((e) => e.toString() == "Ruolo." + utenteObject["ruolo"]);

      List<Evento> eventoToReturn = [];
      for (var eventoObject in utenteObject["eventiAderiti"]) {
        String idEvento = eventoObject["idEvento"];
        String nome = eventoObject["nome"];
        DateTime data = DateTime.parse(eventoObject["data"]);
        TimeOfDay orarioInizio = TimeOfDay(
            hour: int.parse(eventoObject["orarioInizio"].split(":")[0]),
            minute: int.parse(eventoObject["orarioInizio"].split(":")[1]));
        int numeroMaxPartecipanti = eventoObject["numeroMaxPartecipanti"];
        int numeroPartecipanti = eventoObject["numeroPartecipanti"];

        Evento eventoToAdd = Evento(idEvento, nome, data, orarioInizio,
            numeroMaxPartecipanti, numeroPartecipanti);
        eventoToReturn.add(eventoToAdd);
      }

      Utente utenteToAdd = Utente(
          idUtente, nome, cognome, notificaToReturn, ruolo, eventoToReturn);

      toReturn.add(utenteToAdd);
    }

    return toReturn;
  }

  Future<bool> iscrizioneEvento(String idUtente, String idEvento) async {
    Uri url = Uri.parse(_baseUrl + "/iscrizione/" + idUtente + "/" + idEvento);
    Response response = await http.put(url);
    print(response.body);
    bool responseBody = jsonDecode(response.body) as bool;

    return responseBody;
  }

  Future<List<Evento>> visualizzaEventiAderiti(String idUtente) async {
    Uri url = Uri.parse(_baseUrl + "/visualizza/" + idUtente);
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);
    List<Evento> toReturn = [];
    for (var eventoObject in responseBody) {
      String idEvento = eventoObject["idEvento"];
      String nome = eventoObject["nome"];
      DateTime data = DateTime.parse(eventoObject["data"]);
      TimeOfDay orarioInizio = TimeOfDay(
          hour: int.parse(eventoObject["orarioInizio"].split(":")[0]),
          minute: int.parse(eventoObject["orarioInizio"].split(":")[1]));
      int numeroMaxPartecipanti = eventoObject["numeroMaxPartecipanti"];
      int numeroPartecipanti = eventoObject["numeroPartecipanti"];

      Evento eventoToAdd = Evento(idEvento, nome, data, orarioInizio,
          numeroMaxPartecipanti, numeroPartecipanti);

      toReturn.add(eventoToAdd);
    }

    return toReturn;
  }

  Future<bool> inviaMessaggio(
      String idUtente, String titolo, String descrizione) async {
    Uri url = Uri.parse(_baseUrl + "/notifica/" + idUtente);
    Response response = await http.put(
      url,
      body: jsonEncode(
        {"titolo": titolo, "descrizione": descrizione},
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    bool responseBody = jsonDecode(response.body) as bool;

    return responseBody;
  }

  Future<List<Notifica>> visualizzaMessaggi(String idUtente) async {
    Uri url = Uri.parse(_baseUrl + "/messaggi/" + idUtente);
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    List<Notifica> toReturn = [];
    for (var notificaObject in responseBody) {
      String titolo = notificaObject["titolo"];
      String descrizione = notificaObject["descrizione"];

      Notifica notificaToAdd = Notifica(titolo, descrizione);
      toReturn.add(notificaToAdd);
    }

    return toReturn;
  }

  Future<bool> createUtente(
      String idUtente, String nome, String cognome, Ruolo ruolo) async {
    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(
      url,
      body: jsonEncode({
        "idUtente": idUtente,
        "nome": nome,
        "cognome": cognome,
        "ruolo": EnumToString.convertToString(ruolo),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<Ruolo> getRuolo(String idUtente) async {
    Uri url = Uri.parse(_baseUrl + "/" + idUtente);
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);
    print("risultato chiamata service: " + responseBody);

    /*dynamic responseBody = jsonDecode(response.body);*/
    Ruolo ruolo =
        Ruolo.values.firstWhere((e) => e.toString() == "Ruolo." + responseBody);
    return ruolo;
  }

  Future<void> setRuolo(String idUtente) async {
    Uri url = Uri.parse(_baseUrl + "/set/" + idUtente);
    Response response = await http.put(url);
  }

  Future<Utente> getUtenteById(String idUtente) async {
    Uri url = Uri.parse(_baseUrl + "/get/" + idUtente);
    Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    String idUtente2 = responseBody["idUtente"];
    String nome = responseBody["nome"];
    String cognome = responseBody["cognome"];

    List<Notifica> notificaToReturn = [];
    for (var notificaObject in responseBody["notifiche"]) {
      String titolo = notificaObject["titolo"];
      String descrizione = notificaObject["descrizione"];

      Notifica notificaToAdd = Notifica(titolo, descrizione);
      notificaToReturn.add(notificaToAdd);
    }

    Ruolo ruolo = Ruolo.values
        .firstWhere((e) => e.toString() == "Ruolo." + responseBody["ruolo"]);

    List<Evento> eventoToReturn = [];
    for (var eventoObject in responseBody["eventiAderiti"]) {
      String idEvento = eventoObject["idEvento"];
      String nome = eventoObject["nome"];
      DateTime data = DateTime.parse(eventoObject["data"]);
      TimeOfDay orarioInizio = TimeOfDay(
          hour: int.parse(eventoObject["orarioInizio"].split(":")[0]),
          minute: int.parse(eventoObject["orarioInizio"].split(":")[1]));
      int numeroMaxPartecipanti = eventoObject["numeroMaxPartecipanti"];
      int numeroPartecipanti = eventoObject["numeroPartecipanti"];

      Evento eventoToAdd = Evento(idEvento, nome, data, orarioInizio,
          numeroMaxPartecipanti, numeroPartecipanti);
      eventoToReturn.add(eventoToAdd);
    }

    Utente utenteToAdd = Utente(
        idUtente2, nome, cognome, notificaToReturn, ruolo, eventoToReturn);

    return utenteToAdd;
    //}
  }
}
