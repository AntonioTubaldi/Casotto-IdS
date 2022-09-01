import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import '../models/Evento.dart';
import 'package:http/http.dart' as http;

class EventoService {
  final String _baseUrl = dotenv.env["BACKEND_URL"].toString() + "/evento";

  Future<List<Evento>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));

    Uri url = Uri.parse(_baseUrl + "/all");
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

  Future<bool> addEvento(String nome, DateTime data, TimeOfDay orarioInizio,
      int numeroMaxPartecipanti) async {
    Uri url = Uri.parse(_baseUrl + "/new");
    Response response = await http.post(url,
        body: jsonEncode({
          "nome": nome,
          "data": data.toIso8601String(),
          "orarioInizio":
              '${orarioInizio.hour.toString().padLeft(2, '0')}:${orarioInizio.minute.toString().padLeft(2, '0')}',
          "numeroMaxPartecipanti": numeroMaxPartecipanti
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> modificaEvento(String idEvento, DateTime data,
      TimeOfDay orarioInizio, int numeroMaxPartecipanti) async {
    Uri url = Uri.parse(_baseUrl + "/modifica/" + idEvento);
    Response response = await http.put(url,
        body: jsonEncode({
          "data": data.toIso8601String(),
          "orarioInizio":
              '${orarioInizio.hour.toString().padLeft(2, '0')}:${orarioInizio.minute.toString().padLeft(2, '0')}',
          "numeroMaxPartecipanti": numeroMaxPartecipanti
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }

  Future<bool> eliminaEvento(String idEvento) async {
    Uri url = Uri.parse(_baseUrl + "/delete/" + idEvento);
    Response response = await http.delete(url);
    bool responseBody = jsonDecode(response.body) as bool;
    return responseBody;
  }
}
