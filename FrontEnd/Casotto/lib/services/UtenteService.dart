import 'dart:convert';
import 'package:casotto/models/Notifica.dart';
import 'package:casotto/models/Ruolo.dart';
import 'package:casotto/models/Utente.dart';
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
        String idEvento = eventoObject["_id"];
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
}
