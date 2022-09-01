import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/Evento.dart';

class UtenteService {
  String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/utente";

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
}
